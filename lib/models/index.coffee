class Greeter
	constructor: (@lang) ->
		if !@lang?
			@lang = 'en'
	
	sayHello: (name) ->
		switch @lang
			when 'jp'
				# nameさん、こんにちは。
				"#{if name? then "#{name}\u3055\u3093\u3001" else ""}\u3053\u3093\u306B\u3061\u306F\u3002"
			when 'zh'
				# name，你好！吃了没？
				"#{if name? then "#{name}\uFF0C" else ""}\u4F60\u597D\uFF01\u5403\u4E86\u6CA1\uFF1F"
			else
				"Hello#{if name? then ", #{name}" else ""}!"

exports.Greeter = Greeter
