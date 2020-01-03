# Overview

This snippet creates an AWS Lambda function (using serverless) that accesses a parameter store parameter (during runtime). Lambda functions can utilize Environment Variables for configuration options, but those configurations can expose Environment Variables in the AWS Console (or, presumably, via accessing lambda function configuration).
