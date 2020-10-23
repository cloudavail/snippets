#!/usr/bin/env python3

import boto3
import botocore

dynamodb_client_use_ssl_false = boto3.client('dynamodb', use_ssl=False)

dynamodb_client_use_ssl_true = boto3.client('dynamodb', use_ssl=True)

try:
    list_tables_response = dynamodb_client_use_ssl_false.list_tables()
    print('List Tables without SSL')
except botocore.exceptions.ClientError as e:
    print(e)

# perform a "put"
try:
    list_tables_response_with_ssl = dynamodb_client_use_ssl_true.list_tables()
    print('List Tables with SSL')
except botocore.exceptions.ClientError as e:
    print(e)

print(list_tables_response_with_ssl)

try:
    list_tables_response_without_ssl = dynamodb_client_use_ssl_false.scan(TableName='test')
    print('Scan Table without SSL')
    print(list_tables_response_without_ssl)
except botocore.exceptions.ClientError as e:
    print(e)


try:
    list_tables_response_with_ssl = dynamodb_client_use_ssl_true.scan(TableName='test')
    print('Scan Table with SSL')
    print(list_tables_response_with_ssl)
except botocore.exceptions.ClientError as e:
    print(e)
