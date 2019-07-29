# Overview

This snippet connects to and retreives data from the NewRelic API using the python newrelic API module available at https://github.com/ambitioninc/newrelic-api.

# Use

You'll need to export your NewRelic API key and then you'll need to run the python program.

```
export NEW_RELIC_API_KEY='<insert key here>'
./newrelic-api.py
```

# Result

The result should look akin to the following:

`{u'policies': [{u'updated_at': 1553809760444, u'incident_preference': u'PER_CONDITION_AND_TARGET', u'created_at': 1553809760444, u'id': 422985, u'name': u'Management Policy'}]}`