#!/bin/bash

# objective:
# create a Docker image in an automated fashion
# the Docker image will be built using a Dockerfile

# references:
# https://coreos.com/docs/launching-containers/building/getting-started-with-docker/

apt-get -y install docker.io

# pull a specific docker image
docker pull ubuntu:14.04

# run a command within docker
# docker.io run -t -i ubuntu:14.04 /bin/bash
# docker.io run -t -i ubuntu:14.04 /bin/ls -la

mkdir /root/build_directory
cd /root/build_directory
cat > Dockerfile <<EOF
FROM ubuntu:14.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt-get update
RUN apt-get install -y apache2
EXPOSE 80
EOF

docker build -t cloudavail/apache2 /root/build_directory/

# confirm the image has been built:
# docker.io images

# description of the "docker.io run" command options and reasons for use:
# --detach: without --detach the user executing the command will not be
# returned to shell prompt
# --name cloudavail-apache2: without --name the container will need to be
# accessed by a Container ID - access using name is easier than getting the
# Container ID
# --publish 80: publishes (meaning: exposes the port on the host system)
# port 80
# cloudavail/apache2: this is the image to run
# /usr/sbin/apache2ctl -D FOREGROUND: docker exits when a command is completed
# as an example: service apache2 start runs, starts apache, but the command
# completes, causing docker to exit
docker run --detach --name cloudavail-apache2 --publish 8080:80 \
cloudavail/apache2 /usr/sbin/apache2ctl -D FOREGROUND

# confirm the container is running:
# docker.io ps
# confirm that the ports are exported:
# docker.io ps - examine the "PORTS" column
# confirm that Apache is running on the given container
# curl 127.0.0.1:8080
# confirm that Apache is running on the given container
# from guest OS (meaning inside vagrant virtual machine)
# curl 127.0.0.1:8080
# confirm that Apache is running on the given container
# from host OS (meaning on the host running vagrant)
# curl 127.0.0.1:8080