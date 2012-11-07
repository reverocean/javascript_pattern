$ = (func) ->
	func.call()
	
library = (module) ->
	$(()->
		if module.init
			module.init()
		)
	return module


myLibrary = library((()->
	{
		init: ()->
			console.log "do something in init method"
	}
	)())