const http = require("http");
const process = require("process");
const heapdump = require("heapdump");

const requestLogs = [];
const server = http.createServer((req, res) => {
  requestLogs.push({ url: req.url, date: new Date() });
  res.end(JSON.stringify(requestLogs));
});

server.listen(3000);

heapdump.writeSnapshot('./' + Date.now() + '.heapsnapshot');

console.log("Server listening to port 3000. Press Ctrl+C to stop it.");

if (process.pid) {
  console.log('This process is your pid ' + process.pid);
}
