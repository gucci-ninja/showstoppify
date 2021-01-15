const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const webpack = require('webpack')
const dotenv = require('dotenv')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.plugins.prepend('env',
  new webpack.DefinePlugin({
    'process.env': JSON.stringify(dotenv.config().parsed)
  })
)

module.exports = environment