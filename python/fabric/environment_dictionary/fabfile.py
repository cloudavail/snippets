# objective: set and use environment variables to connect to a host

from fabric.api import env
from fabric.api import run

print ('env is a {env_class!s} class of object.'.format (env_class=env.__class__))
print ('env contains the following methods:\n{env_methods!s}.'.format (env_methods=dir(env)))
print ('env contains the following keys:\n{env_keys!s}.'.format (env_keys=env.keys()))

env.gateway = 'mygateway.mydomain.com'
env.hosts = ['myhost.mydomain.com']
env.key_filename = '/path/to/.ssh/private_key'
env.user = 'myusername'
# env.use_ssh_config is a good alternative

# example command: fab get_hostname
def get_hostname():
    # run command hostname run on remote host
    print 'Calling run command: hostname'
    run('hostname')
