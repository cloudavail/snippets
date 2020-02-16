# Overview

The purpose of this snippet is to build an private API Gateway within a VPC but to provide a mechanism for clients (typically a developer's workstation) outside of that VPC to utilize the API Gateway through some means. In our particular case, the instructions below utilize a bastion host.

# Setting up the API Gateway in VPC Stack

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway_private_in_vpc.yaml`

## Create a Private API Gateway in VPC Stack

`aws2 cloudformation create-stack --stack-name api-gateway-private-vpc --template-body file://api_gateway_private_in_vpc.yaml`

## Update a Private API Gateway in VPC Stack

`aws2 cloudformation update-stack --stack-name api-gateway-private-vpc --template-body file://api_gateway_private_in_vpc.yaml`

## Delete a Private API Gateway in VPC Stack

`aws2 cloudformation delete-stack --stack-name api-gateway-private-vpc`

# Accessing from within a VPC

To access within a VPC, simply login to the server created witin the `api-gateway-private-vpc` stack.

# Accessing outside of the VPC

## Setup an SSH Tunnel

`ssh -i ~/Downloads/api-gateway-test-server.pem -L 8443:$ip_of_api_gateway_network_interface:443 ubuntu@$hostname_of_bastion_host`

Of, if you have a DNS entry setup for the API Gateway, you could substitute `$ip_of_api_gateway_network_interface` with `$dns_name_of_api_gateway`. Keep in mind that `$dns_name_of_api_gateway` is likely going to resolve the IP address of the hostname one time, which is not the behavior of http clients (which would use different IP addresses for connections).

The end result with look akin to the following:

`ssh -i ~/Downloads/api-gateway-test-server.pem -L 8443:10.0.0.42:443 ubuntu@54.187.224.11`


## Curl via the SSH Tunnel

Note that it is critical that the host header be passed (example: `--header "Host: 3xp7teohnb.execute-api.us-west-2.amazonaws.com"`) otherwise the return from the load balancer will be with an HTTP Status Code 403 and the content `{"message":"Forbidden"}`.

`curl --header "Host: 3xp7teohnb.execute-api.us-west-2.amazonaws.com" --insecure https://localhost:8443/prod/test/`

## Expected Output

The expected output should be that of CloudAvail's own website.
