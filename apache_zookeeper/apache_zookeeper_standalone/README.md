# Overview
The apache_zookeeper_standalone snippet is created to provide a simple environment for testing Apache Zookeeper in a standalone configuration.

# Confirm Zookeeper Running

## Using init.d Script
`service zookeeper status`
## Confirm Ports are Listening
    root@zookeeper:~# lsof -i -P | grep zookeeper
    java      4622 zookeeper   29u  IPv6  14835      0t0  TCP *:38111 (LISTEN)
    java      4622 zookeeper   35u  IPv6  15059      0t0  TCP *:2181 (LISTEN)

# Configuring Zookeeper
## Configuration Files
`/etc/zookeeper/conf/zoo.conf`

## Run Zookeeper Client
The Zookeeper client on an Ubuntu 14.04 LTS system is located at the following location:  `/usr/share/zookeeper/bin/zkCli.sh`

# Zookeeper Operations
To perform any of the tasks described below you'll first need to run the Zookeeper client, which is at `/usr/share/zookeeper/bin/zkCli.sh` in an Ubuntu 14.04 system.

## Create a new znode:

- Run `create /my_znode my_znode_value` to create a new znode
- Run `ls /` to list all znodes in `/` 

## Read a znode:
- Run `get /my_znode`
- The value written previously will be returned

## Update a znode:
- Run `set /my_znode my_new_znode_value`
- Run `get /my_znode`
- The value written by the `set` command will be returned

## Delete a znode:
- Run `delete /my_znode`
- Run `get /my_znode` - the following will be returned `Node does not exist: /my_znode
`
- Run `ls /` to list all znodes in `/` - the `/my_znode` node will no longer exist

# Reference
- http://zookeeper.apache.org/doc/current/zookeeperStarted.html