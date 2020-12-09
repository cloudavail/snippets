# To test Log Router is up and listening

## Steps
- Run a docker container with 'fluent-cat'
`docker run -it fluent/fluentd /bin/sh`

- Run command in docker container
`echo '{"message":"testing the SSL forwarding"}' | fluent-cat -h Farga-LogRo-1JVNOS8FCVQOI-cc7d05b1f935578d.elb.us-west-2.amazonaws.com my_tag`
where -h is the DNS Name of the Load Balancer

- Check CloudWatch logs with log group name "log-router"