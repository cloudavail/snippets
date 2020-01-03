terraform {
  required_version = ">=0.12"
}

# given an array of keys and values
# (in our case A Records and IP Addresses)
# output these, one line per value

variable "resource_records" {
  type = "map"

  default = {
    "cloudavail.com"     = "192.0.78.25"
    "www.cloudavail.com" = "192.0.78.24"
  }
}

resource "local_file" "foo" {
  for_each = var.resource_records
  filename = "${path.module}/${each.key}"
  content  = "A Record: ${each.key} with Value: ${each.value}"
}
