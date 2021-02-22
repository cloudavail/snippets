# Overview
Here's a Makefile with 'withenv' in your PATH.

## To test
`EXTRA_ENVFILES='.env.dev' withenv make deploy-dev`
- output: dev

`EXTRA_ENVFILES='.env.prod' withenv make deploy-prod`
- output: prod
