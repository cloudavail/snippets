# Overview
This document will aid in determining the health of the ZooLeeper and Solr Cloud clusters.

# Determining if the Solr Cloud Node Registers with ZooKeeper
1. After running `ip_address=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')` and `bin/solr start -z 192.168.50.19:2181 -h $ip_address`
2. Login to the Zookeeper node and run the following:
  2a. `/usr/share/zookeeper/bin/zkCli.sh` to launch the Zookeeper client.
  2b. `ls /` to list the znodes - they'll be a number of Solr znodes created, such as: [`security.json`, `clusterstate.json`, `aliases.json`, `live_nodes`, `overseer`, `overseer_elect` and `collections`

# Failure to Connect to a ZooKeeper Server
Failing to connect to a ZooKeeper server is a fatal error. In the example below I mistakenly provided the wrong IP address for the zookeeper server. An example is below:

root@solr1:/home/vagrant/solr-5.4.0# bin/solr start -z 192.168.50.9:2181 -h $HOSTNAME
Waiting up to 30 seconds to see Solr running on port 8983 [-]  Still not seeing Solr listening on 8983 after 30 seconds!
2016-01-18 07:03:05.158 WARN  (main-SendThread(192.168.50.9:2181)) [   ] o.a.z.ClientCnxn Session 0x0 for server null, unexpected error, closing socket connection and attempting reconnect
java.net.NoRouteToHostException: No route to host
	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:744)
	at org.apache.zookeeper.ClientCnxnSocketNIO.doTransport(ClientCnxnSocketNIO.java:361)
	at org.apache.zookeeper.ClientCnxn$SendThread.run(ClientCnxn.java:1081)
2016-01-18 07:03:09.261 WARN  (main-SendThread(192.168.50.9:2181)) [   ] o.a.z.ClientCnxn Session 0x0 for server null, unexpected error, closing socket connection and attempting reconnect

The error is not entirely clear, but notice: `main-SendThread(192.168.50.9:2181))` - this was the IP address where the Zookeeper server is supposed to be located.

# Failure to Connect to Another Node

root@solr1:/home/vagrant/solr-5.4.0# bin/solr create -c gettingstarted

Connecting to ZooKeeper at 192.168.50.19:2181 ...
Uploading /home/vagrant/solr-5.4.0/server/solr/configsets/data_driven_schema_configs/conf for config gettingstarted to ZooKeeper at 192.168.50.19:2181

Creating new collection 'gettingstarted' using command:
http://localhost:8983/solr/admin/collections?action=CREATE&name=gettingstarted&numShards=1&replicationFactor=1&maxShardsPerNode=1&collection.configName=gettingstarted


ERROR: Failed to create collection 'gettingstarted' due to: org.apache.solr.client.solrj.SolrServerException:IOException occured when talking to server at: http://solr2:8983/solr
