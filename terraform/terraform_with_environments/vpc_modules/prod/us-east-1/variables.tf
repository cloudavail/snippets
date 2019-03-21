variable "aws_region" {
  description = "location to launch the VPC"
  type        = "string"
  default     = "us-east-1"
}

variable "environment" {
  description = "environment type"
  type        = "string"
  default     = "prod"
}

variable "vpc_cidr_block" {
  description = "base CIDR for vpc_id"
  default     = "10.80.0.0/16"
}
