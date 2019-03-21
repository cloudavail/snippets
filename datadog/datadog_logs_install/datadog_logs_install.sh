#!/bin/bash -

# https://docs.datadoghq.com/agent/basic_agent_usage/ubuntu/?tab=agentv6

bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

# enable logs
sed -i 's/^# logs_enabled:.*/logs_enabled: true/g' /etc/datadog-agent/datadog.yaml

mkdir -p /etc/datadog-agent/conf.d/lastlog.d/
cat > /etc/datadog-agent/conf.d/lastlog.d/conf.yaml <<EOF
# logs_enabled: true does not seem to be allowed in this file
logs:
    ##   service : (mandatory) name of the service owning the log
    ##   source : (mandatory) attribute that defines which integration is sending the logs
    ##   sourcecategory : (optional) Multiple value attribute. Can be used to refine the source attribute
    ##   tags: (optional) add tags to each logs collected

  - type: file
    path: /var/log/lastlog
    service: lastlog
    source: lastlog
EOF

systemctl restart datadog-agent
sleep 5 # allow datadog-agent time to start
# the datadog-agent status
datadog-agent status
# should show a section
# datadog-agent status and search for section "Logs Agent"

# systemctl start datadog-agent
