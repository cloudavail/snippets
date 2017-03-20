#!/usr/bin/env python

import boto3
import datetime
import json

from flask import Flask
from flask import Response, request

import boto3_client_use


def datetime_handler(x):
    if isinstance(x, datetime.datetime):
        return x.isoformat()
    raise TypeError("Unknown type")


app = Flask(__name__)


@app.route("/")
def root():
    # when run via web, I will not be able to set profile via "export"
    # so I must accept as parameters
    # http://127.0.0.1:5000/?aws_region=us-east-1&profile_name=inpwrd
    aws_profile_name = request.args.get('profile_name')
    # note that this should be called "aws_default_region" to match the AWS CLI
    # convention - but I have intentionally modified this behavior
    aws_region = request.args.get('aws_region')
    # if request.args.get('profile_name') and request.args.get('aws_region')
    # both return None, then the default aws_profile and region will be used
    print 'aws_profile_name: {}'.format(aws_profile_name)
    print 'aws_region: {}'.format(aws_region)
    session = boto3.Session(profile_name=aws_profile_name, region_name=aws_region)
    client = session.client('ec2')
    all_instances = boto3_client_use.describe_all_instances(client)
    resp = Response(json.dumps(all_instances, default=datetime_handler))
    return resp


if __name__ == "__main__":
    app.run()
