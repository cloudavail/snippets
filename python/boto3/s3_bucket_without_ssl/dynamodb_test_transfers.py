#!/usr/bin/env python3

import boto3

dynamodb_client_use_ssl_false = boto3.client('dynamodb', use_ssl=False)
list_tables_response = dynamodb_client_use_ssl_false.list_tables()

print(list_tables_response)

scan_response = dynamodb_client_use_ssl_false.scan(TableName='test')
print(scan_response)
