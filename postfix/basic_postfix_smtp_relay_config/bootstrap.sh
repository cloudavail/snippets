#!/usr/bin/env bash

# NOTE: this is tested only using Google Apps for Business
# on an Ubuntu 14.04 host

smtp_server_fqdn="smtp.gmail.com"
smtp_server_port="587"
# use either user@gmail.com (for gmail accounts)
# use either user@domain.com (for Google Apps for Work)
smtp_server_username="user@gmail.com"
smtp_server_password="password"

# DEBIAN_FRONTEND=noninteractive will skip the typical postfix installation prompts
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install postfix

cat > /etc/postfix/sasl_passwd<<EOF
$smtp_server_fqdn:$smtp_server_port $smtp_server_username:$smtp_server_password
EOF
postmap /etc/postfix/sasl_passwd
# to test the username/password configuration for gmail
# postmap -q smtp.gmail.com:587 /etc/postfix/sasl_passwd

postconf -e "relayhost = $smtp_server_fqdn:$smtp_server_port"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
# postconf -e "smtp_sasl_security_options ="
postconf -e "smtp_use_tls = yes"
postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
# eliminates default security options which are imcompatible with gmail
postconf -e "smtp_sasl_security_options ="

sudo service postfix restart

# mail_header="To: to@domain.com
# From: from@domain.com
# Subject: This mail is from sendmail \n\n"
# mail_body="This message was automatically generated."
# echo -e "$mail_header" "$mail_body" | sendmail -t
