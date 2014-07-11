# Objective:

The files contained here will create an environment suitable for testing saltstack in a minion/master configuration. The Vagrantfile creates and configures the following:

1. A machine called "master" that runs the salt-master daemon
2. A machine called "minion" that runs the salt-minion daemon

# Getting Started

1. Build the salt_sandbox by running ```vagrant up``` - this will take between 15 (if you have to download an Ubuntu ISO) to 5 minutes
2. Login to the salt-master by running ```vagrant ssh master```
3. Execute salt 'highstate' on the minion by running ```salt '*' state.highstate```

# Additional Information
I found that the saltstack documents did not lend themselves to being followed in a linear fashion. Instead, I created a tutorial for myself by following documents in the following order:

## Instructions For Setting Up Environment:
###  Install Salt:
http://docs.saltstack.com/en/latest/topics/installation/index.html#platform-specific-installation-instructions
### Configure Salt:
http://docs.saltstack.com/en/latest/ref/configuration/index.html
### Add Minion
http://docs.saltstack.com/en/latest/ref/configuration/index.html
### Determine Where Salt Files are Stored
A default salt-master install does not create directories where salt state files will be stored. You will need to create this yourself. I didn't use the saltstack documentation for understanding how to configure saltstack, but rather a post by Ben Hosmer that I found on linuxjournal.
Reference:
http://www.linuxjournal.com/content/getting-started-salt-stack-other-configuration-management-system-built-python?page=0,2
### Create State Files:
http://docs.saltstack.com/en/latest/topics/tutorials/states_pt1.html#sls-file-namespace
