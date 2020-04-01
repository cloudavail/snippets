#!/usr/bin/env python

import os

from newrelic_telemetry_sdk import GaugeMetric, MetricClient

metric_client = MetricClient(os.environ['NEW_RELIC_INSERT_KEY'])

temperature = GaugeMetric("temperature", 78.6, {"units": "Farenheit"})

response = metric_client.send(temperature)
