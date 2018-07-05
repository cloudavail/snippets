# Objective:

The objective of this snippet is to utilize nginx as a proxy.

# Test

- `curl --verbose 'http://127.0.0.1:8080/projects/'` - should return content of https://cloudavail.com/projects/
- `curl --verbose 'http://127.0.0.1:8080/blog/'` - should return content of https://cloudavail.com/blog/