myNamespace = (()->
		myPrivateVar = 0
		
		myPrivateMethod = (foo)->
			console.log foo
		
		{
			myPublicVar: 'foo'
			myPublicFunction: (bar)->
				myPrivateVar++
				myPrivateMethod(bar)
		}
	)()