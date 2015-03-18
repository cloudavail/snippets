# Objective:
The objective of this project is to rewrite all requests to a given URL.

# Create an nginx Redirector:
1. Create a vagrant machine by running ```vagrant up --provider virtualbox``` or whichever provider you use

# Test the nginx Redirector:
Although any request that nginx serves will be redirected to a given URL (cloudavail.com) in the example, both of the examples below provide the basic requirements for further testing:
```curl --verbose --header 'Host: google.com' 'http://127.0.0.1:8080'```
```curl --verbose --header --location 'Host: google.com' 'http://127.0.0.1:8080'```