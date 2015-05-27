#!/usr/bin/python

import urllib2
import sys
import json
import shutil
import os

BASE_URL = "http://api.websiddu.com/api/projects/"
PROJECTS_URL = "http://api.websiddu.com/api/projects?callback="
PROJECTS_FILE = "app/data/projects.json"

projects_file = open(PROJECTS_FILE, 'w')

def getProject(id):
  if not id:
    return;
  url = BASE_URL + id + "?callback="
  opener = urllib2.build_opener(urllib2.HTTPHandler)
  request = urllib2.Request(url)
  request.get_method = lambda: 'GET'
  data = opener.open(request)
  print "writing to " + 'app/data/projects/' + id + '.json' + "\n"
  project_file = open('app/data/projects/' + id + '.json', 'w')
  project_file.write(data.read())


def getProjects():
  opener = urllib2.build_opener(urllib2.HTTPHandler)
  request = urllib2.Request(PROJECTS_URL)
  request.get_method = lambda: 'GET'
  data = opener.open(request)
  projects = json.load(data)
  projects_file.write(json.dumps(projects))

  if not os.path.exists('app/data/projects/'):
    os.makedirs('app/data/projects/')
  else:
    os.system("rm -rf app/data/projects/")

  if not os.path.exists('app/data/projects/'):
    os.makedirs('app/data/projects/')

  for prj in projects:
    print "Getting data for " + prj['title'] + " and "
    getProject(prj['id']['$oid'])

getProjects()

