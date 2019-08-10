import json
import os


def hello(event, context):
    my_api_key = os.environ['MY_API_KEY']
    body = {
        "message": "MY_API_KEY is: {}".format(my_api_key),
        "input": event
    }
    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
