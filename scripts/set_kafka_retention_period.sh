#!/usr/bin/env bash

set -xe

TRAINING_COHORT=$1

echo "====Updating Kafka Properties===="
ssh kafka.${TRAINING_COHORT}.training <<EOF
sudo su root
mkdir -p /data/kafka
systemctl stop confluent-kafka
systemctl stop confluent-zookeeper
sed -i -e 's/log.retention.hours=1/log.retention.hours=3/g' /etc/kafka/server.properties
systemctl start confluent-zookeeper
systemctl start confluent-kafka
EOF
echo "====Updating Kafka Properties Done===="

