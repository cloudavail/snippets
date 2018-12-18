#!/bin/bash

# Note that this script does not use the official install procedure from
# https://docs.gitlab.com/runner/install/linux-manually.html

echo "GitLab Runner Registration Token: $GITLAB_RUNNER_REGISTRATION_TOKEN"

apt -y install gitlab-runner

# gitlab-runner settings are available at: https://gitlab.com/$organization_name/$repository_name/settings/ci_cd
# example: https://gitlab.com/colinbjohnson/terraform-ci/settings/ci_cd
# note that --executor shell is required in order to avoid the error
# PANIC: Invalid executor specified - er
gitlab-runner register --non-interactive --name gitlabrunner-test --url https://gitlab.com --registration-token $GITLAB_RUNNER_REGISTRATION_TOKEN 
