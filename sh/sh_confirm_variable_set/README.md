# Overview

This snippet attempts to setup a snippet that will ensure a given set of environment variable is set. The particular use case was to make sure all environment variables were set for a script run within busybox's shell (sh) environment.

# Test

```
export CAT='grump'
export DOG='buck'
./sh_confirm_variable_set.sh
```
