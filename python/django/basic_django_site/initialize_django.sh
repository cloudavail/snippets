#!/bin/bash -

apt -y install python-pip
# will install django-1.10.6, at present
pip install django

# django-admin startproject mysite

# cd /vagrant/mysite/
# ./manage.py migrate

./manage.py runserver 0.0.0.0:8000
