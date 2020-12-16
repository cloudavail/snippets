# Overview

This snippet demonstrates my own development in learning how to run nodejs in a synchronous (ordered) and asynchronous manner.

# Definitions

- synchronous
  - happening at the same time, simultaneous
  - having "fixed time" controlled by a clock
- asynchronous
  - not occuring at the same time
  - operating without having "fixed time" intervals

Node, by default, uses the "clock" definition of synchronous and asynchronous.

# Test Script

I created a script called `./node_with_sleep_statements.js`. When run, this is the output:

```
colinjohnson@cjohnson07 node_asynchronous_options % ./node_with_sleep_statements.js
Called after 1 second
Called after 5 seconds
Called after 10 seconds
```

If I can reorder these statements, so that the 10 second log line runs first, a subsequent log line is written 5 seconds later (15 seconds after execution start) and the last log line is written 1 second later (16 seconds after execution start) then I've accomplished an ordered/synchronous execution of a script written in node.

# with Callbacks



