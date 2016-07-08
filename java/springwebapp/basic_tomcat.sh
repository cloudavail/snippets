#!/bin/bash

apt -y update
apt -y install tomcat8

apt -y install maven
apt -y install default-jdk
cd /vagrant
mvn package

cp /vagrant/target/springwebapp.war /var/lib/tomcat8/webapps/

# tail -f /var/log/tomcat8/catalina.out
# curl localhost:8080/springwebapp/helloWorld
