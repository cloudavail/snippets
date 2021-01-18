terraform {
  required_version = ">=0.14"
}

resource "local_file" "local_file_generator" {
  for_each = { for cidr_range in var.cidr_ranges : cidr_range["cidr_block"] => cidr_range }
  filename = each.value.filename
  content  = each.value.cidr_block
}
