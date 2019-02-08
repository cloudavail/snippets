#!/usr/bin/env python
from pyspark import SparkConf, SparkContext

# Spark Options:
# https://spark.apache.org/docs/1.6.1/api/java/org/apache/spark/SparkConf.html
conf = SparkConf().setMaster("local").setAppName("MyApp")
sc = SparkContext(conf=conf)

print conf.getAll()
