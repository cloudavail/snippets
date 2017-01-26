#!/usr/bin/env bash

yum -y install httpd

systemctl enable httpd.service
# systemctl is-enabled httpd.service
