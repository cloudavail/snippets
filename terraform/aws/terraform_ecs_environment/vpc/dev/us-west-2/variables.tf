variable "aws_region" {
  description = "location to launch the VPC"
  type        = "string"
  default     = "us-west-2"
}

variable "environment" {
  description = "environment type"
  type        = "string"
  default     = "dev"
}

variable "vpc_cidr_block" {
  description = "base CIDR for vpc_id"
  default     = "10.40.0.0/16"
}

variable "public_subnets" {
  description = "list of public subnets"
  type        = "list"
  default     = ["10.40.0.0/24", "10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
}

variable "private_subnets" {
  description = "list of private subnets"
  type        = "list"
  default     = ["10.40.12.0/24", "10.40.13.0/24", "10.40.14.0/24", "10.40.15.0/24"]
}

variable "nat_subnets" {
  description = "list of nat subnets"
  type        = "list"
  default     = ["10.40.4.0/25", "10.40.6.0/25", "10.40.8.0/25", "10.40.10.0/25"]
}

variable "availability_zones" {
  description = "list of availability zones in us-west-2"
  type        = "list"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}

