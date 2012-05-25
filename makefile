REPORT_FILE=coverage.html

test-all:
	mocha --compilers coffee:coffee-script

compile:
	coffee -o lib-js -c lib

coverage: compile
	jscoverage --no-highlight lib-js lib-cov
	mocha --compilers coffee:coffee-script -R html-cov > $(REPORT_FILE)
	rm -rf lib-cov
	start $(REPORT_FILE)

clean:
	rm -rf lib-cov
	rm -rf lib-js

.PHONY: test-all

