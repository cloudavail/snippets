provider "aws" {
  region  = "us-west-2"
  # version 2.42 added support for multiple host-header
  # values!
  # see: https://github.com/terraform-providers/terraform-provider-aws/issues/8126
  version = ">= 2.42"
}

resource "aws_security_group" "public_alb_security_group" {
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

resource "aws_lb" "public_alb" {
  name               = "elb-listener-rule-multiple-vals"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.public_alb_security_group.id}"]
  subnets            = ["${aws_subnet.publicsubnet01.id}", "${aws_subnet.publicsubnet02.id}"]
}

resource "aws_lb_listener" "ecs_lb_listener_http" {
  load_balancer_arn = "${aws_lb.public_alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Unauthorized"
      status_code  = "401"
    }
  }
}

resource "aws_lb_listener_rule" "aws_lb_listener_rule_multiple_values" {
  listener_arn = "${aws_lb_listener.ecs_lb_listener_http.arn}"

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = ["cloudavail.com", "www.cloudavail.com"]
    }
  }
}
