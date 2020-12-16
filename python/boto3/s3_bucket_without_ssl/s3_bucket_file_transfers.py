#!/usr/bin/env python3

import boto3

bucket_name='colinjohnson-test'
file_name_with_ssl='./file_transmitted_with_ssl.txt'
file_name_without_ssl='./file_transmitted_without_ssl.txt'
object_name_with_ssl='file_transmitted_with_ssl.txt'
object_name_without_ssl='file_transmitted_without_ssl.txt'

s3_client_use_ssl_false = boto3.client('s3', use_ssl=False)
response = s3_client_use_ssl_false.list_buckets()

s3_client_use_ssl_true = boto3.client('s3', use_ssl=True)
response = s3_client_use_ssl_true.list_buckets()

# perform a "put"
try:
    response = s3_client_use_ssl_false.upload_file(file_name_without_ssl, bucket_name, object_name_without_ssl)
    print('File Uploaded without SSL')
except boto3.exceptions.S3UploadFailedError as e:
    print(e)

# perform a "put"
try:
    response = s3_client_use_ssl_true.upload_file(file_name_with_ssl, bucket_name, object_name_with_ssl)
    print('File Uploaded with SSL')
except ClientError as e:
    print(error(e))
