#!/bin/bash

apt update
apt -y install easy-rsa openvpn

sed -i 's/export KEY_COUNTRY=.*/export KEY_COUNTRY="US"/g' /usr/share/easy-rsa/vars
sed -i 's/export KEY_PROVINCE=.*/export KEY_PROVINCE="California"/g' /usr/share/easy-rsa/vars
sed -i 's/export KEY_CITY=.*/export KEY_CITY="San Francisco"/g' /usr/share/easy-rsa/vars
sed -i 's/export KEY_ORG=.*/export KEY_ORG="CloudAvail"/g' /usr/share/easy-rsa/vars
sed -i 's/export KEY_OU=.*/export KEY_OU="Engineering"/g' /usr/share/easy-rsa/vars
sed -i 's/export KEY_EMAIL=.*/export KEY_EMAIL="colin@cloudavail.com"/g' /usr/share/easy-rsa/vars

cd /usr/share/easy-rsa
source vars
export KEY_CONFIG=$EASY_RSA/openssl-1.0.0.cnf #<-This format works

./clean-all
# ./build-ca - launches ./pkitool as interactive
./pkitool --initca
./build-dh
# ./build-key-server vpn.cloudavail.com
# where vpn.cloudavail.com (or the first argument is the commonname of the server)
./pkitool --server 'vpn.cloudavail.com'
./pkitool 'colin'

cat > /etc/openvpn/cloudavail.conf <<EOF
# the entirety of this configuration is to allow connectivity from an OpenVPN client
ca /usr/share/easy-rsa/keys/ca.crt
cert /usr/share/easy-rsa/keys/vpn.cloudavail.com.crt
key /usr/share/easy-rsa/keys/vpn.cloudavail.com.key
dh /usr/share/easy-rsa/keys/dh2048.pem
# crl-verify only needed if we have revoked certificates
# crl-verify /usr/share/easy-rsa/keys/crl.pem
# LDAP Integration
plugin /usr/lib/openvpn/openvpn-auth-ldap.so /etc/openvpn/auth/auth-ldap.conf
verify-client-cert none
dev tun
server 172.16.254.0 255.255.255.0
verb 3
EOF

# copy keys to appropriate directory
cp /usr/share/easy-rsa/keys/ca.crt /vagrant/
cp /usr/share/easy-rsa/keys/colin.crt /vagrant/
cp /usr/share/easy-rsa/keys/colin.key /vagrant/

#!/bin/bash
apt -y install openvpn-auth-ldap
mkdir -p /etc/openvpn/auth
cat > /etc/openvpn/auth/auth-ldap.conf <<EOF
# note: values do not need to be placed in quotes
<LDAP>
  # LDAP server URL
  URL ldaps://ldap.foxpass.com
  BindDN cn=openvpn,dc=cloudavail,dc=com
  # replace \$password with password
  Password \$password
  # Timeout is required to avoid issues where
  # LDAP bind failed: Timed out
  Timeout 15
  TLSEnable no
  FollowReferrals yes
</LDAP>
<Authorization>
  BaseDN ou=people,dc=cloudavail,dc=com
  SearchFilter (&(uid=%u))
  RequireGroup false
</Authorization>
EOF

# ldapsearch -H ldaps://ldap.foxpass.com -D 'cn=openvpn,dc=cloudavail,dc=com' -w $password -b 'ou=groups,dc=cloudavail,dc=com' 'objectClass=*'