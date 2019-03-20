variable "aws_region" {
  description = "location to launch the VPC"
  default     = "us-east-1"
}

variable "environment" {
  description = "environment type"
  default     = "dev"
}

variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  default     = "10.90.0.0/16"
}

variable "availability_zones" {
  description = "list of availability zones"
  type        = "list"

  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "public_subnet_cidr" {
  description = "IP range for public subnets"
  type        = "list"
  default     = ["10.90.0.0/24", "10.90.1.0/24", "10.90.2.0/24", "10.90.3.0/24", "10.90.4.0/24", "10.90.5.0/24"]
}

variable "private_subnet_cidr" {
  description = "IP range for private subnets"
  type        = "list"
  default     = ["10.90.18.0/24", "10.90.19.0/24", "10.90.20.0/24", "10.90.21.0/24", "10.90.22.0/24", "10.90.23.0/24"]
}

variable "nat_subnet_cidr" {
  description = "IP range for public subnets"
  type        = "list"
  default     = ["10.90.6.0/25", "10.90.8.0/25", "10.90.10.0/25", "10.90.12.0/25", "10.90.14.0/25", "10.90.16.0/25"]
}
