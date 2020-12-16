#!/usr/bin/env node

// Load the SDK for JavaScript
var AWS = require('aws-sdk');
// Set the Region 
AWS.config.update({region: 'us-west-2'});

// Create empty request parameters
var params = {
  MaxResults: 0,
};

// Create a promise on a MediaConvert object
var endpointPromise = new AWS.MediaConvert({apiVersion: '2017-08-29'}).describeEndpoints(params).promise();


endpointPromise.then(
  function(data) {
    console.log("Your MediaConvert endpoint is ", data.Endpoints);
  },
  function(err) {
    console.log("Error", err);
  }
);