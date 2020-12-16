#!/bin/bash

yarn audit
# the value of exit_code is equal to the sum of the level of 
exit_code=$?
echo $exit_code
# exit codes can be found here: https://classic.yarnpkg.com/en/docs/cli/audit/
if [[ $exit_code -gt 8 ]]; then
  echo 'An vulnerability with a level greater than HIGH has been found'
fi
