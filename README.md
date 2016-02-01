### ES6 => ES5 -- a performance exploration.

#### Results

| Tools                        | File Size (bytes) | gzip size (bytes) | js execution time |
| -----------------------------|-------------------|-------------------|-------------------|
| webpack + babel + uglify     | 13973             | 3737              | 51.28ms           |
| babel + rollup + uglify      | 15213             | 4175              | 50.81ms           |
| closure                      | 15925             | 3824              | 53.15ms           |
| rollup-babel-plugin + uglify | 15365             | 4130              | 49.50ms           |
| typescript + uglify          | 19455             | 5379              | 48.49ms           |
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
