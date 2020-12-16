#!/usr/bin/env python3

import boto3

s3_client_use_ssl_false = boto3.client('s3', use_ssl=False)
response = s3_client_use_ssl_false.list_buckets()


s3_client_use_ssl_true = boto3.client('s3', use_ssl=True)
response = s3_client_use_ssl_true.list_buckets()

try:
    response = s3_client_use_ssl_false.upload_file(file_name, bucket, object_name)
except ClientError as e:
    logging.error(e)
    return False
return True


