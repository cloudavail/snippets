var fs = require('fs');
fs.createReadStream("C:/nodetest/iisstart.htm").pipe(fs.createWriteStream("C:/inetpub/wwwroot/iisstart.htm"));
