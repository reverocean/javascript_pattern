basketModule = (()->
	basket = [];
	doSomethingPrivate = ()->
		
	doSomethingElsePrivate = ()->
		
	{
		addItem: (values)->
			basket.push(values)
		
		getItemCount: ()->
			basket.length
		
		doSomething: doSomethingPrivate
		
		getTotal: ()->
			total = 0
			total += item.price for item in basket
			total
	}
	)()
	
basketModule.addItem({
	item: "bread"
	price: 0.5
})	
basketModule.addItem({
	item: "butter"
	price: 0.3
})

console.log basketModule.getItemCount()
console.log basketModule.getTotal()
try
	console.log basketModule.basket  
catch error
 	console.log error
try
  console.log basket
catch error
  console.log error

