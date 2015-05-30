#!/usr/bin/env bash


wget http://www.nmon.net/apt-stable/14.04/all/apt-ntop-stable.deb
sudo dpkg -i apt-ntop-stable.deb

apt-get clean all
apt-get -y update

apt-get -y install ntopng

ntopng --daemon
