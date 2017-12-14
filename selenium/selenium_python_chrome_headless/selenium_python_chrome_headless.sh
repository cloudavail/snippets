#!/bin/bash

# References:
# https://developers.google.com/web/updates/2017/04/headless-chrome#drivers
# https://intoli.com/blog/running-selenium-with-headless-chrome/

apt -y update

apt -y install chromium-browser

# required to unzip
apt -y install unzip
# required chromedriver dependencies - you can test for dependencies by running
# ./chromedriver repeatedly and installing dependencies until chromedriver runs clean
# ./chromedriver: error while loading shared libraries: libnss3.so: cannot open shared object file: No such file or directory
# ./chromedriver: error while loading shared libraries: libgconf-2.so.4: cannot open shared object file: No such file or directory
# ./chromedriver: error while loading shared libraries: libfontconfig.so.1: cannot open shared object file: No such file or directory
apt -y install libnss3 libgconf-2-4 libfontconfig
# test by running ./chromedriver
chromedriver_version='2.34'
curl --silent --output chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$chromedriver_version/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
# chromedriver executable must be in $PATH
mv chromedriver /usr/local/bin/

# install the python selenium client
apt -y install python-pip
pip install selenium

python /vagrant/get_screenshot.py
cp cloudavail.com.png /vagrant/cloudavail.com.png
