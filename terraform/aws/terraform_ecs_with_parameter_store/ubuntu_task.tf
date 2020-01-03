data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "template_file" "ubuntu_task_execution_role_policy" {
  template = file("templates/ubuntu_task_definition_execution_role_policy.json")

  vars = {
    AWS_ACCOUNT_ID = data.aws_caller_identity.current.account_id
    REGION         = data.aws_region.current.name
  }
}

data "template_file" "ubuntu_task_definition" {
  template = file("templates/ubuntu_task_definition.json")

  vars = {
    AWS_ACCOUNT_ID = data.aws_caller_identity.current.account_id
    REGION         = data.aws_region.current.name
  }
}

resource "aws_iam_policy" "ubuntu_task_definition_execution_role_policy" {
  name_prefix = "ubuntu-task-definition-role-policy-"
  policy      = data.template_file.ubuntu_task_execution_role_policy.rendered
}


resource "aws_iam_role" "ubuntu_task_definition_execution_role" {
  name_prefix        = "ubuntu-task-definition-role-"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ubuntu_task_definition_execution_role_policy_attachment" {
  role       = "${aws_iam_role.ubuntu_task_definition_execution_role.name}"
  policy_arn = "${aws_iam_policy.ubuntu_task_definition_execution_role_policy.arn}"
}

resource "aws_ecs_task_definition" "ubuntu_task_definition" {
  family                = "ubuntu"
  execution_role_arn    = aws_iam_role.ubuntu_task_definition_execution_role.arn
  container_definitions = data.template_file.ubuntu_task_definition.rendered
}
