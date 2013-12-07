#!/usr/bin/env python

# objective - use python to get the list of dynos for a given app through the
# Heroku API

# notes:
# https://github.com/heroku/heroku.py is a likely alternative for managing
# heroku through python

import logging

import requests

# global configuration
app_name = 'xxxxxx-xxxxxx-xxxx'
heroku_app_key = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
logging.basicConfig(level=logging.DEBUG)

# the string passed to requests.auth.HTTPBasicAuth is your API Key
# your API Key is available from https://dashboard.heroku.com/account
herokuAuth = requests.auth.HTTPBasicAuth('', heroku_app_key)
headers = {'Accept': 'application/vnd.heroku+json; version=3'}


def heroku_get_dynos():
    # get_dynos returns a requests.models.Response object
    get_dynos = requests.get(url='https://api.heroku.com/apps/{!s}/dynos'.format(app_name),
                             auth=herokuAuth, headers=headers, verify=True)
    print get_dynos.content

heroku_get_dynos()
