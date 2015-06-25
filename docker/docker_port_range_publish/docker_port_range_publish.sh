#!/bin/bash

# objective(s):
# create a Docker image/container that exposes multiple ports

apt-get -y update
wget -qO- https://get.docker.com/ | sh

# pull a specific docker image
docker pull ubuntu:14.04

mkdir /root/port_test
cd /root/port_test
cp /vagrant/port_test.conf /root/port_test/port_test.conf
cat > /root/port_test/Dockerfile <<EOF
FROM ubuntu:14.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt-get update
RUN apt-get -y install nginx
COPY /port_test.conf /etc/nginx/sites-available/port_test.conf
RUN ln -s /etc/nginx/sites-available/port_test.conf /etc/nginx/sites-enabled/port_test.conf
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
EXPOSE 52770-52779
CMD ["nginx"]
EOF

docker build -t port_test /root/port_test

docker run --detach=true --publish 52770-52779:52770-52779 port_test
