#!/bin/bash -

# from: http://docs.fluentd.org/articles/install-by-rpm

curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
systemctl start td-agent
