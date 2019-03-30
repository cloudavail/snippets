resource "aws_security_group" "ecs_internet_facing_elb_security_group" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_lb_listener" "ecs_internet_facing_elb_listener" {
  load_balancer_arn = "${aws_lb.ecs_internet_facing_elb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.nginx_target_group.arn}"
  }
}

resource "aws_lb" "ecs_internet_facing_elb" {
  # Error: aws_lb.ecs_internet_facing_elb: "name_prefix" cannot be longer than 6 characters
  name_prefix        = "ecsint"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ecs_internet_facing_elb_security_group.id}"]
  subnets            = ["${aws_subnet.publicsubnet01.id}", "${aws_subnet.publicsubnet02.id}"]
}
