#!/usr/bin/env python

# to run you'll need to set credentials:
# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=

from pyspark import SparkConf, SparkContext

# still throws error
# java.io.FileNotFoundException: Jar /var/tmp/spark-2.4.0-bin-hadoop2.7/jars/*.jar not found
# but JAR files will be used from this path
# - there are almost certainly other methods for loading JAR files
# - this is almost certainly not the best method for loading JAR files
conf = SparkConf().setMaster("local").setAppName("MyApp").set("spark.jars",'/var/tmp/spark-2.4.0-bin-hadoop2.7/jars/*.jar')

sc = SparkContext(conf=conf)
print dir(sc)

print dir(conf)

file_from_s3 = sc.textFile("s3a://gdelt-open-data/v2/events/20181102220000.export.csv")
print dir(file_from_s3)
print file_from_s3.count()
