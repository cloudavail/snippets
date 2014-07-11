#!/usr/bin/env bash

sudo add-apt-repository ppa:saltstack/salt
sudo apt-get -y install salt-minion

# a default salt minion will connect to a host named "salt"
sed -i 's/#master: salt/master: 192.168.2.5/' /etc/salt/minion

# restart salt-minion
service salt-minion restart
