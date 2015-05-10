#!/usr/bin/env python

import argparse

import mysql.connector


parser = argparse.ArgumentParser()
parser.add_argument('--server', default='127.0.0.1',
                    help='the MySQL server DNS name or IP address.')
parser.add_argument('--username', help='provide username for connecting to MySQL Server.')
parser.add_argument('--password', help='provide password for connecting to MySQL Server.')
parser.add_argument('--database', help='provide a database to utilize when connecting to MySQL Server.')
args = parser.parse_args()

mysql_connection = mysql.connector.connect(user=args.username,
                                           password=args.password,
                                           host=args.server,
                                           database=args.database,
                                           buffered=True)

print mysql_connection.is_connected()

# ./simple_connection.py --server 127.0.0.1 --username $username --password $password