resource "mysql_user" "cloudavail_user" {
  user               = "cloudavail_user"
  host               = "%"
  plaintext_password = "${var.cloudavail_mysql_user_password}"
}

resource "mysql_grant" "cloudavail_user_grant" {
  user       = "${mysql_user.cloudavail_user.user}"
  host       = "${mysql_user.cloudavail_user.host}"
  database   = "mysql"
  # "SHOW DATABASES" or global commands are not available
  privileges = ["SELECT", "SHOW VIEW"]
}
