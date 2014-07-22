# Overview
The purpose of the "vagrant salt local development" is to allow development of the saltstack infrastructure management software.

# Use of "Vagrant Salt Local Development"

1. Perform a ```git clone``` of the salt infrastructure management software into the root of the "vagrant salt local development" directory.
2. Run ```vagrant up``` to create a vagrant instance.
3. Login to the vagrant salt developer instance by executing ```vagrant ssh```

# How it Works
1. Vagrant creates a virtualbox image
2. the shell provisioner script installs python virtualenv with salt prerequisites
3. The salt developer logs in, becomes root activates the virtualenv where salt has been installed

# Other Methods
1. Using a config.vm.synced_folder that syncs a local clone of the salt repository into your vagrant instance.
