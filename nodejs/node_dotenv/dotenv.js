#!/usr/bin/env node
require('dotenv').config()

console.log(`Value of Baseball Team: ${process.env.BASKETBALL_TEAM}.`)
console.log(`Value of Basketball Team: ${process.env.BASEBALL_TEAM}.`)
