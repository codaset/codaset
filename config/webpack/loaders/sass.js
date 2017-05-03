const ExtractTextPlugin = require('extract-text-webpack-plugin')
const { env } = require('../configuration.js')
const includeMedia = require('include-media').includePath

module.exports = {
  test: /\.(scss|sass|css)$/i,
  use: ExtractTextPlugin.extract({
    fallback: 'style-loader',
    use: [
      {
        loader: 'css-loader',
        options: {
          minimize: env.NODE_ENV === 'production'
        }
      },
      'postcss-loader',
      {
        loader: 'sass-loader',
        options: {
          includePaths: [includeMedia]
        }
      }
    ]
  })
}
