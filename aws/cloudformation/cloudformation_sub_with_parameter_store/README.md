# Overview

This snippet tests what happens when you change a value in an 


`aws cloudformation validate-template --template-body file://cloudformation_sub_with_parameter_store.yaml`


# Create Stack

```shell
aws cloudformation create-stack --stack-name sub-with-parameter-store --template-body file://cloudformation_sub_with_parameter_store.yaml
```

# Update Stack

```shell
aws cloudformation update-stack --stack-name sub-with-parameter-store --template-body file://cloudformation_sub_with_parameter_store.yaml
```


# Outcome

This snippet has proves that a condition can be added to an existing resource.
