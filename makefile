REPORT_FILE=coverage.html
RMJS=rmdir.js
RMV=node $(RMJS)
# change this if using linux or others
BROWSE=start

# use this to cross platform
tool.rmdir:
	@echo 'var f=require("fs"),t=require("path");var r=function(a){var b=f.readdirSync(a);for(var c=0;c<b.length;c++){var d=b[c];if(d!=="."&&d!=".."){d=t.join(a,d);if(f.statSync(d).isDirectory()){r(d)}else{try{f.unlinkSync(d)}catch(e){}}}}try{f.rmdirSync(a)}catch(e){}};try{r(process.argv[2])}catch(e){}' > $(RMJS)

# use this to cross platform
rmtools:
	@coffee -e "require('fs').unlink 'rmdir.js'"

test-all:
	mocha --compilers coffee:coffee-script

compile-coffee: tool.rmdir
	@$(RMV) lib-js
	coffee -o lib-js -c lib
	@$(RMV) -p

jscoverage:
	jscoverage --no-highlight lib-js lib-cov

mocha-html-cov:
	mocha --compilers coffee:coffee-script -R html-cov > $(REPORT_FILE)

clean-coverage:
	@$(RMV) lib-js
	@$(RMV) lib-cov

open-coverage:
	@$(BROWSE) $(REPORT_FILE)

compile: | tool.rmdir compile-coffee rmtools

coverage: | tool.rmdir compile-coffee jscoverage mocha-html-cov clean-coverage rmtools open-coverage

clean: tool.rmdir
	@$(RMV) -p
	@$(RMV) lib-cov
	@$(RMV) lib-js
	@$(RMV) $(REPORT_FILE)
	@make rmtools

.PHONY: test-all

