#!/bin/bash

# objective:
# create a Docker image in an automated fashion
# the Docker image will be built using a Dockerfile

aws_account_id='123456789012'
region='us-west-2'

apt -y install awscli
apt -y install docker.io

# you'll need to retrieve credentials by running the following:
# aws ecr get-login --region us-west-2

# pull a specific docker image
docker pull ubuntu:16.04
mkdir /root/dockerfiles

# make apache2 image
mkdir /root/dockerfiles/apache2
cd /root/build_directory/apache2
cat > /root/dockerfiles/apache2/Dockerfile <<EOF
FROM ubuntu:16.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt -y update
RUN apt -y install apache2
EXPOSE 80
EOF

# make nginx image
mkdir /root/dockerfiles/nginx
cat > /root/dockerfiles/nginx/Dockerfile <<EOF
FROM ubuntu:16.04
MAINTAINER Colin Johnson "colin@cloudavail.com"
RUN apt -y update
RUN apt -y install nginx
EXPOSE 80
EOF

# build the damn things!
docker build -t cloudavail/apache2 /root/dockerfiles/apache2
docker build -t cloudavail/nginx /root/dockerfiles/nginx

docker tag cloudavail/apache2:latest $aws_account_id.dkr.ecr.$region.amazonaws.com/cloudavail/apache2:latest
docker tag cloudavail/nginx:latest $aws_account_id.dkr.ecr.$region.amazonaws.com/cloudavail/nginx:latest

docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/cloudavail/apache2:latest
docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/cloudavail/nginx:latest
