FROM python:latest

# RUN apt update && apt -y install celery
# did not work and instead resulted in the error
# pkg_resources.DistributionNotFound: The 'celery' distribution was not found and is required by the application

RUN pip install celery
# without installing redis the following error occurs
# AttributeError: 'NoneType' object has no attribute 'Redis'
# when celery is run as a "worker"
RUN pip install redis
