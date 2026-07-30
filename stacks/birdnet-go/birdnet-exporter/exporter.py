from prometheus_client import start_http_server, Gauge
import sqlite3
import time
from datetime import datetime


DB = "/data/birdnet.db"


detections_total = Gauge(
    "birdnet_detections_total",
    "Total BirdNET detections"
)

detections_today = Gauge(
    "birdnet_detections_today",
    "BirdNET detections today"
)

activity_by_hour = Gauge(
    "birdnet_detections_by_hour",
    "BirdNET detections by hour",
    ["hour"]
)

activity_by_day = Gauge(
    "birdnet_detections_by_day",
    "BirdNET detections by day",
    ["date"]
)

species_count = Gauge(
    "birdnet_species_detections_total",
    "BirdNET detections by species",
    ["species"]
)

species_confidence = Gauge(
    "birdnet_species_confidence_average",
    "Average confidence by species",
    ["species"]
)

species_last_seen = Gauge(
    "birdnet_species_last_seen_timestamp",
    "Last detection timestamp by species",
    ["species"]
)


def update_metrics():

    conn = sqlite3.connect(DB)
    cur = conn.cursor()


    # Total detections
    cur.execute("""
        SELECT COUNT(*)
        FROM detections
        WHERE unlikely = 0
    """)

    detections_total.set(cur.fetchone()[0])


    # Today
    today = datetime.now().strftime("%Y-%m-%d")

    cur.execute("""
        SELECT COUNT(*)
        FROM detections
        WHERE unlikely = 0
        AND date(detected_at,'unixepoch') = ?
    """, (today,))

    detections_today.set(cur.fetchone()[0])


    # Activity by hour
    cur.execute("""
        SELECT
            strftime('%H', detected_at,'unixepoch'),
            COUNT(*)
        FROM detections
        WHERE unlikely = 0
        GROUP BY 1
    """)

    for hour, count in cur.fetchall():
        activity_by_hour.labels(hour).set(count)


    # Daily activity (last 30 days)
    cur.execute("""
        SELECT
            date(detected_at,'unixepoch'),
            COUNT(*)
        FROM detections
        WHERE unlikely = 0
        GROUP BY 1
        ORDER BY 1 DESC
        LIMIT 30
    """)

    for date, count in cur.fetchall():
        activity_by_day.labels(date).set(count)


    # Species stats
    cur.execute("""
        SELECT
            l.scientific_name,
            COUNT(*),
            AVG(d.confidence),
            MAX(d.detected_at)
        FROM detections d
        JOIN labels l ON d.label_id=l.id
        WHERE d.unlikely = 0
        GROUP BY l.scientific_name
    """)


    for species, count, confidence, last_seen in cur.fetchall():

        # Ignore obvious noise
        if species in ("Engine",):
            continue

        species_count.labels(species).set(count)

        species_confidence.labels(species).set(
            round(confidence,3)
        )

        species_last_seen.labels(species).set(
            last_seen
        )


    conn.close()



if __name__ == "__main__":

    start_http_server(9105)

    while True:
        update_metrics()
        time.sleep(60)
