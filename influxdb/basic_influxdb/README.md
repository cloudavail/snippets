# Overview

This snippet is designed to:

- Provide a mechanism for understanding basic InfluxDB operation
- Build an InfluxDB server
- Provide instructions for performing CRUD operations (CRUD = Create, Read, Update, Delete) for databases and data

# Database

## Create Using CLI Tool
1. connect to influx host by running: `influx`
2. Create database: `CREATE DATABASE stocks`
3. Confirm creation: `SHOW DATABASES`

## Create Using API Call
curl --include --request POST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE stocks"

# Measurements and Points

## Create a Price "Measurement" in Stocks Database

`curl --include --request POST 'http://localhost:8086/write?db=stocks' --data-binary 'price,ticker=AAPL value=107.5'`

`curl --include --request POST 'http://localhost:8086/write?db=stocks' --data-binary 'price,ticker=TSLA value=230'`

Note that these commands will return a `204` HTTP response code similar to the following.

`HTTP/1.1 204 No Content`
`Request-Id: 898f19a8-5c2c-11e6-8016-000000000000`
`X-Influxdb-Version: 0.13.0`
`Date: Sat, 06 Aug 2016 23:21:43 GMT`


## Query a Database and Measurement

curl -GET 'http://localhost:8086/query' --data-urlencode "db=stocks" --data-urlencode "q=SELECT * FROM price"

## Filter on a Tag
curl -GET 'http://localhost:8086/query' --data-urlencode "db=stocks" --data-urlencode "q=SELECT * FROM price where ticker='AAPL'"

curl -GET 'http://localhost:8086/query' --data-urlencode "db=stocks" --data-urlencode "q=SELECT * FROM price where ticker='TSLA'"
