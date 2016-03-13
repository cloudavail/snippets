# Overview
This document describes how to create a upload a tarball to S3 for usage with the Vagrant -> AWS Flow Application when running on AWS.

# Command to Run
From root of project, run the following:
`aws s3 cp build/vaf-0.1.0.tar.gz s3://vaf-release/`