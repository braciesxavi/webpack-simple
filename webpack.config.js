var path = require('path');
var webpack = require('webpack');
module.exports = {
    entry: "./asset/app/main.coffee",
       
    output: {
        path: path.resolve(__dirname, './asset/builds'),
        publicPath: path.resolve(__dirname, './asset/builds'),
        filename: "[name].js"
    },
    module: {
        loaders: [
            { test: /\.css$/, loader: "style!css" },
            { test: /\.html$/, loader: "html" },
            { test: /\.coffee$/, loader: "coffee-loader" },
            {
                test: /\.png$/,
                loader: 'url-loader?limit=100000&mimetype=image/png'
            },
        ]
    },
    resolve: {
        modulesDirectories: [
          'node_modules',
          'asset/components'
        ]
    },
    // watch: true 
};