FROM python:3.12-slim

WORKDIR /app

RUN pip install prometheus-client

COPY exporter.py .

CMD ["python", "exporter.py"]
