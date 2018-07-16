#!/bin/bash

cat > /var/tmp/variables.txt <<EOF
# aws_region = should be resolved by terraform prior to execution
aws_region=${aws_region}
EOF

