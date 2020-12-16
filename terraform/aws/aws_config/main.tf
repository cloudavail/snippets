provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "aws_config" {
  bucket = "cloudavail-aws-config"
}

resource "aws_iam_role" "aws_config_configuration_recorder_role" {
  name = "awsconfig-recorder-role"

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

resource "aws_iam_role_policy_attachment" "aws_config_configuration_recorder_iam_role_policy_attachment" {
  role       = "${aws_iam_role.aws_config_configuration_recorder_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_config_configuration_recorder" "aws_config_configuration_recorder" {
  name     = "aws_config_configuration_recorder"
  role_arn = "${aws_iam_role.aws_config_configuration_recorder_role.arn}"
}

resource "aws_config_delivery_channel" "aws_config_delivery_channel" {
  name           = "aws-config-delivery-channel"
  s3_bucket_name = "${aws_s3_bucket.aws_config.bucket}"
  # failure to include s3_key_prefix = results in the following error:
  # aws_config_delivery_channel.aws_config_delivery_channel: Creating Delivery Channel failed: 
  # InsufficientDeliveryPolicyException: Insufficient delivery policy to s3 bucket: cloudavail-aws-config, 
  # unable to write to bucket, provided s3 key prefix is 'null'.
  s3_key_prefix  = "aws-config"
}

resource "aws_config_configuration_recorder_status" "aws_config_configuration_recorder_enable" {
  name       = "${aws_config_configuration_recorder.aws_config_configuration_recorder.name}"
  is_enabled = true
  depends_on = ["aws_config_delivery_channel.aws_config_delivery_channel"]
}
