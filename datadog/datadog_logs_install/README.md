# Overview

This snippet will ship logs from a host running Ubuntu 18.04 LTS to DataDog.

# Running

You'll need to do the following to utilize this snippet:

```
export DD_API_KEY=${YOUR_DD_API_KEY}
vagrant up
```

# Confirming

The datadog agent will be launched and will ship logs from the file `/var/log/lastlog`. This is likely not the logfile you'd like to have shipped to Datadog, but the file is world-readable on Ubuntu (by default) so it represents an ideal log to ship (avoids permissions issues in datadog reading log files).