#!/usr/bin/env bash

# the vagrant instance does not use the saltstack/salt ppa
# which is not a revent version

SALT_REPO="https://github.com/saltstack/salt"

# http://docs.saltstack.com/en/latest/topics/development/hacking.html
apt-get -y install git
git clone $SALT_REPO /root/salt

apt-get -y install python-virtualenv
# install python-psutil outside of the virtualenv
# pip fails to install psutil properly in 
# apt-get -y install python-psutil
# python-dev required for use of pyzmq
apt-get -y install python-dev

apt-get -y install python-m2crypto
virtualenv /root/salt_venv --system-site-packages
source /root/salt_venv/bin/activate
pip install pyzmq PyYAML pycrypto msgpack-python jinja2 psutil
pip install -e /root/salt

# and get started
# source /root/salt_venv/bin/activate
