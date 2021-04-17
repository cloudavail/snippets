# Run Docker

- This will start a fluentbit container: `docker run -p 24224:24224 fluent/fluent-bit:latest /fluent-bit/bin/fluent-bit -i forward -o stdout -p format=json_lines -f 1`
- This will start a fluentbit container using the file `./conf/fluent-bit.conf`: `docker run -p 24224:24224 --volume "$(pwd)/conf/fluent-bit.conf:/fluent-bit/etc/fluent-bit.conf" fluent/fluent-bit:latest`


# Adding Credentials

Credentials when running locally are not accepted via parameters. You can either 

```
[2021/04/16 23:52:26] [debug] [aws_credentials] Sync called on the EC2 provider
[2021/04/16 23:52:26] [debug] [aws_credentials] Init called on the env provider
[2021/04/16 23:52:26] [debug] [aws_credentials] Init called on the profile provider
[2021/04/16 23:52:26] [debug] [aws_credentials] Reading shared credentials file..
[2021/04/16 23:52:26] [debug] [aws_credentials] Could not read shared credentials file /root/.aws/credentials
[2021/04/16 23:52:26] [debug] [aws_credentials] Init called on the EC2 IMDS provider
[2021/04/16 23:52:26] [debug] [aws_credentials] requesting credentials from EC2 IMDS
```

# Running with Credentials

`docker run -p 24224:24224 --env-file ./fluentbit.env --volume "$(pwd)/conf/fluent-bit.conf:/fluent-bit/etc/fluent-bit.conf" fluent/fluent-bit:latest`
