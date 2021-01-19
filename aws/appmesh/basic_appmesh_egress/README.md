# Overview

This snippet attempts to:

- confirm the proper configuration of appmesh and a given container
- confirm the ability to enable/disable egress from AppMesh.

# Confirm Proper Operation

_Some_ proper operation of the AppMesh can be determined by doing the following:

- `docker exec`'ing into the `envoy` container and running `curl localhost:9901\clusters` - what should be returned is shown below:

```
cds_egress_apps_mesh-allow-all::default_priority::max_connections::2147483647
cds_egress_apps_mesh-allow-all::default_priority::max_pending_requests::2147483647
cds_egress_apps_mesh-allow-all::default_priority::max_requests::2147483647
cds_egress_apps_mesh-allow-all::default_priority::max_retries::2147483647
cds_egress_apps_mesh-allow-all::high_priority::max_connections::1024
cds_egress_apps_mesh-allow-all::high_priority::max_pending_requests::1024
cds_egress_apps_mesh-allow-all::high_priority::max_requests::1024
cds_egress_apps_mesh-allow-all::high_priority::max_retries::3
cds_egress_apps_mesh-allow-all::added_via_api::true
```

- `docker exec`'ing into the `nginx` container and curling a site outside of a given VPC.

# Create/Update CloudFormation

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://basic_appmesh_egress.yaml`

## Create the AppMesh Service Stack

`aws cloudformation create-stack --stack-name basic-appmesh --parameters --capabilities CAPABILITY_IAM --template-body file://basic_appmesh_egress.yaml`

## Update the AppMesh Service Stack

`aws cloudformation update-stack --stack-name basic-appmesh --parameters --capabilities CAPABILITY_IAM --template-body file://basic_appmesh_egress.yaml`

## Delete the AppMesh Service Stack

`aws cloudformation delete-stack --stack-name basic-appmesh`

# Reference

https://docs.aws.amazon.com/app-mesh/latest/userguide/getting-started-ecs.html
