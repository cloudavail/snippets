const fs = require('fs');
const tunnel = require('tunnel-ssh');


var config = {
  username: process.env.SSH_USERNAME,
  host: process.env.SSH_HOST,
  port: 22,
  privateKey: require('fs').readFileSync(process.env.PRIVATE_KEY),
  dstHost: process.env.DST_HOST,
  dstPort: 3306,
  localHost: '127.0.0.1',
  localPort: 3305
};

var tnl = tunnel(config, function (error, server) {
  // print connection details
  console.log(server);
  // close connection
  // tnl.close()
});
