### ES6 => ES5 -- a performance exploration.

#### Results

| Tools                        | File Size (bytes) | gzip size (bytes) |
| -----------------------------|-------------------|-------------------|
| webpack + babel + uglify     | 13973             | 3737              |
| closure                      | 15925             | 3824              |
| rollup-babel-plugin + uglify | 15365             | 4130              |
| babel + rollup + uglify      | 15926             | 4175              |
| typescript + uglify          | 19455             | 5379              |
| babel + browserify + uglify  | 20366             | 4770              |
| traceur + browserify + uglify| 98117             | 22357             |

--------------------------------


#### Contributing

##### Building Samples

`make <babel | closure | typescript | rollup | traceur | ...>`

##### View Demo

`cd src && python -m SimpleHTTPServer`

visit localhost:8000/
