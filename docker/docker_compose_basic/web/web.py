import mysql.connector
from flask import Flask

app = Flask(__name__)


class mysqlConnection:

    config = {
        'user': 'root',
        'password': 'password',
        'host': 'mysql'
    }

    cnx = mysql.connector.connect(**config)
    cnx.cursor().execute('use test;')

    def __init__(self):
        self.cnx.cursor().execute('CREATE TABLE my_table (count VARCHAR(100));')


class count:

    number = 0
    @classmethod
    def count(cls):
        cls.number += 1
        return cls.number


@app.route('/')
def root():
    cur = mysqlConnection.cnx.cursor()
    cur.execute('SELECT * FROM test_table;')
    tmp_string = ''
    for item in cur.fetchall():
        tmp_string += '{0}\n'.format(item)
    if tmp_string == '':
        tmp_string = 'First visit'
    cur.execute('INSERT INTO test_table VALUES("visit_{0}")'.format(count.count()))
    return tmp_string


if __name__ == '__main__':
    app.run(host='0.0.0.0')
    mysqlConnection()
