### The cost of transpiling ES2015

With the recent es2015 boom 2016 javascript developers have a myriad of combinatorial choices when it comes to writing es2015 and compiling that code to es5 or lower. From closure compiler to browserify to uglify to webpack it is hard to know what is the best for comping es2015 to run in browsers today.

Recently [Malte Ubl](https://twitter.com/cramforce) pointed out a dramatic overall file size savings that the AMP team got when they switched from babel + browserify to closure compiler.

[![screen shot 2016-02-01 at 4 56 07 pm](https://cloud.githubusercontent.com/assets/883126/12736393/bcb03d46-c904-11e5-8d4f-74a0921087bc.png)](https://twitter.com/cramforce/status/690640077865619456)


Malte's post got me thinking about how each of the tools available to developers have a slightly different approach when it comes to dealing with import statements and combining multiple files together. The following analysis aims to look at the cost across multiple tools when the goal is to deliver a single JS blob down to the user when writing vanilla non-annotated es2015. 

---------

##### The overhead and cost for this analysis is measured against the following metrics

* File bundle size
* Gzip size
* js execution time on page load (gathered by [big-rig](https://github.com/GoogleChrome/node-big-rig/))
* V8 js compile time (gathered by [big-rig](https://github.com/GoogleChrome/node-big-rig/))
* Tool run time (gathered by `time make <tool>`)

##### Summary of findings:

Ignoring the outlier of traceur, people should heavily consider using a tool that does tree shaking (removal of unused code) and topological sorting of dependencies (ordering the dependencies so that you do not have to worry about import wrapping code). The difference between the final output size between a tool like browserify and rollup can be up to 20%.


![win](https://cloud.githubusercontent.com/assets/883126/12737115/d9445784-c90a-11e5-8e6e-ab38a74a16ee.png)

-------------

##### Raw data


| Tools                        | File Size (bytes) | gzip size (bytes) | js execution time (ms) | js compile time (ms) |tool run time (s)|
| -----------------------------|-------------------|-------------------|------------------------|----------------------|-----------------|
| webpack + babel + uglify     | 13973             | 3737              | 51.28                  | 9.59                 |6.228            |
| babel + rollup + uglify      | 15213             | 4175              | 50.81                  | 7.26                 |5.496            |
| rollup-babel-plugin + uglify | 15365             | 4130              | 49.50                  | 7.85                 |2.880            |
| closure                      | 15925             | 3824              | 53.15                  | 9.56                 |7.217            |
| typescript + uglify          | 19455             | 5379              | 48.49                  | 8.61                 |5.340            |
| babelify + uglify            | 20366             | 4770              | 43.96                  | 8.25                 |7.37             |
| babel + browserify + uglify  | 20366             | 4770              | 53.37                  | 8.85                 |6.979            |
| traceur + browserify + uglify| 98117             | 22357             | 66.60                  | 7.95                 |5.329            |

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
