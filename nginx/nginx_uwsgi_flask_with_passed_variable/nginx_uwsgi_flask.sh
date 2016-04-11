#!/bin/bash
# quick note:
# would consider moving to pip install and virtualenv if needed
apt-get -y install python-flask
apt-get -y install uwsgi
# required to serve python files
# without this plugin, you'l see errors such as:
# uwsgi: unrecognized option '--wsgi-file'
# uwsgi: unrecognized option '--module'
apt-get -y install uwsgi-plugin-python
apt-get -y install nginx

# configure nginx to send requests to uwsgi application server
rm /etc/nginx/sites-enabled/default
ln -s /vagrant/nginx_uwsgi_config /etc/nginx/sites-available/nginx_uwsgi_config
ln -s /etc/nginx/sites-available/nginx_uwsgi_config /etc/nginx/sites-enabled/nginx_uwsgi_config

# configure uwsgi to send requests to flask.app.py file 
ln -s /vagrant/uwsgi_config.ini /etc/uwsgi/apps-available/uwsgi_config.ini
ln -s /etc/uwsgi/apps-available/uwsgi_config.ini /etc/uwsgi/apps-enabled/uwsgi_config.ini

systemctl restart nginx.service
systemctl restart uwsgi.service
