variable "environment" {
  type = "string"
}

variable "instance_type" {
  type = "string"
}

variable "key_pair" {
  type    = "string"
  default = "joey-cloudavail"
}

variable "image_id" {
  type    = "string"
  default = "ami-0af5f077b70dafc30"
}

variable "max_instance" {
  type = "string"
}

variable "min_instance" {
  type = "string"
}

variable "vpc_id" {
  type = "string"
}

variable "vpc_zone_identifier" {
  type = "list"
}
