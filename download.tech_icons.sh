#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p site/images/tech

# Download each icon
echo "Downloading Python icon..."
curl -s "https://simpleicons.org/icons/python.svg" -o "site/images/tech/python.svg"

echo "Downloading Django icon..."
curl -s "https://simpleicons.org/icons/django.svg" -o "site/images/tech/django.svg"

echo "Downloading Flask icon..."
curl -s "https://simpleicons.org/icons/flask.svg" -o "site/images/tech/flask.svg"

echo "Downloading JavaScript icon..."
curl -s "https://simpleicons.org/icons/javascript.svg" -o "site/images/tech/javascript.svg"

echo "Downloading React icon..."
curl -s "https://simpleicons.org/icons/react.svg" -o "site/images/tech/react.svg"

echo "Downloading Angular icon..."
curl -s "https://simpleicons.org/icons/angular.svg" -o "site/images/tech/angular.svg"

echo "Downloading Elasticsearch icon..."
curl -s "https://simpleicons.org/icons/elasticsearch.svg" -o "site/images/tech/elasticsearch.svg"

echo "Downloading Kafka icon..."
curl -s "https://simpleicons.org/icons/apachekafka.svg" -o "site/images/tech/kafka.svg"

echo "Downloading InfluxDB icon..."
curl -s "https://simpleicons.org/icons/influxdb.svg" -o "site/images/tech/influxdb.svg"

echo "Downloading PowerBI icon..."
curl -s "https://simpleicons.org/icons/powerbi.svg" -o "site/images/tech/powerbi.svg"

echo "Downloading Grafana icon..."
curl -s "https://simpleicons.org/icons/grafana.svg" -o "site/images/tech/grafana.svg"

echo "Downloading Prometheus icon..."
curl -s "https://simpleicons.org/icons/prometheus.svg" -o "site/images/tech/prometheus.svg"

echo "Downloading Docker icon..."
curl -s "https://simpleicons.org/icons/docker.svg" -o "site/images/tech/docker.svg"

echo "Downloading AWS icon..."
curl -s "https://simpleicons.org/icons/amazonaws.svg" -o "site/images/tech/aws.svg"

echo "Downloading GCP icon..."
curl -s "https://simpleicons.org/icons/googlecloud.svg" -o "site/images/tech/gcp.svg"

echo "Downloading Git icon..."
curl -s "https://simpleicons.org/icons/git.svg" -o "site/images/tech/git.svg"

echo "Downloading Jenkins icon..."
curl -s "https://simpleicons.org/icons/jenkins.svg" -o "site/images/tech/jenkins.svg"

echo "All icons downloaded successfully!"
