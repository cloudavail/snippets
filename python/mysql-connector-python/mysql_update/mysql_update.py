#!/usr/bin/env python3

import mysql.connector
import os

mydb = mysql.connector.connect(user='root',
                               password=os.environ.get(MYSQL_ROOT_PASSWORD),
                               host='localhost',
                               database='test')

print(mydb.is_connected())

mycursor = mydb.cursor()

mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")


sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("John", "Highway 21")
mycursor.execute(sql, val)

mycursor.execute("SELECT * FROM customers")
myresult = mycursor.fetchall()
print(myresult)

# ./simple_connection.py --server 127.0.0.1 --username $username --password $password
