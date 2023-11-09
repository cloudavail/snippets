# Infrastructure Creation

The terraform configuration contained in this repository creates "Base" infrastructure for the Medallion organization. This includes a VPC and OpenVPN server plus, potentially, other shared infrastructure.

# Structure of Terraform Directories

The `infra` directory holds different directories that create, update and configure shared infrastructure.

# Prerequisites

- Terraform (at a required version): terraform must be installed according to the documentation at https://learn.hashicorp.com/terraform/getting-started/install.html.
- IAM User: a properly configured IAM user - it is suggested that installing and configuring the AWS CLI is the easiest way to perform this. See: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

# Terraform Use

A majority of terraform configurations will be applied as follows. Specific exceptions will be noted within the documentation for each module.

1. `cd` into the `infra` directory. For example: `cd infra`.
2. If this is your first time running terraform for the given environment, run `terraform init` to configure terraform.
3. Preview Changes: run `terraform plan` to review the changes that terraform would make.
4. Execute Changes: run `terraform apply` to have terraform apply these changes.

# Terraform Use 2

A majority of terraform configurations will be applied as follows. Specific exceptions will be noted within the documentation for each module.

1. `cd` into the `infra` directory. For example: `cd infra`.
2. If this is your first time running terraform for the given environment, run `terraform init` to configure terraform.
3. Preview Changes: run `terraform plan -out=plan.out` to review the changes that terraform would make AND creates a "plan.out" file.
4. Execute Changes: run `terraform apply "plan.out"` to have terraform apply these changes from the "plan.out" file.

# Notes

## Issue with VPC FLow Log Group Deletion

If performing a terraform destroy to destroy your VPC you may need to delete the vpc-flow-logs log group after the terraform destroy has completed. This issue is known issue with terraform and described here: [cloudwatch log group not destroyed](https://github.com/hashicorp/terraform/issues/14750).
