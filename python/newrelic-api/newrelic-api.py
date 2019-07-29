#!/usr/bin/env python

from newrelic_api import AlertPolicies

alert_policies = AlertPolicies().list()

print alert_policies
