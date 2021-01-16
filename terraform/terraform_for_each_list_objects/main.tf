terraform {
  required_version = ">=0.14"
}

resource "local_file" "local_file_generator" {
  for_each = { for cidr_range_objects in var.cidr_ranges : cidr_range_objects.filename => cidr_range_objects }
  filename = "${path.module}/${(lookup(each.value, "filename"))}.txt"
  content  = (lookup(each.value, "cidr_block"))
}
