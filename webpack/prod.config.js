const path = require('path');
const webpack = require('webpack');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const merge = require('webpack-merge');
const baseConfig = require('./base.config.js')

module.exports = merge(baseConfig, {
    output: {
        path: path.resolve('dist'),
        filename: '[name].min.js'
    },
    module: {
        rules: [
            {
                test: /\.(css|sass|scss)$/,
                use: [
                    'style-loader',
                    'css-loader',
                    'postcss-loader',
                    'sass-loader'
                ]
            },
        ],
    },
    plugins: [
        new UglifyJsPlugin({
            sourceMap: false,
        }),
        new webpack.LoaderOptionsPlugin({
            minimize: true,
        }),
    ],
});
