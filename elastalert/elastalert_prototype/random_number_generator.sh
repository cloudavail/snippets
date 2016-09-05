#!/bin/bash

# makes logs for the purposes of testing elastalert
# once a second, generate a "heartbeat" log entry

es_protocol="http"
es_host="127.0.0.1"
es_port="9200"
es_index="my_application"

# create $es_index
# curl --request PUT "$es_protocol://$es_host:$es_port/$es_index" -d "{ \"mappings\": { \"random_number\": { \"properties\": { \"date\": { \"type\": \"date\", \"format\": \"epoch_second\" } } } } }"

for i in {1..300}; do
epoch=$(date --iso-8601=seconds)
random_number=$((( RANDOM % 10 ) + 1))
# echo $epoch
# echo $random_number
# echo $heartbeat_value
curl --request POST "$es_protocol://$es_host:$es_port/$es_index/random_number" -d "{ \"date\": \"$epoch\", \"random_number\": \"$random_number\"}"
sleep 1
done

# curl --request GET "$es_protocol://$es_host:$es_port/$es_index/random_number/_search?pretty"
# curl --request DELETE "$es_protocol://$es_host:$es_port/$es_index"
