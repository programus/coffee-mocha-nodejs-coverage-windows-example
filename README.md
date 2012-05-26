coffee+mocha+nodejs+coverage work on windows example
============================================

CoffeeScript + mocha + node.js + coverage under windows example

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


