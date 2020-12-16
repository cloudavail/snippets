#!/usr/bin/env node

var AWS = require('aws-sdk');
// Set the Region 
AWS.config.update({region: 'us-west-2'});
// Set the custom endpoint for your account
AWS.config.mediaconvert = {endpoint : 'https://xxxxxxxxx.mediaconvert.us-east-1.amazonaws.com'};

var params = {
  "Queue": "arn:aws:mediaconvert:us-west-2:xxxxxxxxxxxx:queues/Default",
  "JobTemplate": "MediaConvertJobTemplate",
  "Role": "arn:aws:iam::xxxxxxxxxxxx:role/AWSRoleForMediaConvert",
  "Settings": {
    "OutputGroups": [
      {
        "Name": "File Group",
        "Outputs": [
          {
            "Preset": "MediaConvertPreset"
          }
        ],
        "OutputGroupSettings": {
          "Type": "FILE_GROUP_SETTINGS",
          "FileGroupSettings": {
            "Destination": "s3://x/"
          }
        }
      }
    ],
    "Inputs": [
      {
        "FileInput": "s3://x/x.mp4"
      }
    ]
  }
};

// Create a promise on a MediaConvert object
var templateJobPromise = new AWS.MediaConvert({apiVersion: '2017-08-29'}).createJob(params).promise();

// Handle promise's fulfilled/rejected status
templateJobPromise.then(
  function(data) {
    console.log("Success! ", data);
  },
  function(err) {
    console.log("Error", err);
  }
);
