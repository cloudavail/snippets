# Notes on File

I've been switching between utilizing vagrant and Foxpass for exploring LDAP. I've used my own vagrant builds for testing and developing greater understanding and Foxpass as a standin for a production server where it is assumed all settings are configured as an "Enterprise" type organization would typically use them. I'm not an LDAP expert (as of 2018-11-01).

# Notes on options
`-h`/`-H` - the `-h` option prepends `ldap://` as protocol whereas `-H` allows you to specify.

# Connect and Query

`ldapsearch -H ldaps://ldap.foxpass.com -D 'cn=colin,dc=cloudavail,dc=com' -w $password -b 'dc=cloudavail,dc=com' 'objectClass=*'`

# Connect and Dump

Note that I am uncertain if this is an appropriate method of dumping/backing up LDAP.

`ldapsearch -H ldaps://ldap.foxpass.com -D 'cn=colin,dc=cloudavail,dc=com' -w $password -b 'dc=cloudavail,dc=com' 'objectClass=*' > ldap_backup.ldif`
