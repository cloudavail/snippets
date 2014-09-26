#!/usr/bin/env bash

# NOTE: this is tested only using AWS SES on Ubuntu 14.04
# on an Ubuntu 14.04 host

# REFERENCES:
# http://docs.aws.amazon.com/ses/latest/DeveloperGuide/postfix.html

recepient_email="colin@cloudavail.com"

aws_ses_verified_email="colin@cloudavail.com"

smtp_server_fqdn="email-smtp.us-east-1.amazonaws.com"
smtp_server_port="587"
smtp_server_username=""
smtp_server_password=""

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
postconf -e "smtp_sasl_security_options = noanonymous"
postconf -e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
postconf -e "smtp_use_tls = yes"
postconf -e "smtp_tls_security_level = encrypt"
postconf -e "smtp_tls_note_starttls_offer = yes"
# smtp_tls_CAfile is tested and correct on Ubuntu 14.04
postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
# eliminates default security options which are imcompatible with gmail

sudo service postfix restart

# mail_header="To: $recepient_email
# From: $aws_ses_verified_email
# Subject: This mail is from sendmail \n\n"
# mail_body="This message was automatically generated."
# echo -e "$mail_header" "$mail_body" | sendmail -t -f $aws_ses_verified_email

# --append="From: $aws_ses_verified_email" required to provide a verified "FROM" address
# * * * * * nobody echo "This is a test message." | mail --append="From: $aws_ses_verified_email" --subject "This is a subject line" --to $recepient_email
