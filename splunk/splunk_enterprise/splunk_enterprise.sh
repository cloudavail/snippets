#!/bin/bash

# to run a splunk server

curl "https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=6.6.1&product=splunk&filename=splunk-6.6.1-aeae3fe0c5af-linux-2.6-amd64.deb&wget=true" \
  --location --silent --output splunk-6.6.1-aeae3fe0c5af-linux-2.6-amd64.deb

dpkg -i splunk-6.6.1-aeae3fe0c5af-linux-2.6-amd64.deb

# http://docs.splunk.com/Documentation/Splunk/6.6.1/Installation/StartSplunkforthefirsttime

#  --accept-license auto-accepts the licensing agreement
/opt/splunk/bin/splunk start --accept-license