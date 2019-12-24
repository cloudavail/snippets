resource "aws_ssm_parameter" "database_host" {
  name  = "/test/ubuntu/db_host"
  type  = "String"
  value = "db01-test.cloudavail.net"
}
