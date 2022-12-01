# Overview

This document describes how to operate an OpenVPN client within Docker.

# Docker Usage

## Build

`docker build --tag cloudavail/openvpn-client ./`

## Docker Run

`docker run -it --volume $(pwd)/openvpn_client_files:/etc/openvpn/client cloudavail/openvpn-client /bin/bash`

# Connecting using OpenVPN

## Manual Connection

- place the `.ovpn` file in the directory openvpn_client_files on your local system (this is mounted into the Docker container if you used the command above)
- run the Docker image using the command shown in the "Docker: Docker Run" section
- inside the container, run a command like `openvpn --config /etc/openvpn/client/openvpn-test.ovpn`
- this should show the OpenVPN software running as a client and attempting to connect

# Reference

- https://www.shellhacks.com/openvpn-connect-client-setup-install-config-linux/
