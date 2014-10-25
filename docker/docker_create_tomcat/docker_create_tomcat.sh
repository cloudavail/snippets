#!/bin/bash

# objective(s):
# create a Docker image in an automated fashion
# the Docker image will be built using a Dockerfile
# the Docker image will run tomcat

# references:
# https://coreos.com/docs/launching-containers/building/getting-started-with-docker/
# http://blog.trifork.com/2013/08/15/using-docker-to-efficiently-create-multiple-tomcat-instances/

apt-get -y update
apt-get -y install docker.io

# pull a specific docker image
docker.io pull ubuntu:14.04

mkdir /root/build_directory
cd /root/build_directory
cat > Dockerfile <<EOF
FROM ubuntu:14.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
# RUN provides command line instructions within the current image and commits those changes
RUN apt-get update
RUN apt-get install -y tomcat7
EXPOSE 8080
# resolves issue where tomcat7 starts
RUN service tomcat7 stop
RUN mkdir -p /usr/share/tomcat7/conf/
# resolves issue where catalina.sh expects /usr/share/tomcat7/conf/server.xml to exist
RUN ln -s /etc/tomcat7/server.xml /usr/share/tomcat7/conf/server.xml
# CMD provides instructions for an executing container
CMD export CATALINA_BASE="/var/lib/tomcat7" ; export CATALINA_TMPDIR="/tmp/tomcat7-tomcat7-tmp" ; /usr/share/tomcat7/bin/catalina.sh run
EOF

docker.io build -t docker-tomcat /root/build_directory/

# creates and saves an image to a tar file
docker.io save --output /vagrant/docker-tomcat.tar docker-tomcat

echo "Completed Build and Save of Image"

# confirm the image has been built:
# docker.io images

# description of the "docker.io run" command options and reasons for use:
# --detach: without --detach the user executing the command will not be
# returned to shell prompt
# --name docker-tomcat: without --name the container will need to be
# accessed by a Container ID - access using name is easier than getting the
# Container ID
# --publish 8080: publishes (meaning: exposes the port on the host system)
# docker-tomcat: this is the image to run
# docker.io run --detach --name docker-tomcat --publish 8080:8080 docker-tomcat
# sudo docker run -i -t --publish 8080:8080 docker-tomcat /bin/bash 
