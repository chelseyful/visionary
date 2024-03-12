const path = require('path');

module.exports = {
    mode: 'production',
    target: "node",
    entry: {
        echo: './src/echo.ts',
        function: './src/function.ts',
    },
    optimization: {
        //minimize: false, // Disable minimization to prevent tree shaking
        usedExports: true,
        concatenateModules: false, // You might want to turn this off
    },
    module: {
        rules: [
            {
                test: /\.ts$/,
                include: [path.resolve(__dirname, 'src')],
                use: 'ts-loader',
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js'],
    },
    /*devtool: 'eval-source-map',*/
    output: {
        publicPath: 'dist',
        //filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist'),
        libraryTarget: 'commonjs2',
    },
};
