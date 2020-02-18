# Expirement to Route DNS Traffic to AWS

Note the experiment described below failed - it seems likely because the requests for the DNS server used within Amazon's network (`127.0.0.53/32`) did not receive traffic from the OpenVPN client.

1. Add route to 127.0.0.53/32 in openvpn Access Server. Confirm route exists (note: I believe that the `sacli` command supports query parameters so that results can be returned without the need for `grep`):
```
root@openvpnas2:/usr/local/openvpn_as/scripts# ./sacli ConfigQuery | grep -i 'vpn.server.routing.private_network'
  "vpn.server.routing.private_network.0": "10.0.0.0/25", 
  "vpn.server.routing.private_network.1": "127.0.0.53/32", 
```
2. Confirm route to server 127.0.0.53 by running `netstat -nr` on client.
3. Confirm traffic being routed over network by capturing "PING" traffic using Wireshark.
4. Result is that traffic can be seen.
5. Duplicate test using `dig cloudavail.com @127.0.0.53` - traffic unable to be seen on any interface in Wireshark.
6. Duplicate test using `dig cloudavail.com @10.0.0.50` (an address on VPN) - traffic can be seen on `utun10`.

# Expirement to use Route53 Resolvers

This expirement did work and the configuration is available from within `./openvpn_access_server_ami_with_route_53_resolver.yaml`.
