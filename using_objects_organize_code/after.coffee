myFeature = 
	config : 
		wrapper : '#myFeature'
		container : 'div'
		urlBase : 'foo.php?item='
	
	init : (config) ->
		$.extend(myFeature.config, config)
		$(myFeature.config.wrapper).find('li').
			each(->
					myFeature.getContent($(this))
				).
			click(->
					myFeature.showContent($(this))
				)
	
	buildUrl: ($li)->
		myFeature.config.urlBase + $li.attr('id')
	
	getContent: ($li)->
		$li.append(myFeature.config.container)
		url = myFeature.buildUrl($li)
		li.find(myFeature.config.container).load(url)
	
	showContent: ($li)->
		$li.find('div').show()
		$myFeature.hideContent($li.siblings())			
		
	hideContent: ($element)->
		$element.find('div').hide()
		
$(document).ready(->
		myFeature.init()
	)