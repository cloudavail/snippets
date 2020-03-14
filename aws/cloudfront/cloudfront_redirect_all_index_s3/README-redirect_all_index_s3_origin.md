# Overview

The CloudFormation file `cloudfront_redirect_all_index_s3_s3_origin.yaml` in this directory will create a basic CloudFront distribution.

# Setup Infrastructure for Testing

## Validate Templates

`aws2 cloudformation validate-template --template-body file://cloudfront_redirect_all_index_s3_s3_origin.yaml`

## Create Stack

`aws2 cloudformation create-stack --stack-name CloudFrontWithRedirectS3Origin --template-body file://cloudfront_redirect_all_index_s3_s3_origin.yaml`

## Update Stack

`aws2 cloudformation update-stack --stack-name CloudFrontWithRedirectS3Origin --template-body file://cloudfront_redirect_all_index_s3_s3_origin.yaml`

## Delete Stack

`aws2 cloudformation delete-stack --stack-name CloudFrontWithRedirectS3Origin`

## Upload index.html File

- Upload file file `/index.html`
- Allow "Read Object" access to the CloudFront Origin Access Id.

# Tests

## CDN with S3OriginConfig and No CDN Index/Error Configuration

- test request of `''` via request of file `''` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `/` via request of file `/` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `index.html` via request of file `index.html` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `/notavailable.html` via request of file `/notavailable.html` in S3 bucket. Note response code (403) and return of "Not Found" text `<Error><Code>AccessDenied</Code><Message>Access Denied</Message><RequestId>FD9C82640C77D8D9</RequestId><HostId>J96WvU1D4+4CPqKx/EXxSSxC+wSJUjZWYu96YBeghNcf+Ssm0XfD3/6QEX/zHhAncBPKB8bPhSQ=</HostId></Error>* Closing connection 0`.

As "Website Hosting" is not turned on, there is method of turning on "Index Document" or "Error Document".

## CDN with S3OriginConfig and CDN Index/Error Configuration

- test request of `''` via request of file `''` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `/` via request of file `/` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `index.html` via request of file `index.html` in S3 bucket. Note response code (note from testing: returns `200`).
- test request of file `/notavailable.html` via request of file `/notavailable.html` in S3 bucket. Note response code (200) and return of `/index.html` text.
