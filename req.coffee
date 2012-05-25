module.exports = (path)->
	try
		require "./lib-cov/#{path}"
	catch e
		require "./lib/#{path}"

