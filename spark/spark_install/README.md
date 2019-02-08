# Import File from S3

## Setup Pyspark

```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
# will load packages
pyspark --packages org.apache.hadoop:hadoop-aws:3.2.0
```


## Run Pyspark Commands

```
text_file = spark.read.text("s3a://irs-form-990/201025393493005020_public.xml")

```