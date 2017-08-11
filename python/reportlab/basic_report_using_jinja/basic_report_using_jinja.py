#!/usr/bin/env python

# objective: read an RML file and output as a PDF

import datetime

from jinja2 import Environment, FileSystemLoader
from rlextra.rml2pdf import rml2pdf


jinja_env = Environment(loader=FileSystemLoader('./'))

date_today = datetime.date.today()
report_date = date_today.isoformat()

data = { 'report_author': 'Colin Johnson', 'report_date': report_date }

jinja_template = jinja_env.get_template('template.j2')
rml_template = jinja_template.render(**data)
rml_template = rml_template.encode('utf16')
rml2pdf.go(rml_template, './basic_report_using_rml.pdf')
