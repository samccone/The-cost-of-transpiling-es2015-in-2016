### ES6 => ES5 -- a performance exploration.

#### Results

| Tools                        | File Size (bytes) |
| -----------------------------|-------------------|
| webpack + babel + uglify     | 13972             |
| closure                      | 15213             |
| rollup-babel-plugin + uglify | 15365             |
| babel + rollup + uglify      | 15925             |
| typescript + uglify          | 19455             |
| babel + browserify + uglify  | 20366             |
| traceur + browserify + uglify| 98117             |

--------------------------------


#### Contributing

##### Building Samples

`make <babel | closure | typescript | rollup | traceur | ...>`

##### View Demo

`cd src && python -m SimpleHTTPServer`

visit localhost:8000/
