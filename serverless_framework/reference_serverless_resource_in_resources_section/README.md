# Overview

This document describes how to reference default objects created by serverless within the `Resources` section of your `serverless.yml` file.

# Understand

The Serverless Framework generates a CloudFormation file by combining the AWS resources that would be created in the `functions` section with the custom resources you create within the `resources` section.

To get the name of one of the automatically generated resources, you can do the following:

1. Run `serverless package` to generate a CloudFormation file with all resources.
2. Open the file `.serverless/cloudformation-template-update-stack.json`
3. Within that file, search for the resource's "Logical Name" that you wish to reference.
4. Add that resource name as a `Ref` or `GetAtt` within the resources section of your `serverless.yml` file.
