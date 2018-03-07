#!/usr/bin/env python

from flask import Flask

app = Flask(__name__)

@app.route('/')
def root():
    return 'Root Route Called.'


if __name__ == '__main__':
    app.run(host='0.0.0.0')
