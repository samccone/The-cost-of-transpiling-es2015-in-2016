### ES6 => ES5 -- a performance exploration.

* [x] babel + browserify + uglify
* [x] babel + rollup + uglify
* [x] typescript + uglify
* [ ] traceur compiler + uglify
* [x] closure compiler

---------------------------------


#### Results

| Tools              | File Size (bytes) |
| -------------------|-------------------|
| typescript         | 19455             |
| babel + browserify | 20366             |
| closure            | 15213             |
| babel + rollup     | 15925             |


--------------------------------


#### Contributing

##### Building Samples

`make <babel | closure | typescript>`

##### View Demo

`cd src && python -m SimpleHTTPServer`

visit localhost:8000/
