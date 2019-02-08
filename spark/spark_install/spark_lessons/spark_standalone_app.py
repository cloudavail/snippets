#!/usr/bin/env python
from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("MyApp")
sc = SparkContext(conf=conf)

lines = sc.textFile("/var/tmp/spark-2.4.0-bin-hadoop2.7/README.md")
python_lines = lines.filter(lambda line: "Python" in line)
first_line = python_lines.first()
print 'Below is Output from Standalone App'
print 'First Line in README.md is: {}'.format(first_line)
