# Validate Stack
`aws cloudformation validate-template --template-body file://security_group_egress_testing.yaml`

# Create SecurityGroupEgressTesting Stack
`aws cloudformation create-stack --stack-name SecurityGroupEgressTesting --parameters ParameterKey=KeyName,ParameterValue=test --template-body file://security_group_egress_testing.yaml`

# Update A SecurityGroupEgressTesting Stack
`aws cloudformation update-stack --stack-name SecurityGroupEgressTesting --parameters ParameterKey=KeyName,ParameterValue=test --template-body file://security_group_egress_testing.yaml`


# Tests

## DNS Resolution inside of VPC 

## DNS Resolution outside of VPC

### DNS Resolution using "Local" DNS
1. Login to Server.
2. `dig www.google.com`

### DNS Resolution using "Remove" DNS
1. Login to Server.
2. `dig www.google.com @4.2.2.1`

## NTP Resolution
1. Login to Server.
2. `chronyc tracking`
3. `chronyc sources` - if the reach value is 0 there is a problem.

## HTTP/HTTPS Outbound Testing
### HTTP Outbound
1. Login to Server.
2. `curl www.google.com`
### HTTPS Outbound
1. Login to Server.
2. `curl https://www.google.com`

## Connectivity to AWS Resources

### Connectivity to RDS with no Egress Rule
This tests the ability to connect to an RDS instance that allows no initiated egress traffic.
