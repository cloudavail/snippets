#!/bin/bash -

# the commands below will complete an unattanded OpenLDAP installation on ubuntu/bionic64
apt update
# if you wish to see which options are able to be configured via debconf, run
# apt -y install  debconf-utils
# and then run
# debconf-get-selections | grep slapd
# echo -e 'slapd slapd/internal/adminpw password' | debconf-set-selections
echo -e 'slapd/domain cloudavail.com' | debconf-set-selections
export DEBIAN_FRONTEND='non-interactive'
apt -y install slapd

# the ldap-utils package is required for performing CLI LDAP operations
apt -y install ldap-utils
ldapadd -Y EXTERNAL -H ldapi:/// -f /vagrant/cloudavail_db_config.ldif
ldapadd -x -H ldap://localhost -D "cn=admin,dc=cloudavail,dc=com" -w secret -f /vagrant/cloudavail_db_data.ldif
