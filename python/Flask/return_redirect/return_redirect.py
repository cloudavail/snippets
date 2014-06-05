#!/usr/bin/env python

# run: python return_redirect.py
# result: python will return "* Running on http://127.0.0.1:5000/"
# in a browser, go to http://127.0.0.1:5000/
# you will be redirected to http://www.google.com


from flask import Flask, redirect
app = Flask(__name__)


@app.route('/')
def home():
    return redirect('http://www.google.com', code=302)


if __name__ == '__main__':
    app.run()
