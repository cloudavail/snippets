#!/bin/bash

#!/bin/bash

cd /var/tmp

curl --silent --location https://web-lbm-msp.crashplanpro.com/client/installers/CrashPlanPRO_4.8.2_1436674800482_4_Linux.tgz --output CrashPlan_4.8.2_Linux.tgz
# extract CrashPlan application
tar xzf CrashPlan_4.8.2_Linux.tgz
cd crashplan-install

sed -i 's/INTERVIEW=0/INTERVIEW=1/g' ./install.sh
sed -i 's/read ENTER/# read ENTER/g' ./install.sh

mkdir /usr/local/crashplan
./install.sh recall
