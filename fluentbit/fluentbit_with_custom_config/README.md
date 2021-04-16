# Run Docker

- This will start a fluentbit container: `docker run -p 24224:24224 fluent/fluent-bit:latest /fluent-bit/bin/fluent-bit -i forward -o stdout -p format=json_lines -f 1`
- This will start a fluentbit container using the file `./conf/fluent-bit.conf`: `docker run -p 24224:24224 --volume "$(pwd)/conf/fluent-bit.conf:/fluent-bit/etc/fluent-bit.conf" fluent/fluent-bit:latest`
