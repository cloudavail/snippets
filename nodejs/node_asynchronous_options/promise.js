#!/usr/bin/env node
const promise = new Promise((resolve, reject) => {
    //resolve('good');
    //reject('bad');
  })
  .then(value => {
    console.log(value);
  })
  .catch(err => {
    console.log(err);
  })
