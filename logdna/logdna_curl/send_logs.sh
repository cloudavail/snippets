#!/bin/bash
for i in {0..500}
do
  curl "https://logs.logdna.com/logs/ingest?hostname=cjohnson07&tags=dev&now=$(date +%s)" \
  -u 'INSERT_INGESTION_KEY:' \
  -H "Content-Type: application/json; charset=UTF-8" \
  -d '{ 
     "lines": [ 
       { 
         "line":"message"
       }
     ] 
  }'
done
