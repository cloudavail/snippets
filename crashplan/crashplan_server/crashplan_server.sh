#!/bin/bash

oracla_java_name='oracla_java_1.8.rpm'
yum -y install wget
wget http://javadl.oracle.com/webapps/download/AutoDL?BundleId=211988 --output-document=$oracla_java_name
rpm --install $oracla_java_name
wget https://download.code42.com/installs/proserver/5.3.0/Code42server_5.3.0_Linux.tgz
tar xf Code42server_5.3.0_Linux.tgz
cd Code42server_5.3.0_Linux
sed -i 's/INSTALL_UNATTENDED=0/INSTALL_UNATTENDED=1/g' ./install.sh
sed -i 's/AUTO_ACCEPT_EULA=0/AUTO_ACCEPT_EULA=1/g' ./install.sh
./install.sh
