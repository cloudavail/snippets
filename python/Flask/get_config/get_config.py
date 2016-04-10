#!/usr/bin/env python


from flask import Flask

app = Flask(__name__)

# setting configuration variable within application code
# I'd typically call this "hard-coding" a variable
app.config['DEBUG'] = True
# calling the configuration files a ".cfg" isn't quite correct
# the files appear to simply be loaded as python files
# example: I added the line 
# print 'development.cfg file called' in the development.cfg and
# when executed the app itself wrote this line
app.config.from_pyfile('./config/development.cfg')

print app.config


@app.route('/')
def home():
    pass

if __name__ == '__main__':
    app.run()
