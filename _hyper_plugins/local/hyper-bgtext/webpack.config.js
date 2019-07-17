module.exports = {
  mode: "production",
  entry: "./src/index.jsx",
  target: "node",
  output: {
    path: __dirname,
    filename: "index.js",
    libraryTarget: "commonjs"
  },
  module: {
    rules: [
      {
        test: /\.jsx$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: [
              [
                "@babel/preset-env",
                {
                  spec: true,
                  modules: false
                }
              ],
              "@babel/preset-react"
            ]
          }
        }
      }
    ]
  }
};
