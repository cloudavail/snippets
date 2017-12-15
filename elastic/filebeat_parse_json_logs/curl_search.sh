#!/bin/bash
curl -POST 'localhost:9200/_search' -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {"match": {"profile.currentResources.logging.dailySpendingCap": 890}}
      ]
    }
  }
}
'
