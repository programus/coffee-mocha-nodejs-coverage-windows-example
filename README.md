coffee+mocha+nodejs+coverage work on windows example
============================================

CoffeeScript + mocha + node.js + coverage under windows example

详细说明请见我的[中文博客](http://programus.github.com/blog/2012/05/26/coffee-mocha-coverage-node-under-windows/)。

## Prerequisite

### Package dependencies
Ensure all package dependencies are installed. Now only `chai` is the dependency. 

You can also just run `npm install` after cloned this repository to automatically install all dependencies. 

### JSCoverage
Ensure you have [JSCoverage](http://siliconforks.com/jscoverage/) for windows installed and added the directory of executable files into `PATH` envirenmonts parameters.

[node-jscoverage](https://github.com/visionmedia/node-jscoverage) is not needed.

## Run test

From command line:

	mocha --compilers coffee:coffee-script

Through make command:

	make test-all

## Coverage report generation

From command line:

	coffee -o lib-js -c lib
	jscoverage --no-highlight lib-js lib-cov
	mocha --compilers coffee:coffee-script -R html-cov > coverage.html

Through make command:

	make coverage

## Both test and coverage report

From command line: (just run all commands above)

Through make command:

	make


