#!/usr/bin/env python

# objective: read an RML file and output as a PDF

from rlextra.rml2pdf import rml2pdf


with open ('template.rml', 'r') as rml_file:
    rml_string=rml_file.read()

rml2pdf.go(rml_string, './basic_report_using_rml.pdf')
