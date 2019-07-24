var os = require('os'),
cpuCount = os.cpus().length;
console.log(`CPU Cores: ${cpuCount}`);
