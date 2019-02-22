#!/bin/bash

desired_domain="www.cloudavail.com"

sudo apt update
sudo apt -y install nginx

# removing the "default" will allow the use of a "default_server"
# that answers for all Host headers
rm /etc/nginx/sites-enabled/default

cat > /etc/nginx/sites-available/nginx_redirector.conf <<EOF
server {
  # listen 80 default_server will answer for all reqests
  listen      80 default_server;

  # all requests at / redirect to cloudavail homepage
  location = / {
    return 301 https://cloudavail.com/;
  }

  # all other requests redirect to blog
  location / {
    return 301 https://cloudavail.com/blog/;
  }
}
EOF

ln -s /etc/nginx/sites-available/nginx_redirector.conf /etc/nginx/sites-enabled/nginx_redirector.conf

systemctl restart nginx.servic

# test
# curl --verbose --header 'Host: myurl.com' 'http://127.0.0.1:8080'
# if you wish to follow a redirect
# curl --verbose --header --location 'Host: myurl.com' 'http://127.0.0.1:8080'
