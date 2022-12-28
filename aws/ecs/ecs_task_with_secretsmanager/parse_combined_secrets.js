#!/usr/bin/env node
const allSecrets = process.env.ALL_SECRETS;
const parsedSecrets = JSON.parse(allSecrets);
# below is an example of using the given secret
console.log(parsedSecrets['secret-one']);
console.log(parsedSecrets['secret-two']);
