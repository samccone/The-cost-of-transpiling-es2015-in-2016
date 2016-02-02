### The cost of transpiling ES2015

**tl;dr**

There are a lot of tools to compile es2015 to es5. When choosing your compile stack you should be aware that tools that perform tree shaking and topological sorts of your code dependencies will result in smaller code bundles and faster js execution times.


--------------

#### The boom of es2015

With the recent es2015 boom 2016 javascript developers have a myriad of combinatorial choices when it comes to writing es2015 and compiling that code to es5 or lower. From closure compiler to browserify to uglify to webpack it is hard to know what is the best for compiling es2015 to run in browsers today.

Recently [Malte Ubl](https://twitter.com/cramforce) pointed out a dramatic overall file size savings that the AMP team got when they switched from babel + browserify to closure compiler.

[![screen shot 2016-02-01 at 4 56 07 pm](https://cloud.githubusercontent.com/assets/883126/12736393/bcb03d46-c904-11e5-8d4f-74a0921087bc.png)](https://twitter.com/cramforce/status/690640077865619456)


Malte's post got me thinking about how each of the tools available to developers have a slightly different approach when it comes to dealing with import statements and combining multiple files together. The following analysis aims to look at the cost across multiple tools when the goal is to deliver a single JS blob down to the user when writing vanilla non-annotated es2015. 

#### A simple test case:

To start with Let's take a look at this simple bit of code:

![screen shot 2016-02-01 at 8 58 29 pm](https://cloud.githubusercontent.com/assets/883126/12740282/93547044-c926-11e5-9d0b-16f5bbc48e91.png)

Above is vanilla es2015 code -- To run this code in a browser however we first have to convert it to es5 using one of several options. Initially let's try babel + browserify, closure compiler, and rollup, and then compare the output.

---------------

Compiling this example with **babel + browserify** results in the following bundle:

![screen shot 2016-02-01 at 8 59 23 pm](https://cloud.githubusercontent.com/assets/883126/12740298/b3c6b0da-c926-11e5-85dd-f3a2cdfc9ccb.png)

Now compare that result to using **closure compiler**:

![screen shot 2016-02-01 at 8 57 36 pm](https://cloud.githubusercontent.com/assets/883126/12740268/77bcc3d6-c926-11e5-8d60-2a1dae88c412.png)

Finally looking at **rollup**:

![screen shot 2016-02-01 at 9 11 59 pm](https://cloud.githubusercontent.com/assets/883126/12740488/788cff5e-c928-11e5-8bf9-8b6bdc2ac372.png)

> rollup simply dead code eliminates everything :)


As you can see, you are paying a fairly high cost per module when using a tool like browserify, as compared to closure or rollup -- This simply put, boils down to overhead per module which increases the overall size of your bundle.

---------

#### A slightly less trivial test:

For the next step in our analysis I will be using the vanilla es6 TodoMVC example from here https://github.com/tastejs/todomvc/tree/master/examples/vanilla-es6, (no code was changed to help any compilers perform better). For each of the tools that I measured againt, I compiled the source code, and then verified that the app was working before taking any measurements. 

##### The overhead and cost for this analysis was measured against the following metrics

* File bundle size
* Gzip size
* Tool run time (gathered by `time make <tool>`)
* *js execution time on page load (gathered by [big-rig](https://github.com/GoogleChrome/node-big-rig/))
* *js compile time (gathered by [big-rig](https://github.com/GoogleChrome/node-big-rig/))

> As a side note, the numbers that I gathered from the compile time metric and execution time were all within the margin of error of one another. so I will not be using those numbers to draw a hypothesis -- but the results are included at the end of the post.

##### Summary of findings:

Ignoring the outlier of traceur, people should heavily consider using a tool that does tree shaking (removal of unused code) and topological sorting of dependencies (ordering the dependencies so that you do not have to worry about import wrapping code). The difference between the final output size between a tool like browserify and rollup can well over 20%, even for a trivial app like TodoMVC.


![win](https://cloud.githubusercontent.com/assets/883126/12737115/d9445784-c90a-11e5-8e6e-ab38a74a16ee.png)

-------------

##### Raw data


| Tools                        | File Size (bytes) | gzip size (bytes) | js execution time (ms) | js compile time (ms) |tool run time (s)|
| -----------------------------|-------------------|-------------------|------------------------|----------------------|-----------------|
| webpack + babel + uglify     | 13973             | 3737              | 51.28                  | 9.59                 |6.228            |
| babel + rollup + uglify      | 15213             | 4175              | 50.81                  | 7.26                 |5.496            |
| rollup-plugin-babel + uglify | 15365             | 4130              | 49.50                  | 7.85                 |2.880            |
| closure                      | 15925             | 3824              | 53.15                  | 9.56                 |7.217            |
| typescript + uglify          | 19455             | 5379              | 48.49                  | 8.61                 |5.340            |
| babelify + uglify            | 20366             | 4770              | 43.96                  | 8.25                 |7.37             |
| babel + browserify + uglify  | 20366             | 4770              | 53.37                  | 8.85                 |6.979            |
| traceur + browserify + uglify| 98117             | 22357             | 66.60                  | 7.95                 |5.329            |

--------------------------------


#### Contributing / Running locally

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
