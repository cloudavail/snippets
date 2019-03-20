# Overview

This snippet is designed to describe the use of terraform to manage database users.

# Create Users

```
mysql_password=$(openssl rand -base64 12)
terraform plan -var cloudavail_mysql_user_password=$mysql_password
terraform apply -var cloudavail_mysql_user_password=$mysql_password
```