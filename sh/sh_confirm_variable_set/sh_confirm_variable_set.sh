#!/bin/sh

for ENVIRONMENT_VARIABLE in CAT DOG; do
  eval EVALUATED_VARIABLE=\$$ENVIRONMENT_VARIABLE
  if [[ -z $EVALUATED_VARIABLE ]]; then
    echo "The environment variable $ENVIRONMENT_VARIABLE must be set." ; exit 1 ;
  else
    echo "The environment variable $ENVIRONMENT_VARIABLE is $EVALUATED_VARIABLE"
  fi
done
