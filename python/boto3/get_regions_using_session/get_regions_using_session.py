#!/usr/bin/env python
import boto3

session = boto3.session.Session()

regions_by_service = list()

for service in session.get_available_services():
    regions_return = session.get_available_regions(service)
    regions_by_service.append(service + str(regions_return))

print regions_by_service
