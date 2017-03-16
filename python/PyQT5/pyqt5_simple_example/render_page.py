#!/usr/bin/env python3

import sys

from PyQt5.QtWidgets import QApplication 
from PyQt5.QtWebKitWidgets import QWebView
from PyQt5.QtPrintSupport import QPrinter
from PyQt5.QtCore import QUrl

app = QApplication(sys.argv)

web = QWebView()
web.load(QUrl("https://en.wikipedia.org/wiki/The_Temptations"))
printer = QPrinter()
printer.setPageSize(QPrinter.Letter)
printer.setOutputFormat(QPrinter.PdfFormat)
printer.setOutputFileName("out.pdf")

def convertIt():
    web.print_(printer)
    print ("PDF Created")
    QApplication.exit()

web.loadFinished.connect(convertIt)

app.exec_()
