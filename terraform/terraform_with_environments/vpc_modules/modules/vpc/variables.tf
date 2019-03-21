variable "aws_region" {
  description = "location to launch the VPC"
}

variable "environment" {
  description = "environment type"
  type        = "string"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = "string"
}

variable "availability_zones" {
  description = "availability zones in regions"
  type        = "list"
}

variable "public_subnets" {
  description = "IP range for public subnets"
  type        = "list"
}

variable "private_subnets" {
  description = "IP range for private subnets"
  type        = "list"
}

variable "nat_subnets" {
  description = "IP range for public subnets"
  type        = "list"
}
