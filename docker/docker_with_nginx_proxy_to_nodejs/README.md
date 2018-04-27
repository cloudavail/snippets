# Overall

I don't believe this to be a good solution to running nginx/nodejs (or any two daemon processes) within a Docker container - the reason I don't like this is:

1. Log conflation from both nginx and nodejs. I am certain that this could be addressed but Docker's default behavior is to expose logs via stdout/stderr within a container which would require some customization or a "prefix" (either nginx/nodejs) from the log source.

2. Service and process monitoring.

3. Hack to launch both services. As Docker doesn't provide native support for this, the use of an entrypoint script (and a while loop or daemon process) is required to keep the container running.  

In other words the snippet is checked into the repository because it does include one method of proxying nodejs applications with nginx.

# Docker Commands

The commands below will build and run an image.

`docker build . -t nginx_with_nodejs:latest` 

`docker run -d -p 8080:80 -p 3000:3000 nginx_with_nodejs:latest`

For troubleshooting via bash.

`docker run -it nginx_with_nodejs:latest /bin/bash`


# Nginx + Nodejs are now running!

For testing content served via nginx.

`curl localhost:8080`

For testing content as served via nodejs and express.

`curl localhost:300`

# Other

## npm Primer

Create initial project: `npm init -y`
Install required package and create package.json file: `npm install --only=production express`
