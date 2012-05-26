REPORT_FILE=coverage.html
RMJS=rmdir.js
RMV=node $(RMJS)
# change this if using linux or others
BROWSE=start

all: | test-all coverage

# use this to cross platform
$(RMJS):
	@echo 'var f=require("fs"),t=require("path");var r=function(a){var b=f.readdirSync(a);for(var c=0;c<b.length;c++){var d=b[c];if(d!=="."&&d!=".."){d=t.join(a,d);if(f.statSync(d).isDirectory()){r(d)}else{try{f.unlinkSync(d)}catch(e){}}}}try{f.rmdirSync(a)}catch(e){}};try{r(process.argv[2])}catch(e){}' > $(RMJS)

# use this to cross platform
rmtools:
	@coffee -e "require('fs').unlink 'rmdir.js'"

test-all:
	@echo 'Testing...'
	@mocha --compilers coffee:coffee-script

compile-coffee: $(RMJS)
	@$(RMV) lib-js
	@echo 'CoffeeScript -> JavaScript compiling...'
	@coffee -o lib-js -c lib
	@$(RMV) -p

clean-compile:
	@$(RMV) -p

jscoverage:
	@jscoverage --no-highlight lib-js lib-cov

mocha-html-cov:
	@echo 'Testing and generating coverage report...'
	@mocha --compilers coffee:coffee-script -R html-cov > $(REPORT_FILE)

clean-coverage:
	@$(RMV) lib-js
	@$(RMV) lib-cov

open-coverage:
	@echo 'Openning report in your default browser...'
	@$(BROWSE) $(REPORT_FILE)

clean-report:
	@$(RMV) $(REPORT_FILE)

compile: | $(RMJS) compile-coffee rmtools

coverage: | $(RMJS) compile-coffee jscoverage mocha-html-cov clean-coverage rmtools open-coverage

clean: | $(RMJS) clean-compile clean-coverage clean-report rmtools

.PHONY: all test-all compile-coffee clean-compile jscoverage mocha-html-cov clean-coverage open-coverage clean-report compile coverage clean rmtoos

