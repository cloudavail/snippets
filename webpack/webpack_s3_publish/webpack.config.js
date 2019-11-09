const path = require('path');
var S3Plugin = require('webpack-s3-plugin')

module.exports = {
  entry: './src/index.js',
  mode: 'development',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
  plugins: [
    // plugin usage is described here: https://webpack.js.org/concepts/plugins/
    new S3Plugin({
      directory: path.resolve(__dirname, 'dist'),
      /*
      note that using "include: /.*\.(html|js)/," does not appear to work
      as I believe that the "include" option only includes "built" files
      and index.html (in our case) is not a built file
      */
      s3Options: {
        region: 'us-east-1'
      },
      s3UploadOptions: {
        Bucket: 'colinjohnson-test'
      }
    })
  ]
};
