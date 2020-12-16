# Overview

This document describes how to use the pt-query-digest tool.

# Running within Docker

`docker run --volume $(pwd)":/var/tmp perconalab/percona-toolkit /usr/bin/pt-query-digest --type genlog /var/tmp/mysql-general.log`
