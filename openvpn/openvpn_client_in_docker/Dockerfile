FROM ubuntu:16.04
RUN apt update
RUN apt -y install openvpn
# need to confirm that /etc/openvpn/client is the correct location
# for OpenVPN client files
RUN mkdir -p /etc/openvpn/client