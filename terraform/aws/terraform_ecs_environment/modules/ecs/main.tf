data "template_file" "ecs_cluster_node_user_data" {
  template = "${file("${path.module}/templates/ecs_cluster_node.sh")}"

  vars {
    ECS_CLUSTER_NAME = "${aws_ecs_cluster.ecs_cluster.name}"
  }
}

data "local_file" "ecs_policy_json" {
  filename = "${path.module}/templates/ecs_policy.json"
}

# Resources

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.environment}-cluster"

  tags = {
    Name = "${var.environment}-cluster"
  }
}

resource "aws_autoscaling_group" "ecs_cluster_node_auto_scaling_group" {
  name = "ECS-AutoScalingGroup-${var.environment}"

  launch_template {
    id = "${aws_launch_template.ecs_cluster_node_launch_configuration.id}"

    # note: I've seen version = "$$Latest" and while this is clear what is intended
    # I prefer the consistency of aws_launch_template.gitlab_runner_template.latest_version
    version = "${aws_launch_template.ecs_cluster_node_launch_configuration.latest_version}"
  }

  tag {
    key                 = "Name"
    value               = "ecs-${var.environment}"
    propagate_at_launch = true
  }

  max_size            = "${var.max_instance}"
  min_size            = "${var.min_instance}"
  vpc_zone_identifier = ["${var.vpc_zone_identifier}"]
}

resource "aws_iam_policy" "ecs_service_policy" {
  name        = "ECSServicePolicy-${var.environment}"
  description = "ECS Service Policy allowing basic permissions"
  policy      = "${data.local_file.ecs_policy_json.content}"
}

resource "aws_iam_role" "ecs_cluster_node_iam_role" {
  name_prefix = "ECSClusterNode-${var.environment}-"

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

resource "aws_iam_instance_profile" "ecs_cluster_node_iam_instance_profile" {
  name_prefix = "ECSClusterNode-${var.environment}"
  role        = "${aws_iam_role.ecs_cluster_node_iam_role.name}"
}

resource "aws_iam_role_policy_attachment" "ecs_cluster_node_iam_role_policy_attachment" {
  role       = "${aws_iam_role.ecs_cluster_node_iam_role.name}"
  policy_arn = "${aws_iam_policy.ecs_service_policy.id}"
}

resource "aws_launch_template" "ecs_cluster_node_launch_configuration" {
  iam_instance_profile = {
    name = "${aws_iam_instance_profile.ecs_cluster_node_iam_instance_profile.name}"
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.ecs_cluster_node_security_group.id}"]
  }
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"

#  vpc_security_group_ids = ["${aws_security_group.ecs_cluster_node_security_group.id}"]

  key_name  = "${var.key_pair}"
  name      = "ecs-${var.environment}"
  user_data = "${base64encode(data.template_file.ecs_cluster_node_user_data.rendered)}"
}

resource "aws_security_group" "ecs_cluster_node_security_group" {
  # all traffic is allowed out on all ports
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

  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "cloudavail-ecs-sg-${var.environment}"
  }
}
