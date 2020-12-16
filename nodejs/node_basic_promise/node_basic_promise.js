#!/usr/bin/env node

const https = require('https')

const options = {
  hostname: 'www.cloudavail.com',
  port: 443,
  path: '/',
  method: 'GET'
}

const req = https.request(options)
console.log(req)
req.end()
