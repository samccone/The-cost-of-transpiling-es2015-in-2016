var path = require('path');
var webpack = require('webpack');

module.exports = {
  module: {
    loaders: [
      {
        test: /\.js?$/,
        exclude: /node_modules/,
        loader: require.resolve('babel-loader'),
        query: {
          presets: [ require.resolve('babel-preset-es2015-webpack') ]
        }
      }
    ]
  },
  resolveLoader: { root: path.join(__dirname, 'node_modules') },
  plugins: [
    new webpack.optimize.UglifyJsPlugin()
  ]
};
