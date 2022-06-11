# Overview

This snippet describes how to use Packer to build a Docker Image. The primary use case (for me) will be to test Ansible scripts.

# Commmands to Build a Docker Image

Run the commands below, in order, to build a Docker Image using Packer

- `packer init .`: will download the appropriate modules for performing a docker build
- `packer fmt .`: will format the HCL file appropriately
- `packer build docker-ubuntu.pkr.hcl `: will build an image

# Post Run

Run the command `docker images` to confirm an image has been created.
