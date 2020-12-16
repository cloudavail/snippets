#!/usr/bin/env node

function printToConsole (string) {
  console.log(string)
}

setTimeout(printToConsole, 1000, 'Called after 1 second');
setTimeout(printToConsole, 5000, 'Called after 5 seconds');
setTimeout(printToConsole, 10000, 'Called after 10 seconds');
