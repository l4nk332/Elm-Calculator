const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: {
        app: path.resolve('src/index.js'),
    },
    module: {
        rules: [
            {
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use: 'elm-webpack-loader'
            }
        ],
        noParse: /\.elm$/
    },
    plugins: [
        new webpack.EnvironmentPlugin([
            'NODE_ENV',
        ]),
        new HtmlWebpackPlugin({
            template: path.resolve('index.html')
        })
    ],
};
