# Overview

This snippet creates an AWS Lambda function (using serverless) that accesses a secrets manager secret through referencing a
parameter store parameter (during the time of deployment) and uses the value as an Environment Variable during runtime.

# Security Note

The Environment Variable will be exposed, in plain-text, in the AWS Console.

## Deployment
```
export AWS_PROFILE='cloudavail'
serverless deploy
```

## Invoke 

```
serverless invoke --function hello
```

## Invoke Locally
```
serverless invoke -l --function hello
```

## Logs
```
serverless logs --function hello
```