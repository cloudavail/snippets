# Overview

This document describes how to send in logs to LogDNA via `curl`.

# Sending a Log Entry

```
curl "https://logs.logdna.com/logs/ingest?hostname=EXAMPLE_HOST&mac=C0:FF:EE:C0:FF:EE&ip=10.0.1.101&now=$(date +%s)" \
-u INSERT_INGESTION_KEY: \
-H "Content-Type: application/json; charset=UTF-8" \
-d \
'{ 
   "lines": [ 
     { 
       "line":"This is an awesome log statement", 
       "app":"myapp",
       "level": "INFO",
       "env": "production",
       "meta": {
         "customfield": {
           "nestedfield": "nestedvalue"
         }
       }
     }
   ] 
}'
```

# Reference

https://docs.logdna.com/reference