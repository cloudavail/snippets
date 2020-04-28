#!/usr/bin/env node

var aws = require('aws-sdk');
aws.config.region = 'us-west-2'

//call S3 to list the buckets
var s3 = new aws.S3();
s3.listBuckets(function(err, data) {
  if (err) {
    console.log('Error', err);
  } else {
    console.log('Success', data.Buckets);
  }
});
