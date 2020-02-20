#!/bin/bash -

# taken from
# https://www.percona.com/doc/percona-toolkit/LATEST/installation.html

wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
dpkg -i percona-release_latest.generic_all.deb
apt update
apt -y install percona-toolkit
