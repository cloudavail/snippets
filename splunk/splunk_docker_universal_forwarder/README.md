# Run a Splunk Forwarder

The command below will start a universal forwarder.

`docker run --env SPLUNK_START_ARGS=--accept-license --env SPLUNK_PASSWORD=XYT9QRguyHhHC7cM --publish 8089:8089 splunk/universalforwarder:8.1.1`

## Use the splunk CLI to investigate Configuration

```
docker exec -it d9c /bin/bash
/opt/splunkforwarder/bin
[ansible@d9c7fa6c750f bin]$ sudo ./splunk list forward-server
Splunk username: admin 
Password: 
Active forwards:
	None
Configured but inactive forwards:
	None
```

## Use the REST API to investigate Configuration

```
curl -k -u admin:XYT9QRguyHhHC7cM https://localhost:8089/services
```

# Start and Accept a License File

```
docker run \
  --mount type=bind,source=$(pwd)/splunkclouduf.spl,target=/tmp/splunkclouduf.spl \
  --env SPLUNK_START_ARGS=--accept-license \
  --env SPLUNK_PASSWORD=XYT9QRguyHhHC7cM \
  --env SPLUNK_CMD='install app /tmp/splunkclouduf.spl -auth admin:XYT9QRguyHhHC7cM' \
  --publish 8089:8089 \
  splunk/universalforwarder:8.1.1
```

# Start and Accept a License File and Monitor Own Logs

```
docker run \
  --mount type=bind,source=$(pwd)/splunkclouduf.spl,target=/tmp/splunkclouduf.spl \
  --mount type=bind,source=$(pwd)/log,target=/var/log \
  --env SPLUNK_START_ARGS=--accept-license \
  --env SPLUNK_PASSWORD=XYT9QRguyHhHC7cM \
  --env SPLUNK_CMD='install app /tmp/splunkclouduf.spl -auth admin:XYT9QRguyHhHC7cM' \
  --publish 8089:8089 \
  splunk/universalforwarder:8.1.1
```

## Add a Monitor of /var/log

```
sudo ./splunk add monitor /var/log -index test
sudo ./splunk list monitor
```

## Confirm inputs.conf Added

`sudo cat /opt/splunkforwarder/etc/apps/search/local/inputs.conf`

## Generate Log Events

From outside of the container, run `log-generator apache_fake_logs.yaml`.

# References

