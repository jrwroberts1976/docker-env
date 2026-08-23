FROM python:3.13-slim

ARG BUILD_REVISION=unknown
ARG BUILD_CREATED=unknown
ARG BUILD_SOURCE=https://github.com/jrwroberts1976/docker-env

LABEL org.opencontainers.image.title="CrowdSec Firewall Metrics Exporter" \
      org.opencontainers.image.description="Prometheus exporter for local CrowdSec firewall counters" \
      org.opencontainers.image.source="$BUILD_SOURCE" \
      org.opencontainers.image.revision="$BUILD_REVISION" \
      org.opencontainers.image.created="$BUILD_CREATED"

RUN apt-get update \
    && apt-get install -y --no-install-recommends iptables \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY exporter.py .

CMD ["python", "/app/exporter.py"]
