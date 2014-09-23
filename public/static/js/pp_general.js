$(document).on('ready', function() {

	$('.nav > a').each(function(args) {

		var $this = $(this)
		var cursorIsOverLink = false;
		var $hint = $this.find('.hint');
		var timeout = 1000;
		$hint.hide();

		function tryToHideHint() {
			if (cursorIsOverLink)
				return;
			$hint.fadeOut();
		}

		var to = setTimeout(tryToHideHint, timeout);

		$this.hover(function() {
			cursorIsOverLink = true;
			clearTimeout(to);
			$hint.fadeIn();
			$this.siblings().each(function (args) {
			  $(this).find('.hint').stop(true,false).fadeOut();
			});
		}, function() {
			cursorIsOverLink = false;
			clearTimeout(to);
			to = setTimeout(tryToHideHint, timeout);
		});

	});

});
