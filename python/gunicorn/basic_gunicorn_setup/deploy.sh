#!/bin/bash

apt -y update
apt -y install gunicorn

# want to run the app?
# cd /vagrant
# gunicorn --bind=0.0.0.0:8000 --workers=1 app:app

# gunicorn --paste development.ini -b :8080 --chdir /path/to/project