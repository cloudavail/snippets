# Overview
The purpose of the "vagrant salt developer instance" is to allow development of the saltstack infrastructure management software.

# Use of "Vagrant Salt Developer Instance"

1. Run ```vagrant up``` to create a vagrant instance that installs the salt source code from GitHub.
2. Login to the vagrant salt developer instance by executing ```vagrant ssh```
3. Run ```sudo su -``` to be become root user
4. Activate the salt virtualenv by running ```source /root/salt_venv/bin/activate```

# How it Works
1. Vagrant creates a virtualbox image
2. the shell provisioner script installs python virtualenv with salt prerequisites
3. The salt developer logs in, becomes root activates the virtualenv where salt has been installed

# Other Methods
1. Using a config.vm.synced_folder that syncs a local clone of the salt repository into your vagrant instance.
