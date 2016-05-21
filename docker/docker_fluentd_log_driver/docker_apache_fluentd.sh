#!/bin/bash

# objective:
# to output logs from Docker to fluentd

# install Docker
apt -y install docker.io

# install fluentd
# install td-agent repository
curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

mkdir /var/log/docker-nginx
chmod 777 /var/log/docker-nginx
mv /etc/td-agent/td-agent.conf /etc/td-agent/td-agent.conf.bak
cat > /etc/td-agent/td-agent.conf <<EOF
<source>
  # type can be "forward" (meaning tcp endpoint) or "http" (meaning http endpoint)
  @type forward
  port 24224
</source>

<match *.*>
  @type file
  path /var/log/docker-nginx/combined.log
</match>
EOF

systemctl restart td-agent
systemctl restart docker

docker pull nginx:latest
# the command below will run docker
# logs will also be produced and visible using
# docker logs docker-nginx
# docker run --name docker-nginx --detach --publish 8080:80 nginx

docker run --log-driver=fluentd --log-opt fluentd-address=127.0.0.1:24224 --name docker-nginx --detach --publish 8080:80 nginx
