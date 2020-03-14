# Overview

The CloudFormation file `cloudfront_redirect_all_index_s3.yaml` in this directory will create a basic CloudFront distribution.

# Setup Infrastructure for Testing

## Validate Templates

`aws2 cloudformation validate-template --template-body file://cloudfront_redirect_all_index_s3.yaml`

## Create Stack

`aws2 cloudformation create-stack --stack-name CloudFrontWithRedirectS3 --template-body file://cloudfront_redirect_all_index_s3.yaml`

## Update Stack

`aws2 cloudformation update-stack --stack-name CloudFrontWithRedirectS3 --template-body file://cloudfront_redirect_all_index_s3.yaml`

## Delete Stack

`aws2 cloudformation delete-stack --stack-name CloudFrontWithRedirectS3`

## Upload index.html File

- Upload file file `/index.html`
- Make file Public

# Tests

## S3 Testing (Direct) with CustomOriginConfig

- test request of `''` via request of file `''` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `/` via request of file `/` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `index.html` via request of file `index.html` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `/notavailable.html` via request of file `/notavailable.html` in S3 bucket. Note response code (200) and returned html (content of `/index.html`).

## S3 Testing (through CDN) with  CustomOriginConfig and No CDN Index/Error Configuration

- test request of `''` via request of file `''` in CDN. Note reponse code (200).
- test request of file `/` via request of file `/` in S3 bucket. Note response code (200).
- test request of file `index.html` via request of file `index.html` in S3 bucket. Note response code (200).
- test request of file `notavailable.html` via request of file `/notavailable.html` in S3 bucket. Note response code (403).

## S3 Testing (through CDN) with  CustomOriginConfig and CDN Index/Error Configuration

- test request of `''` via request of file `''` in CDN. Note reponse code (200).
- test request of file `/` via request of file `/` in S3 bucket. Note response code (200).
- test request of file `index.html` via request of file `index.html` in S3 bucket. Note response code (200).
- test request of file `notavailable.html` via request of file `/notavailable.html` in S3 bucket. Note response code (403).
