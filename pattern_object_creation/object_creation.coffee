newObject1 = {};
newObject1.someKey = "Hello World"
newObject2 = Object.create(null);
newObject3 = new Object();
Object.defineProperty(newObject2, "someKey", {
	value: "for more control of the property's beharior",
	writable: true,
	enumerable: true,
	configurable: true
})
newObject3["someKey"] = "Hello World"

console.log(newObject1.someKey)
console.log(newObject2.someKey)
console.log(newObject3["someKey"])

defineProp = (obj, key, value) ->
	config = {}
	config.value = value
	Object.defineProperty(obj, key, config);
	
person = Object.create(null)

defineProp( person, "car", "Delorean")
defineProp( person, "dateOfBirth", "1981")
defineProp( person, "hasBeard", false)

driver = Object.create(person)
defineProp( person, "topSpeed", "100mph")

console.log(driver.dateOfBirth)
console.log(driver.topSpeed)

