#!/usr/bin/env python

import os

from flask import Flask
application = Flask(__name__)

application.config.debug = True
application.config.from_envvar('CONFIG_FILE')


@application.route('/')
def hello_world():
    return 'Database Hostname/IP: {}'.format(application.config['DATABASE'])

# many tutorials include this - but it is not needed
if __name__ == '__main__':
    application.run()
