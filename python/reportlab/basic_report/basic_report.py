#!/usr/bin/env python

# objective: print "Hello World" to a PDF

from reportlab.pdfgen import canvas  
from reportlab.lib.units import cm  

c = canvas.Canvas("hello.pdf")  
c.drawString(9*cm, 22*cm, "Hello World!")  
c.showPage()  
c.save()
