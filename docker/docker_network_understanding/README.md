# Overview:

Objective of this series of snippest is to create three different types of Docker supported networks and also demonstrate these networks . These networks are described below:

1. No network.
2. An "EXPOSE" network. This makes available a docker container to other containers.
3. An "EXPOSE" network run with a `docker run --publish` option.

# No Network:
Created by a Dockerfile that contains no `EXPOSE` instruction and by executing `docker run` without the `--publish` option.

## No Network Results In:
    root@docker:~/build_no_expose# docker ps
    CONTAINER ID        IMAGE                               COMMAND                CREATED             STATUS              PORTS               NAMES
    df3ce121a64b        cloudavail/build_no_expose:latest   /usr/sbin/apache2ctl   3 seconds ago       Up 3 seconds                            build_no_expose     


# Docker Expose:
Created by a Dockerfile that contains an `EXPOSE` instruction and by executing `docker run` without the `--publish` option.

## Docker Expose Results In:

    root@docker:~/build_expose# docker ps
    CONTAINER ID        IMAGE                            COMMAND                CREATED             STATUS              PORTS               NAMES
    19541a5a247a        cloudavail/build_expose:latest   /usr/sbin/apache2ctl   5 seconds ago       Up 4 seconds        80/tcp              buildxpose        

    root@docker:~/build_expose# curl localhost:80
    curl: (7) Failed to connect to localhost port 80: Connection refused

    root@docker:~/build_expose# lsof -i -P | grep 80
    root@docker:~/build_expose# 

# Docker Expose and Publish:
Created by a Dockerfile that contains an `EXPOSE` instruction and by executing `docker run` with the `--publish` option.

## Docker Expose and Publish Results In:

    root@docker:~# docker ps
    CONTAINER ID        IMAGE                                    COMMAND                CREATED             STATUS              PORTS                NAMES
    fd535b208922        cloudavail/build_expose_publish:latest   /usr/sbin/apache2ctl   14 seconds ago      Up 14 seconds       0.0.0.0:80->80/tcp   build_expose_publish   

    root@docker:~# curl localhost:80
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <!--

    root@docker:~# lsof -i -P | grep 80
    docker.io 4857    root   11u  IPv6  30277      0t0  TCP *:80 (LISTEN)
