SingletonTester = (()->
	Singleton = (options)->
		options = options || {}
		this.name = "SingletonTester"	
		this.pointX = options.pointX || 6
		this.pointY = options.pointY || 6
		return
		
	instance = undefined
	
	_static = {
		name: "SingletonTester"
		
		getInstance: (options)->
			if instance == undefined
				instance = new Singleton(options)
			return instance
	}
	
	return _static
	)()
	
singletonTest = SingletonTester.getInstance({
	pointX: 5
})


console.log singletonTest.pointX
console.log singletonTest.pointY
	