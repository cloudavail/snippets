#!/usr/bin/env python3

import requests

circleci_docker_images_response = requests.get('https://circleci.com/docs/2.0/docker-image-tags.json')
circleci_docker_images = circleci_docker_images_response.json()

# to print the images available via CircleCI, modify the section below
print(circleci_docker_images['node']['tags'])
