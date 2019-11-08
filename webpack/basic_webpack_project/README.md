# Overview

This snippet describes how to create and run a basic webpack project.

# Initialize the Basic Webpack Project

Note that the commands below have already been run.

```
npm init -y
npm install webpack webpack-cli --save-dev
```

## Confirm Proper Configuration

The above command will create a file named `package.json` that contains a `devDependencies` section that looks similar to the following:

```
"devDependencies": {
  "express": "^4.17.1",
  "html-webpack-plugin": "^3.2.0",
  "webpack": "^4.41.2",
  "webpack-cli": "^3.3.10",
  "webpack-dev-middleware": "^3.7.2",
  "webpack-dev-server": "^3.9.0"
}
```

# Building the Application

- Run `npm install --only=dev` - this will install the `devDependencies` including the `webpack` tool used to perform an `npm run build`.
- Run `npm run build` - this will perform a webpack build, as described in the `package.json` file. The output of this command will be a `dist` directory containing 


