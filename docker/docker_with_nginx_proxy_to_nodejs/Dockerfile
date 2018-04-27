FROM ubuntu:xenial
EXPOSE 80
EXPOSE 3000
# we overwrite default.conf to enable the location / directive
COPY default.conf /etc/nginx/conf.d/default.conf
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN apt -y update
RUN apt -y install nginx
# for purposes of this snippet prefer official install over
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN apt -y update
RUN apt -y install nodejs
RUN apt -y install npm
RUN mkdir -p /var/node/
# installs source
COPY ./static /var/node/static
RUN cd /var/node/static ; npm install
# requires the execute bit (chmod +x be set prior to copying)
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
