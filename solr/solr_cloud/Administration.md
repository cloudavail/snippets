# Overview
This document will aid in configuring a test ZooKeeper server.

# Starting and Shutting Down Solr
`ip_address=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')`
`bin/solr start -z 192.168.50.19:2181 -h $ip_address`

# Creating One Shard, Replicated Twice
`bin/solr create -c gettingstarted -shards 1 -replicationFactor 2`
`bin/post -c gettingstarted example/exampledocs/*.xml`
The result is a single shard that is replicated across two Solr processes - ideally these Solr processes run on two different Solr servers.

# Creating Two Shards, Replicated Twice
`bin/solr create -c gettingstarted -shards 2 -replicationFactor 2`
`bin/post -c gettingstarted example/exampledocs/*.xml`
The result is two shards that is replicated across two Solr processes - ideally these two Solr processes are run on two different Solr servers.

# Removing a "Gone" Replica
The specific commands below are for Solr version 5.0 or newer.

1. Login to the ZooKeeper node and run `/usr/share/zookeeper/bin/zkCli.sh`
2. Run `get /collections/$collection_name/state.json` - this will return a json document describing the state of the given collection.
3. With the returned state document, look in the shards collection - you'll see this is broken down into one of more shard collections, with each shard having a number of replicas comprised of a number of cores. Some of these replica "core nodes" will be reported as "state":"down". These are the core nodes that need to be removed.
4. Run the following command:

`curl http://$url_of_solr_instance:$port/solr/admin/collections?action=DELETEREPLICA&collection=$collection_name&shard=$shard_number&replica=$core_node_name`

Examples:

`curl "http://192.168.50.11:8983/solr/admin/collections?action=DELETEREPLICA&collection=gettingstarted&shard=shard2&replica=core_node2"`

`curl "http://192.168.50.11:8983/solr/admin/collections?action=DELETEREPLICA&collection=gettingstarted&shard=shard1&replica=core_node1"`



