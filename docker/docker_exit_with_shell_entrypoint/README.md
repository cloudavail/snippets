# Overview

# Build and Run a Standard NGINX

Build a standard nginx image.

`docker build nginx/ --tag cloudavail/standard-nginx`
`docker run --name standard-nginx --detach --publish 8080:80 cloudavail/standard-nginx`

This should result in a container that:

1. Forwards from port 8080 to 80: try it by `curl localhost:8080`
2. Has `nginx` as PID 1: confirm this by running `docker exec standard-nginx ps aux`

## Confirm Exit

`docker stop standard-nginx`
`docker ps --all | grep standard-nginx`

Should return `Exited (0) 6 seconds ago` or some time ago.

# Build and Run a Wrapped NGINX

`docker build nginx_shell_wrapper/ --tag cloudavail/nginx-shell-wrapper`
`docker run --name nginx-shell-wrapper --detach --publish 8080:80 cloudavail/nginx-shell-wrapper`

This should result in a container that:

1. Forwards from port 8080 to 80: try it by `curl localhost:8080`
2. Has `/bin/sh -c /entrypoint.sh` as PID 1: confirm this by running `docker exec nginx-shell-wrapper ps aux`

## Confirm Exit

`docker stop nginx_shell_wrapper`
`docker ps --all | grep nginx_shell_wrapper`

# Build and Run a Wrapped NGINX that accepts SIGTERM

`docker build nginx_shell_wrapper_exec_mode/ --tag cloudavail/nginx-shell-wrapper-exec-mode`
`docker run --name nginx-shell-wrapper-exec-mode --detach --publish 8080:80 cloudavail/nginx-shell-wrapper-exec-mode`

This should result in a container that:

1. Forwards from port 8080 to 80: try it by `curl localhost:8080`
2. Has `bin/bash /entrypoint.sh` as PID 1: confirm this by running `docker exec nginx-shell-wrapper-exec-mode ps aux`

## Confirm Exit

`docker stop nginx-shell-wrapper-exec-mode`
`docker ps --all | grep nginx-shell-wrapper-exec-mode`

This results in an exit code 137.

# Build and Run a Wrapped NGINX that Elevates nginx Process

`docker build nginx_shell_wrapper_exec_bash/ --tag cloudavail/nginx-shell-wrapper-exec-bash`
`docker run --name nginx-shell-wrapper-exec-bash --detach --publish 8080:80 cloudavail/nginx-shell-wrapper-exec-bash`

This should result in a container that:

1. Forwards from port 8080 to 80: try it by `curl localhost:8080`
2. Has `nginx: master process nginx -g daemon off;` as PID 1: confirm this by running `docker exec nginx-shell-wrapper-exec-bash ps aux`
3. Note that `docker ps` still shows `/entrypoint.sh` as `COMMAND` executed on container start. Kind of alarming.

## Confirm Exit

`docker stop nginx-shell-wrapper-exec-bash`
`docker ps --all | grep nginx-shell-wrapper-exec-bash`

This results in an exit code 137.

# Reference

- https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers/