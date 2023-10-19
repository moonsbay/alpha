module.exports = {
    mode: "development",
    entry: {
        fill: "./src/fill.jsx",
        sort: "./src/sort.jsx",
    },
    output: {
        filename: "[name].js",
        path: __dirname + "/src/main/webapp/js/react"
    },
    devtool: 'eval-source-map',    //디버깅을 위해 소스를 번들에 포함시키는 설정.. 없어도 돌아간다
    module: {        //이 모듈로 인해.. 리엑트의 태그를 바벨로 통과시켜 사용가능케 한다
        rules: [
            {
                test: /\.jsx?/,
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/preset-env', '@babel/preset-react']
                }
            },
            {
                test: /\.css$/i,
                use: ['style-loader', 'css-loader']
            },
        ]
    },


};