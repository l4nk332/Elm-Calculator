var path = require("path");

module.exports = {
    entry: {
        app: [
            './src/index.js'
        ]
    },

    output: {
        path: path.resolve(__dirname + '/dist'),
        filename: '[name].js'
    },
    devTool: 'source-map',
    module: {
        loaders: [
            {
                test: /\.(css|sass|scss)$/,
                loaders: [
                    'style-loader',
                    'css-loader?sourceMap',
                    'postcss-loader',
                    'sass-loader?sourceMap'
                ]
            },
            {
                test: /\.html$/,
                exclude: /node_modules/,
                loader: 'file?name=[name].[ext]'
            },
            {
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                loader: 'elm-webpack'
            }
        ],

        noParse: /\.elm$/
    },

    devServer: {
        inline: true,
        stats: { colors: true }
    }
};
