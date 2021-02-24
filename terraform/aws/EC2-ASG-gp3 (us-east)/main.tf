provider "aws" {
  region  = "us-east-1"
  # version = "~> 2.70"
}

resource "aws_launch_template" "lt_asg_gp3" {
  description    = "Simple t2.micro with 10gb gp3 block device"
  instance_type  = "t2.micro"
  image_id = "ami-047a51fa27710816e"
  placement {
    availability_zone = "us-east-1a"
  }

  block_device_mappings {
    device_name = "test"
    ebs {
      volume_size           = 10
      volume_type           = "gp3"
      delete_on_termination = "true"
    }
  }
}

resource "aws_autoscaling_group" "ec2_gp3" {
  name             = "test-asg"
  desired_capacity = 1
  max_size         = 1
  min_size         = 1
  availability_zones = [ "us-east-1a" ]
  launch_template {
    id = "${aws_launch_template.lt_asg_gp3.id}"
  }
}
