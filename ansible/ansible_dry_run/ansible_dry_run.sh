#!/bin/bash

# http://docs.ansible.com/ansible/intro_installation.html#latest-release-via-yum
yum -y install epel-release
yum -y install ansible

cd /vagrant/sample_playbook

# run the command without --check - should _not_ perform an install
ansible-playbook sample_playbook.yaml --check
# test if apache2 has been installed
yum list installed | grep httpd

# run the command without --check - should perform an install
ansible-playbook sample_playbook.yaml
# test if apache2 has been installed
yum list installed | grep httpd
# should return akin to the following
# [root@ansible playbooks]# yum list installed | grep httpd
# httpd.x86_64                            2.4.6-45.el7.centos            @base    
# httpd-tools.x86_64                      2.4.6-45.el7.centos            @base    
