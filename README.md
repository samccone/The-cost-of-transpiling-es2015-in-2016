### ES6 => ES5 -- a performance exploration.

#### Results

![screen shot 2016-02-01 at 11 05 17 am](https://cloud.githubusercontent.com/assets/883126/12727905/ff35b1a4-c8d3-11e5-9d1d-85e34b1f837b.png)


| Tools                        | File Size (bytes) | gzip size (bytes) | js execution time |
| -----------------------------|-------------------|-------------------|-------------------|
| webpack + babel + uglify     | 13973             | 3737              | 51.28ms           |
| babel + rollup + uglify      | 15213             | 4175              | 50.81ms           |
| rollup-babel-plugin + uglify | 15365             | 4130              | 49.50ms           |
| closure                      | 15925             | 3824              | 53.15ms           |
| typescript + uglify          | 19455             | 5379              | 48.49ms           |
| babelify + uglify            | 20366             | 4770              | 53.02ms           |
| babel + browserify + uglify  | 20366             | 4770              | 53.37ms           |
| traceur + browserify + uglify| 98117             | 22357             | 66.60ms           |

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
