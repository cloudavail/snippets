#!/usr/bin/env node

const ArgumentParser = require('argparse').ArgumentParser;
// const argparse = require('argparse'); will cause node look for argparse.js in all paths
// specified by the command below:
//cjohnson06:node_basic_argparse cjohnson$ node
//> module.paths

var argparser = new ArgumentParser({
  addHelp:true,
  description: 'Argparse example'
});
argparser.addArgument(
  [ '--example-argument' ],
  {
    help: 'An Example Argument'
  }
);

var args = argparser.parseArgs();
console.log(args);
