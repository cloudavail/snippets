# Overview

This snippet creates an AWS Lambda function (using serverless) that accesses a parameter store parameter (during the time of deployment) and uses the value as an Environment Variable during runtime.

# Security Note

The Environment Variable will be exposed, in plain-text, in the AWS Console.