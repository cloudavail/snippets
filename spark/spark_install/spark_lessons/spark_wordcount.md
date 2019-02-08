# Start Spark

`./bin/pyspark`

# Perform Ad-Hoc Query

```
lines = sc.textFile("README.md")
python_lines = lines.filter(lambda line: "Python" in line)
python_lines.first()
```

# Understand

- the "filter" function can be parallelized across a cluster.