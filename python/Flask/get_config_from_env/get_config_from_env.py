#!/usr/bin/env python


from flask import Flask

app = Flask(__name__)

# from_envvar - load a configuration file at the path specified by the value of
# a given variable. In this case, load from
# CONFIG_PATH='./path/to/configuration_file_name.cfg'
# "silent=False" forces the application to exit if no configuration file exists
# I have a preference for "failing" an application load if configuration
# data is not available - in some instances, such as reading from a database
# outright application failure is preferable to using the /wrong/ configuration
app.config.from_envvar('CONFIG_PATH', silent=False)

print app.config


@app.route('/')
def home():
    pass

if __name__ == '__main__':
    app.run()
