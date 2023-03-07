FROM python:latest

RUN pip install celery
# without installing redis the following error occurs
# AttributeError: 'NoneType' object has no attribute 'Redis'
# when celery is run as a "worker"
RUN pip install redis

RUN pip install flower
# without installing redis the following error occurs
# AttributeError: 'NoneType' object has no attribute 'Redis'
# when celery is run as a "worker"
# RUN pip install redis
