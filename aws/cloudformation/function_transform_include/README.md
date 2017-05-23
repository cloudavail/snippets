# To Do / Cleanup

- the variable for bucket 

# Validate Stack

`aws cloudformation validate-template --template-body file://autoscaling_with_yaml_userdata.yaml`

# Upload a File to be Used in Included in a Templaste

## Create Bucket
account_id=$(aws sts get-caller-identity --output text --query 'Account')
aws s3api create-bucket --bucket ${account_id}-fn-transform-include-usw2 --create-bucket-configuration LocationConstraint=us-west-2 --region us-west-2

## Upload File

ubuntu_ami_file_s3_path="${account_id}-fn-transform-include-usw2/ubuntu_ami.yaml"

aws s3 cp ubuntu_ami.yaml s3://$ubuntu_ami_file_s3_path --region us-west-2

# Create FunctionTransformInclude Stack

`aws cloudformation deploy --stack-name FunctionTransformInclude --template-file autoscaling_with_yaml_userdata.yaml --parameter-overrides ubuntuAMISMapping3Location=s3://$ubuntu_ami_file_s3_path --region us-west-2`
