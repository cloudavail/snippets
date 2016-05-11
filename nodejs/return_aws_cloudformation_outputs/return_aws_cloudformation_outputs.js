var aws = require('aws-sdk');
aws.config.region = 'us-west-2';
var cfn = new aws.CloudFormation();
cfn.describeStacks({StackName: "core"}, function(err, data) {
    // output the entire "Stack" response
    console.log(data);
    // output only the Stack's Output
    console.log(data.Stacks[0].Outputs);
});
