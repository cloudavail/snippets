#Overview

This snippet will:

Build a gRPC application that runs on an ec2 instance generated from a CloudFormation Stack with and without a 
Load Balancer

Note: The files greeter_server.py, grpc_hellworld_pb2.py, and helloworld_pb2_grpc.py
remain the same when using a load balancer as when not. 

##Run the Server

1. Use the ec2.yaml file to create a stack in cloudformation and ssh in

2. Run the grpc_hellworld.sh script that will:
    1. Install pip and gRPC 
    2. Copy greeter_server.py, grpc_hellworld_pb2.py, and helloworld_pb2_grpc.py onto the server from minasbucket in s3
    3. Run greeter_server.py
    
##Run the Client

In a separate tab, run greeter_client.py


##Reference: 

- gRPC Quickstart Helloworld App: https://grpc.io/docs/languages/python/quickstart/
- AWS gRPC with a Load Balancer: https://aws.amazon.com/blogs/aws/new-application-load-balancer-support-for-end-to-end-http-2-and-grpc/