# Resources
data "aws_region" "current" {}

data "template_file" "s3_vpc_endpoint_policy" {
  template = "${file("./s3_vpc_endpoint_policy.json")}"

  vars = {
    s3_bucket_arn       = "arn:aws:s3:::cloudavail-private-s3-bucket"
    source_vpc_endpoint = "${aws_vpc_endpoint.s3_vpc_endpoint.id}"
  }
}

resource "aws_vpc_endpoint" "s3_vpc_endpoint" {
  service_name    = "com.amazonaws.${data.aws_region.current.name}.s3"
  route_table_ids = [ "${aws_route_table.public_aws_route_table.id}" ]
  vpc_id          = "${aws_vpc.vpc.id}"
}

resource "aws_s3_bucket" "cloudavail_private_s3_bucket" {
  bucket = "cloudavail-private-s3-bucket"
  acl    = "private"
  policy = "${data.template_file.s3_vpc_endpoint_policy.rendered}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
