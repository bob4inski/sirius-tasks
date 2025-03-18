#!/usr/bin/python
# -*- coding: utf-8 -*-
import requests
from flask import Flask

app = Flask(__name__)

@app.route("/hello")
def hello_world():
    resp = requests.get('https://api.thecatapi.com/v1/images/search')
    cat_json = resp.json()
    
    if cat_json:
        return cat_json[0].get('url', '')
    else:
        return ''

if __name__ == '__main__':
    app.run(debug=True)

# Oh, hello there