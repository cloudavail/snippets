import mysql.connector
import datetime
from flask import Flask

app = Flask(__name__)


class mysqlConnection:

    config = {
        'user': 'root',
        'password': 'password',
        'host': 'mysql',
        'database': 'visits'
    }

    cnx = mysql.connector.connect(**config)


@app.route('/')
def root():
    start_time = datetime.datetime.now()
    cur = mysqlConnection.cnx.cursor()
    cur.execute('SELECT * FROM visit_stats;')
    min_time = 1000
    max_time = 0
    total_time = 0
    all_items = cur.fetchall()
    if len(all_items) != 0:
        for item in all_items:
            if min_time > item[0]:
                min_time = item[0]
            if max_time < item[0]:
                max_time = item[0]
            total_time += item[0]
        avg_time = max_time / len(all_items)
    else:
        avg_time = 0
        min_time = 0

    tmp_string = '<h1>Visit Statistics</h1>\n'
    tmp_string += '<table><tr><th># of requests |</th><th>Avg. Response Time |</th><th>Min. Response Time |</th><th>Max Response Time</th></tr>'
    tmp_string += '<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}<td></tr><table>'.format(
        len(all_items), avg_time, min_time, max_time)
    seconds_elapsed = (datetime.datetime.now() - start_time).microseconds
    cur.execute('INSERT INTO visit_stats VALUES({0})'.format(seconds_elapsed))
    return tmp_string


if __name__ == '__main__':
    app.run(host='0.0.0.0')
