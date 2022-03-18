# Overview

This document outlines the steps to test the `LifecycleConfiguration` property of
an S3 bucket. It assumes the default settings in `bucket-with-versioning.yaml`
are unchanged and that the object used for testing is named `waffles.jpg`.

# Create the Stack

## Set Variables

```
AWS_PROFILE=default
customer=cloudavail
environment=test
region=us-west-2
```

## Create Stack

```
aws cloudformation create-stack \
--stack-name $customer-bucket-with-versioning \
--template-body file://bucket-with-versioning.yaml \
--parameters ParameterKey=Environment,ParameterValue=$environment \
--region $region
```

# Upload an Object and Update it

## Upload waffles.jpg
```
aws s3 cp waffles.jpg s3://$customer-versioning-bucket
```

## Upload waffles.jpg again
```
aws s3 cp waffles.jpg s3://$customer-versioning-bucket
```

## Confirm that both versions exist in the bucket

The following command will list the `Key`, `VersionId`, and `IsLatest` values for the two files that were uploaded:

```
aws s3api list-object-versions --bucket $customer-versioning-bucket --query 'Versions[*].[Key,VersionId,IsLatest]' --prefix waffle --output text
```

# Confirm the Noncurrent Version is Destroyed

After 24 hours, the noncurrent version of `waffles.jpg` will be deleted from the bucket. Confirm that this is the case:

```
aws s3api list-object-versions --bucket $customer-versioning-bucket --query 'Versions[*].[Key,VersionId,IsLatest]' --prefix waffle --output text
```
