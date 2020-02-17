#!/bin/bash

# Download Locations
# https://openvpn.net/index.php/access-server/download-openvpn-as-sw.html
curl -L -O http://swupdate.openvpn.org/as/openvpn-as-2.1.12-Ubuntu16.amd_64.deb
dpkg -i openvpn-as-2.1.12-Ubuntu16.amd_64.deb

open_vpn_password=$(openssl rand -base64 18)
echo "Open VPN Password Will Be: $open_vpn_password"
echo "openvpn:$open_vpn_password" | chpasswd

# the OpenVPN installer will return the following:
# at this moment you'll need to change these settings
# I'm currently using /usr/local/openvpn_as/bin/ovpn-init
# but you should be able to do this with either confdba or sacli
# Access Server Web UIs are available here:
# Admin  UI: https://10.0.2.15:943/admin
# Client UI: https://10.0.2.15:943/

# https://docs.openvpn.net/command-line/configuration-database-management-and-backups/

# command line client for configuration
# /usr/local/openvpn_as/scripts/confdba
# /usr/local/openvpn_as/scripts/sacli
