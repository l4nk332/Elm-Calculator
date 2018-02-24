const path = require('path');
const merge = require('webpack-merge');
const baseConfig = require('./base.config.js')

module.exports = merge(baseConfig, {
    devtool: 'eval-source-map',
    devServer: {
        inline: true,
        contentBase: path.resolve('dist'),
        stats: { colors: true }
    },
    module: {
        rules: [
            {
                test: /\.(css|sass|scss)$/,
                use: [
                    'style-loader?sourceMap',
                    'css-loader?sourceMap',
                    'postcss-loader?sourceMap',
                    'sass-loader?sourceMap'
                ]
            },
        ],
    },
});
