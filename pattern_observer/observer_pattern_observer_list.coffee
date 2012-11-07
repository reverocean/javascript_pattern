ObserverList = ()->
	this.observerList = []
	return
ObserverList.prototype.Add = (obj)->
	this.observerList.push(obj)
	
ObserverList.prototype.Empty = ()->
	this.observerList = []
	
ObserverList.prototype.Count = ()->
	this.observerList.length
	
ObserverList.prototype.Get = (index)->
	if index > -1 and index < this.observerList.length
		return this.observerList[index]
		
ObserverList.prototype.Insert = (obj, index)->
	pointer = -1
	
	if index == 0
		this.observerList.unshift(obj)
		pointer = index;
	else if index == this.observerList.length
		this.observerList.push(obj)
		pointer = index;
		
	return pointer
	
ObserverList.prototype.IndexOf = (obj, startIndex = 0)->
	for observer, index in this.observerList[startIndex...this.observerList.length]
		if obj == observer
			 return index + startIndex
	return -1
	
ObserverList.prototype.RemoveAt = (index)->
	if index == 0
	  this.observerList.shift()
	else if index == this.observerList.length - 1
	  this.observerList.pop()

extend = (obj, extension)->
	for key, value of obj
	  extension[key] = value
	return
