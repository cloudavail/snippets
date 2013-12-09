#!/usr/bin/env python

import logging
import sys
import yaml

# global configuration options
yaml_file_path = './cities.yaml'
logging.basicConfig(level=logging.INFO, format='%(message)s')

try:
    yaml_file_handle = open(yaml_file_path)
    cities = yaml.load(yaml_file_handle)
    logging.info('Loading cities yaml file: {!s}'.format(yaml_file_handle.name))
except IOError:
    sys.exit(1)

for city in cities:
    population_density = cities[city]['population'] / cities[city]['size_square_miles']
    print 'city name: {!s} has a population density of {!s} persons per sq/mile.'.format(city, population_density)

