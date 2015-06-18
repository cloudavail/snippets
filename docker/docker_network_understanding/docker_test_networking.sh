#!/bin/bash

# objective:
apt-get -y install docker.io

# pull a specific docker image
docker.io pull ubuntu:14.04

mkdir /root/build_no_expose
cd /root/build_no_expose
cat > Dockerfile <<EOF
FROM ubuntu:14.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt-get update
RUN apt-get install -y apache2
EOF

docker.io build -t cloudavail/build_no_expose /root/build_no_expose/

# confirm the image has been built:
# docker.io images

mkdir /root/build_expose
cd /root/build_expose
cat > Dockerfile <<EOF
FROM ubuntu:14.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt-get update
RUN apt-get install -y apache2
EXPOSE 80
EOF
docker.io build -t cloudavail/build_expose /root/build_expose/

mkdir /root/build_expose_publish
cd /root/build_expose_publish
cat > Dockerfile <<EOF
FROM ubuntu:14.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt-get update
RUN apt-get install -y apache2
EXPOSE 80
EOF
docker.io build -t cloudavail/build_expose_publish /root/build_expose_publish/

# and run the newly created docker images

docker.io run --detach --name build_no_expose cloudavail/build_no_expose /usr/sbin/apache2ctl -D FOREGROUND

docker.io run --detach --name build_expose cloudavail/build_expose /usr/sbin/apache2ctl -D FOREGROUND

docker.io run --detach --name build_expose_publish --publish 80:80 cloudavail/build_expose_publish /usr/sbin/apache2ctl -D FOREGROUND
