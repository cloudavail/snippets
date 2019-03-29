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

variable "public_subnets" {
  description = "list of public subnets"
  type        = "list"
  default     = ["10.30.0.0/24", "10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
}

variable "private_subnets" {
  description = "list of private subnets"
  type        = "list"
  default     = ["10.30.12.0/24", "10.30.13.0/24", "10.30.14.0/24", "10.30.15.0/24"]
}

variable "nat_subnets" {
  description = "list of nat subnets"
  type        = "list"
  default     = ["10.30.4.0/25", "10.30.6.0/25", "10.30.8.0/25", "10.30.10.0/25"]
}

variable "availability_zones" {
  description = "list of availability zones in us-west-2"
  type        = "list"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}

variable "az_count" {
  description = "number of azs in us-west-1"
  type        = "list"
  default     = ["1", "2", "3", "4"]
}
