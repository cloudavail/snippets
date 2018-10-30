#!/bin/bash -

# the commands below will complete an unattanded OpenLDAP installation on ubuntu/bionic64
apt update
# if you wish to see which options are able to be configured via debconf, run
# apt -y install  debconf-utils
# and then run
# debconf-get-selections | grep slapd
# echo -e 'slapd slapd/internal/adminpw password' | debconf-set-selections
export DEBIAN_FRONTEND='non-interactive'
apt -y install slapd
