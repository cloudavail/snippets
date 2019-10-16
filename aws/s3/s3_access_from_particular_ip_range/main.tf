provider "aws" {
  region = "us-west-2"
}

data "template_file" "s3_allow_list_and_delete" {
  template = "${file("./s3_with_list_and_delete.json")}"

  vars = {
    s3_bucket_arn       = "arn:aws:s3:::cloudavail-allow-list-and-delete"
    source_ip_range     = "73.71.218.187/32"
  }
}

resource "aws_s3_bucket" "cloudavail_allow_list_and_delete" {
  bucket = "cloudavail-allow-list-and-delete"
  acl    = "private"
  policy = "${data.template_file.s3_allow_list_and_delete.rendered}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

data "template_file" "s3_allow_delete" {
  template = "${file("./s3_with_delete.json")}"

  vars = {
    s3_bucket_arn       = "arn:aws:s3:::cloudavail-allow-delete"
    source_ip_range     = "73.71.218.187/32"
  }
}

resource "aws_s3_bucket" "cloudavail_allow_delete" {
  bucket = "cloudavail-allow-delete"
  acl    = "private"
  policy = "${data.template_file.s3_allow_delete.rendered}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
