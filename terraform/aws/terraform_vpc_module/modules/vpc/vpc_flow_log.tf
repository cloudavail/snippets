resource "aws_cloudwatch_log_group" "vpc_flow_log_cloudwatch_log_group" {
  name              = "vpc-flow-logs"
  retention_in_days = var.vpc_flow_log_retention_in_days
  tags = merge(
    var.additional_tags,
    {
      Name = "vpc-flow-log-cloudwatch-log-group"
    },
  )
}

resource "aws_iam_role" "vpc_flow_log_iam_role" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

# We know about different ways to write an IAM Policy: https://learn.hashicorp.com/tutorials/terraform/aws-iam-policy
# Elected to use a multi-line heredoc string policy instead of
# aws_iam_policy_document data source
resource "aws_iam_role_policy" "vpc_flow_log_iam_role_policy" {
  name = "VPCFlowLogIAMPolicy"
  role = aws_iam_role.vpc_flow_log_iam_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_flow_log" "vpc_flow_log" {
  iam_role_arn    = aws_iam_role.vpc_flow_log_iam_role.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_log_cloudwatch_log_group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}
