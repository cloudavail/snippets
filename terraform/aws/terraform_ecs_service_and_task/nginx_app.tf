resource "aws_ecs_task_definition" "nginx_task_definition" {
  family                = "nginx"
  container_definitions = "${file("templates/nginx_task_definition.json")}"
}

resource "aws_ecs_service" "nginx_service" {
  name            = "nginx"
  cluster         = "${aws_ecs_cluster.ecs_cluster.id}"
  desired_count   = 1
  task_definition = "${aws_ecs_task_definition.nginx_task_definition.arn}"
}
