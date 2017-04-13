#!/bin/bash -

# from: https://github.com/erkin/ponysay

apt -y install texinfo

cd /var/tmp
wget -O ponysay_3.0.2.tar.gz https://github.com/erkin/ponysay/archive/3.0.2.tar.gz 
tar xvf ponysay_3.0.2.tar.gz
cd ponysay-3.0.2
./setup.py --freedom=partial install
