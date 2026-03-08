provider "aws" {
  region = "us-west-2"
}

# Resources
resource "aws_iam_role" "config_role" {
  name = "config_role_us_west_2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "config_role_policy" {
  name = "config_role_policy"
  role = aws_iam_role.config_role.id

  policy = <<-EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Action": [
                  "s3:GetBucketAcl"
              ],
              "Resource": "*",
              "Effect": "Allow"
          },
          {
              "Condition": {
                  "StringEquals": {
                      "s3:x-amz-acl": "bucket-owner-full-control"
                  }
              },
              "Action": [
                  "s3:PutObject*"
              ],
              "Resource": "*",
              "Effect": "Allow"
          }
      ]
  }
  EOF
}

resource "aws_s3_bucket" "config_bucket" {
  bucket = "default-delivery-channel-config-bucket"
}

resource "aws_config_configuration_recorder" "default_config_recorder" {
  name     = "default-config-recorder"
  role_arn = aws_iam_role.config_role.arn
  recording_group {
    all_supported = true
  }
}

resource "aws_config_delivery_channel" "default_delivery_channel" {
  name           = "default-delivery-channel"
  s3_bucket_name = aws_s3_bucket.config_bucket.id
  depends_on     = [aws_config_configuration_recorder.default_config_recorder]
}
