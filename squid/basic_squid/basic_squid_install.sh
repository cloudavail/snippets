#!/bin/bash

# objective:
# get allowed ips
# install squid
# configure squid

apt -y update
apt -y install squid3

mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

cat > /etc/squid/squid.conf <<EOF
# define the port on which squid will listen
http_port 3128
# acl for destination
acl destination_ip_any dst 0.0.0.0/0
http_access allow destination_ip_any
# acl for source
acl source_ip_self src 0.0.0.0/0
# acl allowing to any site on any network
http_access allow source_ip_self
EOF

systemctl reload squid

# testing with curl
# curl --proxy http://localhost:3128 http://www.squid-cache.org/
