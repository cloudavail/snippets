# Overview

This snippet is designed to use a CloudFormation parameter to name an "export".

# Validate the Template

`aws cloudformation validate-template --template-body file://variable_export_name.yml`

# Create the Stack

`aws cloudformation create-stack --stack-name VariableExportName --parameters ParameterKey=NameOfExport,ParameterValue=NameOfBucket --template-body file://variable_export_name.yml`