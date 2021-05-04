# Run Docker

- This will start a fluentbit container using the file `./conf/fluent-bit.conf`: `docker run --volume "$(pwd)/conf/fluent-bit.conf:/fluent-bit/etc/fluent-bit.conf" fluent/fluent-bit:latest`

