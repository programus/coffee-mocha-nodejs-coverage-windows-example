# Test suites for all models
chai = require 'chai'
should = chai.should()

models = require('../req') 'models'
Greeter = models.Greeter

langs = [
	'zh'
	'en'
	'jp'
]

hellos =
	zh: '你好！吃了没？'
	en: 'Hello!'
	jp: 'こんにちは。'

hellosWithName =
	zh:
		name: '老舍'
		greet: '老舍，你好！吃了没？'
	en:
		name: 'Jack'
		greet: 'Hello, Jack!'
	jp:
		name: '武蔵'
		greet: '武蔵さん、こんにちは。'

describe 'Greeter', ->
	describe '#constructor()', ->
		it 'should have language set', ->
			new Greeter(l).lang.should.eql(l) for l in langs
		xit 'should become default language, en', ->
		# remove the 'x' before 'it' of this case to make the coverage 100%
			new Greeter().lang.should.eql('en')

	describe '#sayHello()', ->
		it 'should greet without name', ->
			new Greeter(l).sayHello().should.eql(hellos[l]) for l in langs
		it 'should greet with name', ->
			new Greeter(l).sayHello(hellosWithName[l].name).should.eql(hellosWithName[l].greet) for l in langs
