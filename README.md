### ES6 => ES5 -- a performance exploration.

#### Results

![screen shot 2016-02-01 at 11 05 17 am](https://cloud.githubusercontent.com/assets/883126/12727905/ff35b1a4-c8d3-11e5-9d1d-85e34b1f837b.png)


![image](https://cloud.githubusercontent.com/assets/883126/12728979/469eae42-c8d9-11e5-9429-597d634c90ea.png)

| Tools                        | File Size (bytes) | gzip size (bytes) | js execution time (ms) | tool run time (s)|
| -----------------------------|-------------------|-------------------|------------------------|------------------|
| webpack + babel + uglify     | 13973             | 3737              | 51.28                  | 6.228            |
| babel + rollup + uglify      | 15213             | 4175              | 50.81                  | 5.496            |
| rollup-babel-plugin + uglify | 15365             | 4130              | 49.50                  | 2.880            |
| closure                      | 15925             | 3824              | 53.15                  | 7.217            |
| typescript + uglify          | 19455             | 5379              | 48.49                  | 5.340            |
| babelify + uglify            | 20366             | 4770              | 53.02                  | 7.37             |
| babel + browserify + uglify  | 20366             | 4770              | 53.37                  | 6.979            |
| traceur + browserify + uglify| 98117             | 22357             | 66.60                  | 5.329            |

--------------------------------


#### Contributing

##### Building Samples

`make <babel | closure | typescript | rollup | traceur | ...>`

##### Generating sizes

* `make <example-name>`
* `make size`
* open demo in chrome... save timeline trace
* `npm i -g bigrig`
* `bigrig <path-to-trace> --pp`

##### View Demo

`cd src && python -m SimpleHTTPServer`

visit localhost:8000/
