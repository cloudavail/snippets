#!/bin/bash

# Note that this script does not use the official install procedure from
# https://docs.gitlab.com/runner/install/linux-manually.html

echo "LogDNA Ingention Key: $LOGDNA_KEY"

# install procedure is from https://app.logdna.com/account/onboarding
echo "deb https://repo.logdna.com stable main" | sudo tee /etc/apt/sources.list.d/logdna.list
wget -O- https://repo.logdna.com/logdna.gpg | sudo apt-key add -
apt update
apt -y install logdna-agent
logdna-agent -k $LOGDNA_KEY # this is your unique Ingestion Key
# /var/log is monitored/added by default (recursively), optionally add more dirs with:
# logdna-agent -d /path/to/log/folders
# You can configure the agent to tag your hosts with:
# logdna-agent -t mytag,myothertag
# update-rc.d logdna-agent defaults
# /etc/init.d/logdna-agent start
