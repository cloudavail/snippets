# Build the OpenVPN Amazon Linux 2 Image

`docker build -t cloudavail/openvpn ./`

# Run the OpenVPN Amazon Linux 2 Image

`docker run -it -p 1194:1194 --privileged --volume $(PWD)/pki:/usr/share/easy-rsa/3/pki --volume $(PWD)/openvpn:/etc/openvpn cloudavail/openvpn /bin/bash`
