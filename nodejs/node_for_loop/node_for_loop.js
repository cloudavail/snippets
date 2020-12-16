#!/usr/bin/env node

const fs = require('fs');
const readline = require('readline');

const rl = readline.createInterface({
  input: fs.createReadStream('./warriors2019.txt')
});

rl.on('line', (line) => {
  console.log(line);
});
