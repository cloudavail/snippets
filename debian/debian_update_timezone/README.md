# Overview

This document describes how to update the system timezone on a debian based Docker image.

# Notes

- The "default" timezone on a `debian:buster` image is `etc/UTC`.
- The supported method of updating the timezone on a Debian system (as of 2020-07-16) is described here: https://wiki.debian.org/TimeZoneChanges

# Updating Timezone File

The command below will update the `/etc/localtime` file. This file appears to control the linux system time.

## Update to Pacific Time

`ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`

and confirm proper update

`date` should return `Thu Jul 16 13:45:51 PDT 2020`.

and return to default timezone, if desired

`ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime`

# Updating Timezone File

The command below will update the `/etc/timezone` file. This file may be used by other executables.

`echo "Etc/UTC" > /etc/timezone`

And confirm proper update by running the following:

`cat /etc/timezone`

# Docker Build and Run

## Build the Given Docker Image

`docker build . --tag debian_timezone_set`

## Run the Given Docker Image

`docker run debian_timezone_set date`
