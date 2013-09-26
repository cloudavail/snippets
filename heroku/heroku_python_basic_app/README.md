# Overview
heroku_python_basic_app will create a simple Python application.

# Requirements
1. git
2. heroku toolbelt

# Create a Python based Heroku Application
A ready built Python application with Heroku required files is in heroku_python_basic_app. The following files exist for execution of this application:

1. Procfile - a procfile informs Heroku which processes should be run and how to run them
  - https://devcenter.heroku.com/articles/procfile
  - https://devcenter.heroku.com/articles/process-model
2. requirements.txt - tells Heroku which Python modules must be installed to run an application
3. *.py File - this file will be executed by a given "Process" as defined in the Procfile

# Create a Heroku Application
Run the following:

    heroku apps:create

This will create a git remote named "origin" and a branch named "master."

You can also add a remote manually as follows:

    git remote add origin git@heroku.com:salty-cove-3188.git

You might prefer to add a remote with a more meaningful name:

    git remote add myapp-development git@heroku.com:salty-cove-3188.git

# Push Python based Application to Heroku

    git push origin master

Or if you created myapp-development

    git push myapp-development master

# Confirm Application is Running:


# Reference
Taken from https://devcenter.heroku.com/articles/getting-started-with-python.
