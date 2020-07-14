#!/usr/bin/env bash

echo "Ubuntu has started"
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install curl
curl -O http://vestacp.com/pub/vst-install.sh
# vagrant ssh
# sudo bash vst-install.sh --force
# enter $email