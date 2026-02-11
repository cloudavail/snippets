variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "availability_zones" {
  type = list(string)
}

variable "nat_subnet_cidr_blocks" {
  type = list(string)
}

variable "private_subnet_cidr_blocks" {
  type = list(string)
}

variable "public_subnet_cidr_blocks" {
  type = list(string)
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_flow_log_retention_in_days" {
  type    = number
  default = 30
}
