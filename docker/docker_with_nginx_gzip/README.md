# Docker
`docker build . -t nginx_with_gzip:latest` 

`docker run -d -p 8080:80 nginx_with_gzip:latest`

# Nginx Is now running!

Navigate to `localhost:8080` in your browser or run:

`curl localhost:8080`