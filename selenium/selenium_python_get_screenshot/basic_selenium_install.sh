#!/bin/bash

apt-get -y update

# install the python selenium client
apt-get -y install python-pip
pip install selenium
pip install pyvirtualdisplay

# install firefox
apt-get -y install firefox
apt-get -y install xvfb xserver-xephyr

python /vagrant/get_screenshot.py
