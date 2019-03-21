variable "aws_region" {
  description = "location to launch the VPC"
  type        = "string"
  default     = "us-west-2"
}

variable "environment" {
  description = "environment type"
  type        = "string"
  default     = "prod"
}

variable "vpc_cidr_block" {
  description = "base CIDR for vpc_id"
  default     = "10.30.0.0/16"
}
