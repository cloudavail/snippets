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

variable "public_subnets" {
  description = "list of public subnets"
  type        = "list"
  default     = ["10.80.0.0/24", "10.80.1.0/24", "10.80.2.0/24", "10.80.3.0/24", "10.80.4.0/24", "10.80.5.0/24"]
}

variable "private_subnets" {
  description = "list of private subnets"
  type        = "list"
  default     = ["10.80.18.0/24", "10.80.19.0/24", "10.80.20.0/24", "10.80.21.0/24", "10.80.22.0/24", "10.80.23.0/24"]
}

variable "nat_subnets" {
  description = "list of nat subnets"
  type        = "list"
  default     = ["10.80.6.0/25", "10.80.8.0/25", "10.80.10.0/25", "10.80.12.0/25", "10.80.14.0/25", "10.80.16.0/25"]
}

variable "availability_zones" {
  description = "list of availablility zones in us-east-1"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

