# Overview

This snippet will:

1. Install OpenLDAP
2. Create a schema, dc=cloudavail,dc=com
3. Populate the schema.

# Commands to Investigate

## Load a Database using OLC (Online Config)
ldapadd -Y EXTERNAL -H ldapi:/// -f /vagrant/cloudavail_database.ldif

## Confirm a Database Loaded
ldapsearch -Y EXTERNAL -H ldapi:/// -b cn=config

## Search

### Returns Results
ldapsearch -Y EXTERNAL -H ldapi:/// -b dc=cloudavail,dc=com

### Fails to Return Results But No Error
ldapsearch -H ldap://localhost -b dc=cloudavail,dc=com -x

### Returns Results
ldapsearch -H ldap://localhost -b dc=cloudavail,dc=com -x -D cn=admin,dc=cloudavail,dc=com -w secret
