Car = (model, year, miles) ->
	this.model = model
	this.year = year
	this.miles = miles
	this.toString = () ->
		this.model + " has done " + this.miles + " miles"
	return this
	
Car.prototype.toString2 = () ->
	return "haha"

civic = new Car("Honda Civic", 2009, 20000)
mondeo = new Car("Ford Mondeo", 2010, 5000)

console.log civic.toString2()
console.log mondeo.toString2()
