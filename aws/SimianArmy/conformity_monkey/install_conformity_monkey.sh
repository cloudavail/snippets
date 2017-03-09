#!/usr/bin/env bash

# https://github.com/Netflix/SimianArmy/wiki/Quick-Start-Guide

yum -y install git
git clone git://github.com/Netflix/SimianArmy.git

cd SimianArmy
yum -y install java-1.8.0-openjdk-devel
./gradlew build

sed -i 's/#simianarmy.recorder.localdb.file=\/tmp\/simianarmy_events/simianarmy.recorder.localdb.file=\/tmp\/simianarmy_events/'   ./src/main/resources/simianarmy.properties
sed -i 's/#simianarmy.calendar.isMonkeyTime =.*/simianarmy.calendar.isMonkeyTime = true/' ./src/main/resources/simianarmy.properties

sed -i 's/simianarmy.chaos.enabled =.*/simianarmy.chaos.enabled = false/' ./src/main/resources/chaos.properties
sed -i 's/simianarmy.janitor.enabled =.*/simianarmy.janitor.enabled = false/' ./src/main/resources/janitor.properties 
sed -i 's/simianarmy.volumeTagging.enabled =.*/simianarmy.volumeTagging.enabled = false/' ./src/main/resources/volumeTagging.properties

export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_KEY=''

./gradlew jettyRun
