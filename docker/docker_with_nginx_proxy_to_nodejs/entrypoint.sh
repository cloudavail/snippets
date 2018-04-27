#!/bin/bash
nodejs /var/node/static/server.js &
/usr/sbin/nginx
tail -f /dev/null