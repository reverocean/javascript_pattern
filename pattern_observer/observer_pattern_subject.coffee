Subject = ()->
	this.observers = new ObserverList()

Subject.prototype.AddObserver = (observer)->
	this.observers.Add(observer)

Subject.prototype.RemoveObserver = (observer)->
	this.observers.RemoveIndexAt(this.observers.IndexOf(observer))
	
Subject.prototype.Notify = (context) ->
  	for index in [0..this.observers.Count()]
  	  	this.observers.Get(index).Update(context)