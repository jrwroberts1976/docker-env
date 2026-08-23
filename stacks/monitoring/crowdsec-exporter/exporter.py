#!/usr/bin/env python3

import subprocess
import time

from prometheus_client import Gauge, start_http_server


dropped_packets = Gauge(
    "crowdsec_firewall_dropped_packets",
    "Packets dropped by CrowdSec firewall"
)

dropped_bytes = Gauge(
    "crowdsec_firewall_dropped_bytes",
    "Bytes dropped by CrowdSec firewall"
)


def read_counters():
    try:
        result = subprocess.run(
            [
                "iptables",
                "-L",
                "CROWDSEC_CHAIN",
                "-n",
                "-v",
                "-x"
            ],
            capture_output=True,
            text=True,
            check=True
        )

        packets = 0
        bytes_count = 0

        for line in result.stdout.splitlines():
            if "crowdsec-blacklists" in line:
                fields = line.split()

                packets += int(fields[0])
                bytes_count += int(fields[1])

        dropped_packets.set(packets)
        dropped_bytes.set(bytes_count)

    except Exception as error:
        print(f"Error reading CrowdSec counters: {error}")


start_http_server(9101, addr="192.168.2.220")

while True:
    read_counters()
    time.sleep(5)
