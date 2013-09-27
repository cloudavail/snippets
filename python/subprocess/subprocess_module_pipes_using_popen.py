#!/usr/bin/env python

# objective: to return stderr, stdout results from a subprocess
# to their correct variables and return these from python as stdout and stderr

# reference: http://sharats.me/the-ever-useful-and-neat-subprocess-module.html
# reference: http://docs.python.org/2/library/subprocess.html#subprocess.Popen

import subprocess
import sys

print ''
print 'Call of subprocess without subprocess.PIPE object.'
# the output of this command with be the output of ls -l
list_dir = subprocess.Popen(['ls','-l'])
list_dir.wait()
print ''

print 'Call of subprocess with subprocess.PIPE object and ls -l.'
# the output of the command below will be the output of ls -l - ls -l runs correctly
list_dir = subprocess.Popen(['ls','-l'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
# list_dir.wait() will wait for the result of the command above
list_dir.wait()
list_dir_stdout, list_dir_stderr = list_dir.communicate()
sys.stdout.write('stdout from ls -l: \n' + list_dir_stdout + '\n')
sys.stderr.write('stderr from ls -l: \n' + list_dir_stderr + '\n')

print 'Call of subprocess with subprocess.PIPE object and ls -y.'
# the output of the command below will be the output of ls -y - ls -y writes to stderr
list_dir = subprocess.Popen(['ls','-y'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
# list_dir.wait() will wait for the result of the command above
list_dir.wait()
list_dir_stdout, list_dir_stderr = list_dir.communicate()
sys.stdout.write('stdout from ls -y: \n' + list_dir_stdout + '\n')
sys.stderr.write('stderr from ls -y: \n' + list_dir_stderr + '\n')