#!/bin/bash

apt -y update
apt -y install nginx

# removing the "default" will allow the use of a "default_server"
rm /etc/nginx/sites-available/default

cat > /etc/nginx/sites-available/nginx_proxy_pass <<EOF
server {
  # listen 80 default_server will answer for all reqests
  listen      80 default_server;

  location / {
    proxy_pass https://cloudavail.com/$request_uri;
  }
}
EOF

ln -s /etc/nginx/sites-available/nginx_proxy_pass /etc/nginx/sites-enabled/nginx_proxy_pass

systemctl reload nginx
