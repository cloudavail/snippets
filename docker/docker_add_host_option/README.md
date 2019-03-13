# Overview

This document seeks to utilize the `--add-host` option to add an entry into a recently run Docker Container's `/etc/hosts` file.

# Test Container Run

1. Run an ubuntu container: `docker run ubuntu`
2. Run an ubuntu container with a command: `docker run ubuntu /bin/echo "Echo Hello World"`
3. Run an ubuntu container with a command: `docker run ubuntu /bin/cat "/etc/hosts"`

# Test with Add Hosts

1. Run an ubuntu container with a command and a modified hosts file: `docker run --add-host cloudavail.com:42.5.2.1 ubuntu /bin/cat "/etc/hosts"`
