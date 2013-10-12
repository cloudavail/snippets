#!/usr/bin/env python

# objective: read in the template in ./tutorial_templates and iterate through
# a dictionary, writing out key (city), value (founding date) pairs, example:
# The city {{city_name}} was founded in {{founding_date}}.
# The city San Francisco was founded in 1776.
# The city Los Angeles was founded in 1781.

# reference: http://jinja.pocoo.org/docs/api/
# reference: http://stackoverflow.com/questions/11857530/how-do-i-render-jinja2-output-to-a-file-in-python-instead-of-a-browser

from jinja2 import Environment
from jinja2 import FileSystemLoader

city_data = {}
city_data['San Francisco'] = {'Founded': 1776}
city_data['Los Angeles'] = {'Founded': 1781}

env = Environment(loader=FileSystemLoader('my_templates'))
city_template = env.get_template('city_info_template.txt')

for city_name in city_data:
    print city_template.render(city_name=city_name,city_founding_date=city_data[city_name]['Founded'])