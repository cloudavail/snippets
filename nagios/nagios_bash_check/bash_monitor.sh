#!/bin/bash

# Reference:
# https://www.digitalocean.com/community/tutorials/how-to-create-nagios-plugins-with-bash-on-ubuntu-12-10

random_value=$(($RANDOM % 10 ))
echo $random_value

case $random_value in
  [0-6]) echo "OK - Random Value: $random_value" ; exit 0 ;;
  7) echo "WARNING - Random Value: $random_value" ; exit 1 ;;
  8) echo "CRITICAL - Random Value: $random_value" ; exit 2 ;;
  9) echo "UNKNOWN - Random Value: $random_value" ; exit 3 ;;
esac
