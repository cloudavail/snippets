# Overview

This snippet will:

Build a gRPC application that runs on an EC2 instance generated from a CloudFormation Stack with and without a 
Load Balancer

Note: The files greeter_server.py, grpc_hellworld_pb2.py, and helloworld_pb2_grpc.py
remain the same when using a load balancer as when not. 


## Get Files from Git
Clone the repository to get the code:  
`git clone https://github.com/cloudavail/snippets.git`

Navigate to the grpc directory:
1. basic gRPC:  
`cd grpc/basic_grpc`
2. gRPC with a load balancer:  
`cd grpc/basic_grpc_with_load_balancer`

## Build an EC2 Instance in CloudFormation

### Validate CloudFormation via Command Line

`aws cloudformation validate-template --template-body file://ec2.yaml`

### Create the EC2 Instance stack

`aws cloudformation create-stack --stack-name grpc-helloworld --template-body file://ec2.yaml`


1. Use the ec2.yaml file to create a stack in cloudformation and ssh into the EC2 instance 

2. Run the grpc_hellworld.sh script that will:
    1. Install pip and gRPC 
    2. Copy greeter_server.py, grpc_hellworld_pb2.py, and helloworld_pb2_grpc.py onto the server from minasbucket in s3
    3. Run greeter_server.py
    
## Run the Client

In a separate tab, run greeter_client.py

## Reference: 

- gRPC Quickstart Helloworld App: https://grpc.io/docs/languages/python/quickstart/
- AWS gRPC with a Load Balancer: https://aws.amazon.com/blogs/aws/new-application-load-balancer-support-for-end-to-end-http-2-and-grpc/
