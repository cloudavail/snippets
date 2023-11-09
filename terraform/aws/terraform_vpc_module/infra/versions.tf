terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0"
    }
  }
  # am fixing at required_version = "=0.14.11"
  # until issues with the CircleCI terraform Orb supporting terraform version 1.0.3 are resolved
  # https://github.com/CircleCI-Public/terraform-orb/pull/46
  required_version = "=0.14.11"
}
