# packer: contains Packer settings
packer {
  # required_plugins: specifies the plugins required to build my image
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

# source: configures a specific
source "docker" "apache" {
  image  = "ubuntu:latest"
  commit = true
}

build {
  name = "docker-apache"
  sources = [
    "source.docker.apache"
  ]
  provisioner "shell" {
    inline = [
      "#!/bin/bash -e",
      "apt update",
      "apt install -y python3 python3-pip",
      "pip3 install ansible"
    ]
  }
  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
  }
}
