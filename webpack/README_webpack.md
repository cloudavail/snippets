# Explains how to install and run webpack

1. Run this commands in directory you are working in

```
mkdir webpack-demo
cd webpack-demo
npm init -y
npm install webpack webpack-cli --save-dev
```

## In the files, we have the following:
```
    "clean-webpack-plugin": "^3.0.0",
    "express": "^4.17.1",
    "html-webpack-plugin": "^3.2.0",
    "webpack": "^4.41.2",
    "webpack-cli": "^3.3.10",
    "webpack-dev-middleware": "^3.7.2",
    "webpack-dev-server": "^3.9.0"
```


2. With the `webpack.config.js` file, the script runs locally on `http://localhost:3000` with the command `npm run server` when you place `index.html` file in a browser

