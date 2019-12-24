provider "aws" {
  region = "us-west-2"
}

data "template_file" "ecs_cluster_node_user_data" {
  template = file("templates/ecs_cluster_node.sh")

  vars = {
    ECS_CLUSTER_NAME = aws_ecs_cluster.ecs_cluster.name
  }
}

# Resources
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "publicsubnet01" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "public_aws_route_table" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "route_table_association_01" {
  subnet_id      = aws_subnet.publicsubnet01.id
  route_table_id = aws_route_table.public_aws_route_table.id
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public_aws_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.aws_internet_gateway.id
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster"
}

resource "aws_security_group" "ecs_cluster_node_security_group" {
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

  vpc_id = aws_vpc.vpc.id
}

resource "aws_iam_instance_profile" "ecs_cluster_node_iam_instance_profile" {
  name_prefix = "ECSClusterNode-"
  role        = aws_iam_role.ecs_cluster_node_iam_role.name
}

resource "aws_iam_role" "ecs_cluster_node_iam_role" {
  name_prefix = "ECSClusterNode-"

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

resource "aws_iam_role_policy_attachment" "ecs_cluster_node_iam_role_policy_attachment" {
  role       = aws_iam_role.ecs_cluster_node_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_launch_template" "ecs_cluster_node_launch_configuration" {
  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_cluster_node_iam_instance_profile.name
  }

  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
  image_id      = "ami-0cbd7a68124b9cff9"
  instance_type = "t3.micro"
  key_name      = "ecs_cluster_key"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ecs_cluster_node_security_group.id]
  }

  user_data = base64encode(data.template_file.ecs_cluster_node_user_data.rendered)
}

resource "aws_autoscaling_group" "ecs_cluster_node_auto_scaling_group" {
  launch_template {
    id = aws_launch_template.ecs_cluster_node_launch_configuration.id

    # note: I've seen version = "$$Latest" and while this is clear what is intended
    # I prefer the consistency of aws_launch_template.ecs_cluster_node_launch_configuration.latest_version
    version = aws_launch_template.ecs_cluster_node_launch_configuration.latest_version
  }

  max_size            = 1
  min_size            = 1
  vpc_zone_identifier = [aws_subnet.publicsubnet01.id]
}
