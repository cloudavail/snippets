#!/bin/bash
# from https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt -y update
apt -y install jenkins

# /var/lib/$NAME

# access Jenkins: http://localhost:8080/
