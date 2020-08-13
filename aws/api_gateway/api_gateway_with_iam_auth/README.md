# Overview
The purpose of this stack is to build an API Gateway.

# To Do

Resolve issue with use of "Mock" endpoints.

# Setup Initial Stack

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway_with_iam_auth.yaml`

## Create an APIGatewayWithIAMAuth Stack

`aws cloudformation create-stack --stack-name APIGatewayWithIAMAuth --template-body file://api_gateway_with_iam_auth.yaml`

## Update an APIGatewayWithIAMAuth Stack

`aws cloudformation update-stack --stack-name APIGatewayWithIAMAuth --template-body file://api_gateway_with_iam_auth.yaml`

## Delete an APIGatewayWithIAMAuth Stack

`aws cloudformation delete-stack --stack-name APIGatewayWithIAMAuth`

# Testing

## No Auth

```
colinjohnson@cjohnson07 api_gateway_with_iam_auth % curl https://4f4ldfr0oe.execute-api.us-west-2.amazonaws.com/test/noauth
{"message": "Internal server error"}%
```

## Auth

The below example fails because no signature has been provided.

```
curl https://4f4ldfr0oe.execute-api.us-west-2.amazonaws.com/test/iamauth
{"message":"Missing Authentication Token"}%
```

The below example succeeds because a valid signature has been provided.

```
./get_with_iam_auth.py 
b'{"message": "Internal server error"}'
```

The below example fails because an expired signature has been provided.

```
curl --header "Authorization: AWS4-HMAC-SHA256 Credential=AKIASXIEDV6PPBHEB3MA/20200813/us-west-2/execute-api/aws4_request, SignedHeaders=host;x-amz-date, Signature=80c872114900cc76b20b43e51153b01eede71a9b4fb1de0085436d680513ee72" \
 --header "x-amz-date: 20200813T021041Z" \
 https://4f4ldfr0oe.execute-api.us-west-2.amazonaws.com/test/iamauth
```

The below example fails because an invalid signature has been provided.

```
curl --header "Authorization: AWS4-HMAC-SHA256 Credential=AKIASXIEDV6PPBHEC4NB/20200813/us-west-2/execute-api/aws4_request, SignedHeaders=host;x-amz-date, Signature=80c872114900cc76b20b43e51153b01eede71a9b4fb1de0085436d680513ee72" \
 --header "x-amz-date: 20200813T022126Z" \
 https://4f4ldfr0oe.execute-api.us-west-2.amazonaws.com/test/iamauth

{"message":"The security token included in the request is invalid."}%
```
