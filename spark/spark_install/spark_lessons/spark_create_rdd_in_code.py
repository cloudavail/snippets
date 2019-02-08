#!/usr/bin/env python
from pyspark import SparkConf, SparkContext

# https://spark.apache.org/docs/latest/rdd-programming-guide.html
# Typically you want 2-4 partitions for each CPU in your cluster. Normally, Spark tries to set the number of partitions automatically based on your cluster.
# spark will run one 

# There are two ways to create RDDs:
# - parallelizing an existing collection in your driver program
# - referencing a dataset in an external storage system, such as a shared filesystem, HDFS, HBase, or any data source offering a Hadoop InputFormat.

conf = SparkConf().setMaster("local").setAppName("MyApp")
sc = SparkContext(conf=conf)

print sc

data = [1, 2, 3, 4, 5]
print data.__class__

# and create an RDD
dist_data = sc.parallelize(data)

print dist_data.__class__
print dir(dist_data)

print "Sum of Dist Data: {}".format(dist_data.sum())
