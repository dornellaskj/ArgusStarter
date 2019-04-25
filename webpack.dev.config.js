const path = require('path');
const webpack = require('webpack');
const HtmlWebPackPlugin = require('html-webpack-plugin');
const controller = require('./src/mainController.js');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
module.exports = {
  entry: {
    main: ['webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000', './src/views/helloWorld/index.js'],
    login: ['webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000', './src/views/login/index.js']
    },
  output: {
    path: path.join(__dirname, 'dist'),
    publicPath: '/',
    filename: '[name].js'
  },
  mode: 'development',
  target: 'web',
  devtool: '#source-map',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader",
      },
      {
        // Loads the javacript into html template provided.
        // Entry point is set below in HtmlWebPackPlugin in Plugins 
        test: /\.html$/,
        use: [
          {
            loader: "ejs-webpack-loader",
            options: {
              data: controller.data
            }
          }
        ]
      },
      { 
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: ['css-loader','sass-loader'],
        }),
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: ['file-loader']
      }
    ]
  },
  plugins: [
    new HtmlWebPackPlugin({
      template: "./src/views/helloWorld/index.html",
      filename: "./index.html",
      chunks: ['main'],
    }),
    new HtmlWebPackPlugin({
      template: "./src/views/login/index.html",
      filename: "./login/index.html",
      chunks: ['login'],
    }),
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoEmitOnErrorsPlugin(),
    new ExtractTextPlugin('[name].css'),
  ]
}