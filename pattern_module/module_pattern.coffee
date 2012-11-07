testModule = (() ->
	counter = 0
	{
		incrementCounter : ()->
			counter++
		
		resetCounter: ()->
			console.log "counter value prior to reset: " + counter
			counter = 0
	}
	)()
	
testModule.incrementCounter()
testModule.resetCounter()