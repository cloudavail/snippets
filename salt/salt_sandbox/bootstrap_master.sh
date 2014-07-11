#!/usr/bin/env bash

sudo add-apt-repository ppa:saltstack/salt
sudo apt-get -y install salt-master

# instruct the salt master to listen on all interfaces
sed -i 's/#interface: 0.0.0.0/interface: 0.0.0.0/' /etc/salt/master

# restart salt-master
service salt-master restart

# sign certificate requests once a minute
cat > /etc/cron.d/salt_key_sign <<EOF
* * * * * root yes | salt-key -A minion
EOF

mkdir -p /srv/salt
# extend configuration to include a file root
cat > /etc/salt/master.d/config <<EOF
file_roots:
  base:
    - /srv/salt/
EOF
# create a "top.sls" file
# the top.sls does the following:
cat > /srv/salt/top.sls <<EOF
# the base directive will
# the '*' wildcard is a selector, in this case targeting all hosts
# the selector could also be 'os:Ubuntu': for instance
# the all_hosts directive tells salt to examine all hosts
base:
  '*':
    - global
EOF

cat > /srv/salt/global.sls <<EOF
# the first line is an 'id declaration'
# the second line is a 'state declaration'
# the subsequent lines are 'function declarations'
colin:
  user.present:
    - fullname: Colin Johnson
    - password: test
EOF

# run salt state.highstate on all minions
# salt '*' state.highstate
