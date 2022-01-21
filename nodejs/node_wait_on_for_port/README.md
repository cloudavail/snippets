# Overview

This document describes how to use the "wait-on" command-line utility.

# Usage

This snippet is designed to be run as follows:

1. Run an `npm install` to install the "wait-on" node module.
2. Run `npx wait-on` to run the "wait-on" node module

## How to wait-on a TCP Port (an Arbitrary Port)

In the example below we wait on an arbitrary port to be "listening" on a given system. We use the `nc` command to accomplish this:

- Establish the "wait on" process using `npx wait-on tcp:8080` - this should start the "wait"
- Establish the "listener" port (this will close the wait-on process) using `nc -l 8080`

## How to wait-on a TCP Port (an Arbitrary Port) with a Timeout

We extend the previous example by adding a timeout of 10 seconds.

- Establish the "wait on" process using `npx wait-on --timeout 10 tcp:8080` - this should start the "wait"
- Establish the "listener" port (this will close the wait-on process) using `nc -l 8080`
