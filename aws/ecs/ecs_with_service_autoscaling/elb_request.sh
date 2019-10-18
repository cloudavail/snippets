#!/bin/bash

for i in {1..5}; do
  echo "Generating ELB Requests for minute: $i"
  # curl site 400 times to generate requests 
  for j in {1..600}; do
    echo "Sending request: $j for minute: $i"
    curl http://ecswi-ecsin-1ugukv9tsko3h-1374552743.us-west-2.elb.amazonaws.com/ 2&> /dev/null
  done
  sleep 55
done
