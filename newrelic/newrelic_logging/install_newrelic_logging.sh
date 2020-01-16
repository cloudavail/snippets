# https://docs.newrelic.com/docs/logs/enable-logs/enable-logs/fluentd-plugin-logs#fluentd-plugin

apt -y install ruby
# ruby-dev needed to resolve issue
# mkmf.rb can't find header files for ruby at /usr/lib/ruby/include/ruby.h
apt -y install ruby-dev
apt -y install gcc make

gem install fluentd
fluent-gem install fluent-plugin-newrelic

echo "NewRelic License Key is: $NEWRELIC_LICENSE_KEY"

mkdir /etc/fluent
cat > /etc/fluent/fluent.conf <<EOF
<source>
  @type tail
  path /var/log/syslog
  tag tag system.syslog
  <parse>
    @type none
  </parse>
</source>
<match system.syslog>
  @type newrelic
  license_key "#{ENV['NEWRELIC_LICENSE_KEY']}"
</match>
EOF
