#!/bin/bash -

environment="dev"

if [[ $environment == "qa" || $environment == "production" ]]; then
  echo "If statement triggered."
else
  echo "If statement not triggered."
fi
