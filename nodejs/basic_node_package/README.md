# Overview

This snippet creates a Node module for use in other projects.

# Instructions for Creating a Module

See: https://docs.npmjs.com/creating-node-js-modules

# Instructions for Publishing a Module (GitHub)

## Prerequisites

It is currently understood that the `package.json` file `Name` field must match the name of the repository. For instance, to publish to to `cloudavail/snippets` you'd need to set the `Name` field as follows: `@cloudavail/snippets`

## Publishing a Module

1. Add a line to the `package.json` file as follows: `"publishConfig": { "registry": "https://npm.pkg.github.com/" }`
2. Login to the Github NPM Package Repository as follows: `npm login --registry=https://npm.pkg.github.com/`
3. Run `npm publish`

