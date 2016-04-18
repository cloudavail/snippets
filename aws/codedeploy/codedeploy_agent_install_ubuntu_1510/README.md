# Overview
This snippet describes how to run AWS CodeDeploy under Ubuntu 15.10. Specifically, the AWS CodeDeploy agent requires Ruby 2.0, whereas Ubuntu 15.10 ships with versions Ruby 2.1 or Ruby 2.2.

# Requirements
In order for this demo to work, you'll need to provide AWS credentials that allow access to Amazon's S3 bucket where the AWS CodeDeploy installer is located. As far as I know these credentials don't actually need /any/ access to your AWS account. These credentials should be stored in the file `aws_credentials` - this file is provided in the repository and is currently empty.

# Solution
There are a number of solutions - the solution that this demo presents is to add the "trusty" repositories to Ubuntu 15.10. By adding the "trusty" repositories to Ubuntu 15.10 you can install Ruby 2.0.

# Understanding the Repositories
There are four repository "components" as descibed at https://help.ubuntu.com/community/Repositories/Ubuntu:

- Main: officially supported software.
- Restricted: supported software that is not available under a completely free license.
- Universe: community maintained software, i.e. not officially supported software.
- Multiverse: software that is not free.

For our purposes, we only require access to the "main" repositories.
