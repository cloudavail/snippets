provider "aws" {
  region = "us-west-2"
}

resource "aws_lb_target_group" "test_target_group" {
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id
}
