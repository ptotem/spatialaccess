window.onload = function() {

	var isShowedAnimation = true,
		navTimeout,
		navAnimation;

	setTimeout(function(){

		navAnimation = setInterval(function(){
			$('.nav-animation').children(':visible').fadeOut(2000, function(){
				$(this).siblings().fadeIn(2000)
			});
		}, 4000);

		customEventEngine.bind(para, 'finishedMove', function(amount) {
			navigationShow(2000);
		});

		customEventEngine.bind(para, 'startedMove', function(amount) {
			clearTimeout(navTimeout);
			$('.left-arrow, .right-arrow, .nav-animation').css('display', 'none');
		});

		navigationShow(5000);

		$('.left-arrow').click(para.closerLeft);	
		$('.right-arrow').click(para.closerRight);


	}, 2000);

	function is_touch_device() {  
	  try {  
	    document.createEvent("TouchEvent");  
	    return true;  
	  } catch (e) {  
	    return false;  
	  }  
	}

	if(is_touch_device()) {
		$('.left-arrow, .right-arrow, .nav-animation').addClass('touch');
	} else {
		$('.left-arrow, .right-arrow, .nav-animation').addClass('no-touch');
	}

	function navigationShow(time) {
		var url = window.location.href;
		var id = url.substring(url.lastIndexOf('#'));
		
		navTimeout = setTimeout(function(){
			if (para.currentSlideI == para.slidesCount - 1) {

				$('.left-arrow').fadeIn(1000);

			} else if (para.currentSlideI == 0) {

				$('.right-arrow').fadeIn(1000);
				
				if (isShowedAnimation && (id == '#' || id)) {
					$('.nav-animation').fadeIn(1000);
				}
			} else {
				$('.left-arrow, .right-arrow').fadeIn(1000);
			}
			isShowedAnimation = false;
		}, time);
	}
}