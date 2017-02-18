#!/usr/bin/env python

import json
import os

from flask import Flask
from flask import Response

app = Flask(__name__)

# available at http://127.0.0.1:5000/api/team_table
@app.route("/api/team_table")
def api_hello_world():
    team_table = [
      {
        "name": "Juventus",
        "wins": 21,
        "draws": 0,
        "losses": 4
      },
      {
        "name": "Roma",
        "wins": 17,
        "draws": 2,
        "losses": 5
      },
      {
        "name": "Napoli",
        "wins": 15,
        "draws": 6,
        "losses": 3
      }
    ]
    data = {'data': team_table}
    resp = Response(json.dumps(data))
    return resp

# available at http://127.0.0.1:5000/
# returns file from static/ directory
@app.route("/")
def root():
    return app.send_static_file('index.html')

app.run()
