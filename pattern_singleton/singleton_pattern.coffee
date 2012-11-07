mySingleton = (()->
		instance = null
		init = ()->
			privateMethod = ()->
				console.log "I'm private"
			
			privateVariable = "I'm also private"
			
			{
				publicMethod: ()->
					console.log "The public can see me!"
				
				publicProperty: "I'm also public"
			}
		
		return {
			getInstance: ()->
				if !instance
					instance = init()
				return instance
		}
	)()
	
singleA = mySingleton
singleB = mySingleton

console.log singleA == singleB
singleA.getInstance().publicMethod()
