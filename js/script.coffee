$ ()->
	$.getJSON('reasons.json')
	.success (data)->
		console?.log '読み込みに成功しました。'
		d = $ 'article#reasons div:not(.more)'
		d.append """<p>#{row.body}<a href="http://twitter.com/#{row.name}"><img src="http://api.twitter.com/1/users/profile_image?screen_name=#{row.name}&size=normal" /></a></p>""" for row in data.shuffle()
		d.masonry
			columnWidth:184
		m = $ 'article#reasons div.more'
		m.click (e) ->
			$('article#reasons').animate
				height:d.height()
			$(@).hide()
	.error ->
		console?.log '読み込みに失敗しました。'
		
Array::shuffle = -> @sort -> 0.5 - Math.random()