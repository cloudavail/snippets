#!/bin/bash
apt-get -y update

apt-get -y install rabbitmq-server

systemctl restart rabbitmq-server

# install requirements for tutorial
# install pip, which is neccessary for installing requirements
apt-get -y install python-pip
# install pika
pip install pika

# create a queue and send a message
# /vagrant/send.py
# list queues
# rabbitmqctl list_queues
# receive a message
# /vagrant/receive.py
