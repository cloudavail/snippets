#!/bin/bash

apt -y update
apt -y install haproxy

# haproxy configuration
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak

# https://confluence.atlassian.com/bitbucketserver/setting-up-ssh-port-forwarding-776640364.html
cat > /etc/haproxy/haproxy.cfg <<EOF
global
        log /var/log    local0
        log /var/log    local1 notice
        chroot /var/lib/haproxy
        user haproxy
        group haproxy
        daemon

defaults
        log     global
        option  dontlognull
        timeout connect 5000
        timeout client  50000
        timeout server  50000
        errorfile 400 /etc/haproxy/errors/400.http
        errorfile 403 /etc/haproxy/errors/403.http
        errorfile 408 /etc/haproxy/errors/408.http
        errorfile 500 /etc/haproxy/errors/500.http
        errorfile 502 /etc/haproxy/errors/502.http
        errorfile 503 /etc/haproxy/errors/503.http
        errorfile 504 /etc/haproxy/errors/504.http

listen ssh
        bind *:2422
        mode   tcp
        option tcplog
        # tcp-request content accept if { req.ssl_hello_type 1 }
        server backend 192.168.50.4:22

listen http
        bind *:2480
        mode http
        option httplog
        server backend 192.168.50.4:80
EOF

systemctl start haproxy
