import boto3
import json
import os

ssm_client = boto3.client('ssm')
my_api_key_parameter = ssm_client.get_parameter(Name='my_api_key')
my_api_key = my_api_key_parameter['Parameter']['Value']

def hello(event, context):
    body = {
        "message": "MY_API_KEY is: {}".format(my_api_key),
        "input": event
    }
    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
