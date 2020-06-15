# Overview

This snippet demonstrates the default implementation of the dotenv node module where:

1. A `.dotenv` file is read.
2. If an environment variable is read, this would take precedence over a variable set in a file.

# Example Use

```
export BASEBALL_TEAM='Giants'
./dotenv.js
Value of Baseball Team: Warriors.
Value of Basketball Team: Giants.
```

In the above example, the value "BASEBALL_TEAM" is set in both the `.env` file (as "Dodgers") but set in the environment as "Giants". The output is, of course, "Giants" because the environment variable takes precedence.
