variable "cidr_ranges" {
  type = list(object({ cidr_block = string, filename = string }))
}
