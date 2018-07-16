# Overview

This snippet is intended to utilize a template that utilizes a variable from terraform to create a file. An example use case would be the creation of a user-data script that includes variables from terraform.

# Running:

Run `terraform apply`

# Expected Outcome

Expected outcome is similar to the below:

```
cjohnson06:terraform_template cjohnson$ terraform apply
data.template_file.example: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

rendered = #!/bin/bash

cat > /var/tmp/variables.txt <<EOF
# aws_region = should be resolved by terraform prior to execution
aws_region=us-west-2
EOF
```
