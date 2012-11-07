myFeature = 
	'config' : 
		container : '#myFeature'
		
	'init': (config)->
		if config and typeof(config) == 'object'
		  $.extend(myFeature.config, config)
		
		myFeature.$container = $(myFeature.config.container);
		myFeature.$sections = myFeature.$container.find('ul.sections > li')
		myFeature.$section_nav = $('<p/>').attr('id', 'section_nav').prependTo(myFeature.$container)
		myFeature.$item_nav = $('<p/>').attr('id', 'item_nav').insertAfter(myFeature.$section_nav)
		myFeature.$content = $('<p/>').attr('id', 'content').insertAfter(myFeature.$item_nav)
		
		myFeature.buildSectionNav(myFeature.$sections)
		myFeature.$section_nav.find('li:first').click()
		
		myFeature.$container.find('ul.sections').hide();
		
		myFeature.initialized = true;
		
	'buildSectionNav': ($sections)->
		$sections.each(->
			$section = $(this)
			$('<li/>').text($section.find('h2:first').text())
				.appendTo(myFeature.$section_nav)
				.data('section', $section)
				.click(myFeature.showSection)
		)
		
	'buildItemNav': ($items)->
		$items.each(->
					$item = $(this)
					$('<li/>').text($item.find('h3:first').text())
						.appendTo(myFeature.$item_nav)
						.data('item', $item)
						.click(myFeature.showContentItem)
					)
					
	'showSection': ()->
		$li = $(this)
		myFeature.$item_nav.empty()
		myFeature.$content.empty()
		
		$section = $li.data('section')
		
		$li.addClass('current')
			.siblings().removeClass('current')
		
		$items = $section.find('ul li')
		myFeature.buildItemNav($items)
		myFeature.$item_nav.find('li:first').click()
		
		
	'showContentItem': ()->
		$li = $(this)
		$li.addClass('current')
			.siblings().removeClass('current')
			
		$item = $li.data('item')
		myFeature.$content.html($item.html())

$(->
	myFeature.init()
	)
		 
