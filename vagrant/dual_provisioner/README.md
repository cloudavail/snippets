# Objective:

The purpose of this snippet is to create a "dual provisioner" - you might do this if:

- you have a "shared" provisioner, such as provisioner that runs in both Vagrant and AWS but needs to do something unique within Vagrant. My particular use case was Vagrant instances required local MySQL, whereas AWS instances would utilize RDS.

To accomplish this, you have a number of options:

1. Run a "pre-provisioner" that provisions Vagrant instances uniquely, or sets a value that is used by the subsequent provisioner.
2. Identify a setting that is unique to Vagrant and use that to control script function.
