resource "aws_s3_bucket" "cloudavail_terraform_fmt_test" {
  bucket = "cloudavail-terraform-fmt-test"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
