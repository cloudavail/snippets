#!/bin/bash

desired_domain="www.cloudavail.com"

sudo apt-get -y update
sudo apt-get -y install nginx

# removing the "default" will allow the use of a "default_server"
# that answers for all Host headers
rm /etc/nginx/sites-available/default

cat > /etc/nginx/sites-available/nginx_redirector <<EOF
server {
  # listen 80 default_server will answer for all reqests
  listen      80 default_server;
  return      301 \$scheme://$desired_domain\$request_uri;
}
EOF

ln -s /etc/nginx/sites-available/nginx_redirector /etc/nginx/sites-enabled/nginx_redirector

service nginx restart

# test
# curl --verbose --header 'Host: myurl.com' 'http://127.0.0.1:8080'
# if you wish to follow a redirect
# curl --verbose --header --location 'Host: myurl.com' 'http://127.0.0.1:8080'
