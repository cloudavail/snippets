#!/usr/bin/env python

from flask import Flask
application = Flask(__name__)


@application.route('/')
def hello_world():
    return 'Hello World!'

# many tutorials include this - but it is not needed
# if __name__ == '__main__':
#     app.run()
