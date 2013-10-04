#!/bin/bash

# Objective: to utilize nested requirements documents to satisfy a build time
# dependency for numexpr. By running requirements_a1.txt and install numpy
# then numexpr would be able to build correctly
# Note: this did not succeed.

# create a temporary directory where the nested_requirements test can be run
temp_dir="/Temp/nested_requirements_test"

# create the master requirements file
cat > ${temp_dir}/requirements.txt <<EOF
-r ${temp_dir}/requirements_a1.txt
-r ${temp_dir}/requirements_a2.txt
EOF

# create the requirements_a1.txt requirements document
cat > ${temp_dir}/requirements_a1.txt <<EOF
numpy==1.7.1
EOF

# create the requirements_a2.txt requirements document
cat > ${temp_dir}/requirements_a2.txt <<EOF
numexpr==2.2.2
EOF

# create a virtualenv
virtualenv ${temp_dir}/test
# activate the virtualenv
source ${temp_dir}/test/bin/activate
# install requirements as contained in both requirements_a1.txt and
# requirements_a2.txt documents
pip install -r ${temp_dir}/requirements.txt