#!/usr/bin/env python3

from kafka import KafkaConsumer

consumer = KafkaConsumer('colin_test_20201005', bootstrap_servers='b-2.msk-dev.c8r1hr.c1.kafka.us-west-2.amazonaws.com:9092,b-3.msk-dev.c8r1hr.c1.kafka.us-west-2.amazonaws.com:9092,b-1.msk-dev.c8r1hr.c1.kafka.us-west-2.amazonaws.com:9092')

for msg in consumer:
    print (msg)
