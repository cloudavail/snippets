# Overview
Running this template will demonstrate the use of AWS's STS to grant temporary access to one or more AWS resources. The application can currently grant access using one of two different methods:

1. "assume_role" - where an IAM user assumes an IAM role to access one or more resources.
2. "get_federation_token" - where a set of IAM credentials is generated that allow access to one or more resources.

Running the demonstration requires configuration of your AWS account or your computer's environment.

# Running "Assume Role"

## Prerequisites:
1. Assume Role requires that the "boto" Python module can access your IAM Access Key and IAM Secret Key.
2. Assume Role requires that an "IAM Role" exists and that this role has your IAM user listed as a trusted entity. The json policy to allow a given user to assume a role is described in the file ```./Resources/assume_role - Required Trust Relationship.json```.

## Running Assume Role:

    python sts_basic_application.py --mode assume_role --role 'arn:aws:iam::187376578462:role/sts_testing_role'

# Running "Get Federation Token"
## Prerequisites:
1. Get Federation Token requires that the "boto" Python module can access your IAM Access Key and IAM Secret Key.
2. Get Federation Token requires that your IAM user has the authorization to perform the ```sts:GetFederationToken``` action. The json policy to allow the ```sts:GetFederationToken``` action is described in the file ```./Resources/get_federation_token - Required Permissions.json```.

## Running Assume Role:

Get federation token can be run as follows:

    python sts_basic_application.py --username colin --password test --mode get_federation_token
