#!/bin/bash

# Install pip and grpc
python3 -m pip install --upgrade pip
python3 -m pip install grpcio
python3 -m pip install grpcio-tools

# Copy from s3 bucket
aws s3 cp s3://minasbucket/grpc/greeter_server.py ./
aws s3 cp s3://minasbucket/grpc/helloworld_pb2.py ./
aws s3 cp s3://minasbucket/grpc/helloworld_pb2_grpc.py ./

# Run server
python3 greeter_server.py
