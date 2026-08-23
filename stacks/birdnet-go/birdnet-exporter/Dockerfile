FROM python:3.12-slim

ARG BUILD_REVISION=unknown
ARG BUILD_CREATED=unknown
ARG BUILD_SOURCE=https://github.com/jrwroberts1976/docker-env

LABEL org.opencontainers.image.title="BirdNET Prometheus Exporter" \
      org.opencontainers.image.description="Prometheus metrics exporter for the local BirdNET database" \
      org.opencontainers.image.source="$BUILD_SOURCE" \
      org.opencontainers.image.revision="$BUILD_REVISION" \
      org.opencontainers.image.created="$BUILD_CREATED"

WORKDIR /app

RUN pip install --no-cache-dir prometheus-client

COPY exporter.py .

CMD ["python", "exporter.py"]
