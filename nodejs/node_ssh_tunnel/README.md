# Overview

This snippet serves to aid the understanding of the use of the [tunnel-ssh](https://www.npmjs.com/package/tunnel-ssh) npm Module.

# Usage

To use the module, you can `source vars.sh` provided you have entered the proper variables in the `vars.sh` file. Also note you could use a `dotenv` file for this purpose.

```
source vars.sh
node ssh_tunnel.js
```

The above will establish a long-lived ssh connection

# Usage (MySQL Connect)

```
mysql -u $username -h 127.0.0.1 -p -P 3305
```
