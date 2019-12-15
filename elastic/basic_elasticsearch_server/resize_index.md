# Create an Index

```
curl --request PUT http://localhost:9200/test -H 'Content-Type: application/json' -d '
{
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 0
    }
}
'
```

# Get an Index

`curl --request GET http://localhost:9200/test`

# Create a New Index

```
curl --request PUT http://localhost:9200/test_resized -H 'Content-Type: application/json' -d '
{
    "settings" : {
        "number_of_shards" : 3,
        "number_of_replicas" : 1
    }
}
'
```

# Copy an Index
```
curl --request POST http://localhost:9200/_reindex -H 'Content-Type: application/json' -d '
{ 
  "source": {
    "index": "test"
  },
  "dest": {
    "index": "test_resized"
  }
}'
```

# Get an Index

`curl --request GET http://localhost:9200/test_resized`
