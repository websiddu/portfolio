#!/usr/bin/python

import urllib2
import sys
import json

file = sys.argv[1]
file_content = open(file, 'r')

BASE_URL = "http://api.websiddu.com/projects/"
#BASE_URL = "http://localhost:3000/projects/"

EMAIL = "siddu.siddhartha@gmail.com"
TOEKN = open('.token', 'r').readline().strip()

id = file_content.readline()
content = file_content.read()

content.replace(id, '')

url = BASE_URL + id.strip() + '.json'

data = '{"description": '+ json.dumps(content) +'}'


opener = urllib2.build_opener(urllib2.HTTPHandler)
request = urllib2.Request(url, data=data)
request.add_header('Content-Type', 'application/json')
request.add_header('X-User-Email', EMAIL)
request.add_header('X-User-Token', TOEKN)

request.get_method = lambda: 'PUT'
url = opener.open(request)
