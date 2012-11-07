$(document).ready(->
		$('#myFeature li')
			.append("<div/>")
			.each( ->
						$(this).find("div").load('foo.php?item='+ $(this).attr('id'))
				)
			.click(->
					$(this).find('div').show()
					$(this).siblings().find('div').hide()
				)
	);