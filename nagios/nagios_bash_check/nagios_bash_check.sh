#!/bin/bash

# objective:
# install and startup nagios
# make nagios web interface available

apt-get -y update


debconf-set-selections <<< 'postfix postfix/main_mailer_type select No configuration'
debconf-set-selections <<< 'nagios3-cgi nagios3/adminpassword password nagiosadmin'
debconf-set-selections <<< 'nagios3-cgi nagios3/adminpassword-repeat password nagiosadmin'

apt-get -y install nagios3

# access server at http://192.168.2.2/nagios3/
# username: nagiosadmin
# password: nagiosadmin

cat > /etc/nagios3/conf.d/bash_monitor.cfg <<EOF

define command {
  command_name    bash_monitor
  command_line    /vagrant/bash_monitor.sh
}

define service {
  use                             generic-service
  host_name                       localhost
  service_description             Custom Bash Check
  check_command                   bash_monitor
}

EOF
