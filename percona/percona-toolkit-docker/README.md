# Overview

This snippet will cover how to run the percona-toolkit in Docker. This could serve as a platform for either a one-off run of a Percona Toolkit tool or the use of Percona Toolkit in a "container orchestration" system.

# Running Percona Toolkit Tools from Shell

To run the Percona Toolkit tools from a shell, do the following:

- Pull the Percona Toolkit Container: `docker pull perconalab/percona-toolkit:latest`
- Run the Percona Toolkit Container: `docker run -it perconalab/percona-toolkit /bin/bash`
- Switch to the directory containing the Percona Tools: `cd /usr/bin`
- Run any of the Percona Tools, example: `pt-summary`

# Running Percona Toolkit

`pt-deadlock-logger --host --user `
