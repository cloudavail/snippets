#!/bin/bash
supervisord -c "/etc/supervisord.conf"

while sleep 60; do
  supervisorctl status all
done
