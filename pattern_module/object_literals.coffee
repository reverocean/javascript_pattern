myModule = 
	variableKey: "variableValue"
	functionkey: () ->
		
	myProperty: 'someValue'
	myConfig: 
		useCaching: true
		language: 'en'
	myMethod: ->
		console.log("Where in the world is Paul Irish today?")
	myMethod2: ->
		console.log("Caching is: " + if this.myConfig.useCaching then "enabled" else "disabled")		
	myMethod3: (newConfig) ->
		if typeof newConfig == 'object'
			this.myConfig = newConfig
			console.log(this.myConfig.language)
	
myModule.myMethod()
myModule.myMethod2()
myModule.myMethod3({
	language: "fr"
	useCaching: false
})



		