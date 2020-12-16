# Kafka

`$ docker run -it --rm --name mysqlterm --link mysql --rm mysql:5.7 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'`


```
curl -H "Accept:application/json" localhost:8083
{"version":"2.6.0","commit":"62abe01bee039651","kafka_cluster_id":"LG8pEkNrToOpzUObaj9Kgw"}
```

```
curl -H "Accept:application/json" localhost:8083/connectors/
[]
```

```
$ curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{ "name": "inventory-connector", "config": { "connector.class": "io.debezium.connector.mysql.MySqlConnector", "tasks.max": "1", "database.hostname": "mysql", "database.port": "3306", "database.user": "debezium", "database.password": "dbz", "database.server.id": "184054", "database.server.name": "dbserver1", "database.include.list": "inventory", "database.history.kafka.bootstrap.servers": "kafka:9092", "database.history.kafka.topic": "dbhistory.inventory" } }'
```
```
curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/inventory-connector
```

```
docker run -it --rm --name watcher --link zookeeper:zookeeper --link kafka:kafka debezium/kafka:1.3 watch-topic -a -k dbserver1.inventory.customers
```