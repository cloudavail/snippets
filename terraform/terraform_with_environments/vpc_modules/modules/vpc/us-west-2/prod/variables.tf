variable "aws_region" {
  description = "location to launch the VPC"
  default     = "us-west-2"
}

variable "environment" {
  description = "environment type"
  default     = "prod"
}

variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  default     = "10.30.0.0/16"
}

variable "availability_zones" {
  description = "list of availability zones"
  type        = "list"

  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}

variable "public_subnet_cidr" {
  description = "IP range for public subnets"
  type        = "list"
  default     = ["10.30.0.0/24", "10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
}

variable "private_subnet_cidr" {
  description = "IP range for private subnets"
  type        = "list"
  default     = ["10.30.12.0/24", "10.30.13.0/24", "10.30.14.0/24", "10.30.15.0/24"]
}

variable "nat_subnet_cidr" {
  description = "IP range for public subnets"
  type        = "list"
  default     = ["10.30.4.0/25", "10.30.6.0/25", "10.30.8.0/25", "10.30.10.0/25"]
}
