# Resources
resource "aws_security_group" "s3_access_security_group" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_iam_instance_profile" "s3_access_iam_instance_profile" {
  name_prefix = "S3AccessIAMRole-"
  role        = "${aws_iam_role.s3_access_aws_iam_role.name}"
}

resource "aws_iam_role" "s3_access_aws_iam_role" {
  name_prefix = "S3AccessIAMRole-"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_access_aws_iam_role_policy_attachment" {
  role       = "${aws_iam_role.s3_access_aws_iam_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_launch_template" "s3_access_launch_configuration" {
  iam_instance_profile = {
    name = "${aws_iam_instance_profile.s3_access_iam_instance_profile.name}"
  }
  # https://cloud-images.ubuntu.com/locator/ec2/
  # 18.04 lts hvm:ebs-ssd us-west-2
  image_id      = "ami-06f2f779464715dc5"
  instance_type = "t3.micro"
  key_name      = "s3access"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = ["${aws_security_group.s3_access_security_group.id}"]
  }
}

resource "aws_autoscaling_group" "s3_access_aws_auto_scaling_group" {
  launch_template {
    id      = "${aws_launch_template.s3_access_launch_configuration.id}"
    version = "${aws_launch_template.s3_access_launch_configuration.latest_version}"
  }

  max_size            = 1
  min_size            = 1
  vpc_zone_identifier = ["${aws_subnet.publicsubnet01.id}", "${aws_subnet.publicsubnet02.id}"]
}
