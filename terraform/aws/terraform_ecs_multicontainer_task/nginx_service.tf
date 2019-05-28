resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = "${aws_ecs_cluster.ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.nginx.arn}"
  desired_count   = 1

  # iam_role
  load_balancer {
    target_group_arn = "${aws_lb_target_group.nginx_target_group.arn}"
    # container_name must match the name of a container within the
    # task defition
    container_name   = "nginx-frontend"
    container_port   = 80
  }

  scheduling_strategy = "REPLICA"
}

resource "aws_lb_listener_rule" "nginx_listener_rule" {
  listener_arn = "${aws_lb_listener.ecs_internet_facing_elb_http_listener.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.nginx_target_group.arn}"
  }
  condition {
    field  = "path-pattern"
    values = ["/index.html"]
  }
}


resource "aws_lb_target_group" "nginx_target_group" {
  name_prefix = "nginx-"

  # it is assumed that this port must match the port given in task-definitions/nginx-listener.json
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${aws_vpc.vpc.id}"

  # depends_on ensures that the ELB is built prior to attempting to build the nginx- target group
  # failure to have an ELB built prior results in the following error
  # * aws_ecs_service.nginx: InvalidParameterException: The target group with targetGroupArn arn:aws:elasticloadbalancing:us-west-2:187376578462:targetgroup/nginx-20190329222811545200000005/6b6162838ea06f40 does not have an associated load balancer.
  depends_on = [
    "aws_lb.ecs_internet_facing_elb",
  ]
}

resource "aws_ecs_task_definition" "nginx" {
  family                = "nginx"
  container_definitions = "${file("templates/nginx.json")}"
}
