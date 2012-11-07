Subject = ()->
	this.observers = new ObserverList()
	return

Subject.prototype.AddObserver = (observer)->
	this.observers.Add(observer)

Subject.prototype.RemoveObserver = (observer)->
	this.observers.RemoveIndexAt(this.observers.IndexOf(observer))
	
Subject.prototype.Notify = (context) ->
  	for index in [0...this.observers.Count()]
  	  	this.observers.Get(index).Update(context)

Observer = () ->
	this.Update = (context) ->
	return
			
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


observerModule = 
	'config': 
		controlCheckboxId : '#mainCheckbox'
		addBtnId: '#addNewObserver'
		containerId: '#observersContainer'
		
	'init': (config)->
		if config and typeof(config) == 'object'
		  	$.extend(observerModule.config, config)
		
		observerModule.$controlCheckbox = $(observerModule.config.controlCheckboxId);
		observerModule.$addBtn = $(observerModule.config.addBtnId);
		observerModule.$container = $(observerModule.config.containerId);
		observerModule.initialized = true;
		
		extend(new Subject(), observerModule.$controlCheckbox)
		observerModule.bind()
	
	'bind': ->
		observerModule.$controlCheckbox.click(observerModule.Notify)	
		observerModule.$addBtn.click(observerModule.AddNewObserver)
		return
	
	'AddNewObserver': ->
		checkbox = $('<input type="checkbox" />')
		extend(new Observer(), checkbox)
		checkbox.Update = (value) ->
		  	$(this).attr("checked", if value then true else false)
			
		observerModule.$controlCheckbox.AddObserver(checkbox)
		
		observerModule.$container.append(checkbox)
	'Notify': ->
		observerModule.$controlCheckbox.Notify($(this).attr("checked"))
		
$(->
	observerModule.init()
	)