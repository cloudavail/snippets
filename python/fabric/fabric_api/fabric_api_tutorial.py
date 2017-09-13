#!/usr/bin/env python
# objective: utilize the fabric api and environment variables to run a command
# on remote hosts listed in env.hosts list

import argparse
import os

from fabric.api import env
from fabric.api import run
from fabric.tasks import execute

app_name = os.path.basename(__file__)

# accept and parse user provided options
parser = argparse.ArgumentParser()
parser.add_argument('--task', help='command to run on remote server.',
                    choices=['get_hostname','get_os'],
                    default='get_hostname')
args = parser.parse_args()
task = args.task

env.gateway = 'mygateway.mydomain.com'
# by default each task will be run all of the hosts in the env.hosts list
env.hosts = ['myhost01.mydomain.com','myhost02.mydomain.com']
env.key_filename = '/path/to/.ssh/private_key'
env.user = 'myusername'
# env.use_ssh_config would serve as an alternative to setting env.gateway,
# env.key_filename and env.user

# task definition: get_hostname
def get_hostname():
    # run executable hostname on remote host(s)
    print 'Calling run command: hostname'
    run('hostname')

# task definition: get_os
def get_os():
    # run executable uname on remote host(s)
    print 'Calling run command: uname'
    run('uname')

if task == 'get_hostname':
    execute(get_hostname)
elif task == 'get_os':
    execute(get_os)
