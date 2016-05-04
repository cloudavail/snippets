# Testing Connectivity
## SSH into the Vagrant Instance
`ssh vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key`

## Test Ansible Connectivity to Vagrant
`ansible testserver -i playbooks/hosts -m ping`

## Install NTP
`ansible-playbook --inventory-file playbooks/hosts playbooks/ntp.yml`