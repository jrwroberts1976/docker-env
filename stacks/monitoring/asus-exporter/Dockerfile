FROM python:3.13-alpine

RUN apk add --no-cache openssh-client

WORKDIR /app

COPY exporter.py /app/exporter.py

RUN chmod +x /app/exporter.py

EXPOSE 9106

CMD ["python3", "/app/exporter.py"]
