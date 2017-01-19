#!/bin/bash -

# from: http://docs.fluentd.org/articles/install-by-rpm

curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
systemctl start td-agent

# create a sysconfig file that allows read of system files
cat > /etc/sysconfig/td-agent <<EOF
# setting TD_AGENT_USER and TD_AGENT_GROUP
# makes possible accessing log files owned by root, such as:
# /var/log/messages and /var/log/secure
TD_AGENT_USER=root
TD_AGENT_GROUP=root
export LOG_NAME=all_fluentd_events.out
EOF

# create a td-agent configuration file
mv /etc/td-agent/td-agent.conf /etc/td-agent/td-agent.conf.bak
cat > /etc/td-agent/td-agent.conf <<EOF
@include /etc/td-agent/config.d/source.d/*.conf
@include /etc/td-agent/config.d/match.d/*.conf
EOF

# create td-agent configuration subdirectories
mkdir -p /etc/td-agent/config.d
mkdir -p /etc/td-agent/config.d/source.d
mkdir -p /etc/td-agent/config.d/match.d

# create td-agent configuration files for source and match sections
cat > /etc/td-agent/config.d/source.d/system_logs.conf <<EOF
<source>
  @type tail
  format syslog
  path /var/log/messages, /var/log/secure
  pos_file /var/log/td-agent/syslog_logs.pos
  read_from_head true
  tag system_logs.*
</source>
EOF

cat > /etc/td-agent/config.d/match.d/match_all.conf <<EOF
<match **>
    type file
    path "/var/log/td-agent/#{ENV['LOG_NAME']}"
</match>
EOF

systemctl restart td-agent
