# Overview

This snippet is intended to provide a quick introduction to terraform workspaces.

# Creating a QA Bucket

```
terraform init
terraform workspace new qa
terraform workspace select qa
terraform plan --var environment=qa
terraform apply --var environment=qa
```

# Creating a Prod Bucket

```
terraform init
terraform workspace new prod
terraform workspace select prod
terraform plan --var environment=prod
terraform apply --var environment=prod
```

# Outcome

```
cjohnson06:terraform_with_workspaces cjohnson$ aws s3 ls s3://cloudavail-terraform-usw2 --recursive
2019-05-21 19:40:45       2421 env:/prod/terraform-with-workspaces/main.tf
2019-05-21 19:40:04       2405 env:/qa/terraform-with-workspaces/main.tf
```
