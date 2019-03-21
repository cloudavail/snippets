variable "aws_region" {
  description = "location to launch the VPC"
  type        = "string"
  default     = "us-east-1"
}

variable "environment" {
  description = "environment type"
  type        = "string"
  default     = "dev"
}

variable "vpc_cidr_block" {
  description = "base CIDR for vpc_id"
  default     = "10.90.0.0/16"
}

variable "public_subnets" {
  description = "list of public subnets"
  type        = "list"
  default     = ["10.90.0.0/24", "10.90.1.0/24", "10.90.2.0/24", "10.90.3.0/24", "10.90.4.0/24", "10.90.5.0/24"]
}

variable "private_subnets" {
  description = "list of private subnets"
  type        = "list"
  default     = ["10.90.18.0/24", "10.90.19.0/24", "10.90.20.0/24", "10.90.21.0/24", "10.90.22.0/24", "10.90.23.0/24"]
}

variable "nat_subnets" {
  description = "list of nat subnets"
  type        = "list"
  default     = ["10.90.6.0/25", "10.90.8.0/25", "10.90.10.0/25", "10.90.12.0/25", "10.90.14.0/25", "10.90.16.0/25"]
}

variable "availability_zones" {
  description = "list of availablility zones in us-east-1"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "az_count" {
  description = "number of azs in us-east-1"
  type        = "list"
  default     = ["1", "2", "3", "4", "5", "6"]
}
