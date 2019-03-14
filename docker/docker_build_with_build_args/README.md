# Overview

This document seeks to utilize the `--build-arg` when running on a host.

# Testing

1. `docker build .` - should return no value.
2. `docker build --build-arg BUILD_ARG="hello world" .` - should run and a line should read `The value of BUILD ARG is: hello world`.

