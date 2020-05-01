#!/usr/bin/env node

const fs = require('fs')

var data = fs.readFileSync('./warriors2019.txt');

console.log(data.toString());
