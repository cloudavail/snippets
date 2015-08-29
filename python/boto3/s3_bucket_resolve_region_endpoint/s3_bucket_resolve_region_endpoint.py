#!/usr/bin/env python

import logging

import boto3


logging.basicConfig(level='INFO')


def location_constraint_to_region_endpoint(location_constraint):
    logging.info('location_constraint is: {!s}'.format(location_constraint))
    if location_constraint == 'EU':
        region_endpoint = 'eu-west-1'
    else:
        region_endpoint = location_constraint
    logging.info('region endpoint is: {!s}'.format(region_endpoint))
    return region_endpoint


s3_resource = boto3.resource('s3')
s3_client = s3_resource.meta.client

for bucket in s3_resource.buckets.all():
    logging.info('examining bucket: {!s}'.format(bucket.name))
    bucket_location = s3_client.get_bucket_location(Bucket=bucket.name)
    if bucket_location['LocationConstraint'] is not None:
        region_endpoint = location_constraint_to_region_endpoint(bucket_location['LocationConstraint'])
        s3_regional_resource = boto3.resource('s3', region_name=region_endpoint)
        bucket_regional = s3_regional_resource.Bucket(bucket.name)
        logging.info('bucket {!s} location constraint is: {!s}'.format(bucket.name,
                                                                       bucket_location['LocationConstraint']))
    else:
        logging.info('bucket {!s} location constraint is: {!s}'.format(bucket.name,
                                                                       bucket_location['LocationConstraint']))
