#!/bin/bash -

# objective:
# run a tftpd server
# serve content that is placed in the tftpd_server folder
# https://help.ubuntu.com/community/TFTP

apt -y install tftpd-hpa

# copy any files needed from /vagrant to /var/lib/tftpboot
# cp /vagrant/tftpd_files /var/lib/tftpboot/
# configuration for tftpd-hpa is in /etc/default/tftpd-hpa
# systemctl status tftpd-hpa
