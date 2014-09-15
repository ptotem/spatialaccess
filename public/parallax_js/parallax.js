/*
 * Ð—Ð°Ð²Ð¸ÑÐ¸Ñ‚ Ð¾Ñ‚ jquery, jquery.mousewheel Ð¸ jquery.custom.
 *
 * Ð’Ð°Ð¶Ð½Ð¾Ðµ Ð¾Ð³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ðµ: Ð¿Ð¾ÐºÐ° Ñ‡Ñ‚Ð¾ ÑÐ»Ð¾Ð¸ ÑÐ¾ ÑÐºÐ¾Ñ€Ð¾ÑÑ‚ÑÐ¼Ð¸ Ð¼ÐµÐ½ÑŒÑˆÐµ ÐµÐ´Ð¸Ð½Ð¸Ñ†Ñ‹
 * (Ð¿ÐµÑ€ÐµÐ´Ð²Ð¸Ð³Ð°ÑŽÑ‰Ð¸ÐµÑÑ Ð¼ÐµÐ´Ð»ÐµÐ½ÐµÐµ, Ñ‡ÐµÐ¼ Ð·Ñ€Ð¸Ñ‚ÐµÐ»ÑŒ)
 * Ñ€Ð°Ð±Ð¾Ñ‚Ð°ÑŽÑ‚ Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ð±ÑƒÐ´ÑƒÑ‡Ð¸ Ñ€Ð°Ð·Ð¼ÐµÑ‰ÐµÐ½Ñ‹ Ð¿Ñ€ÑÐ¼Ð¾ Ð²Ð½ÑƒÑ‚Ñ€Ð¸ ÑÐ»Ð°Ð¹Ð´Ð°,
 * Ð° Ð½Ðµ Ð² Ð³Ð»ÑƒÐ±Ð¸Ð½Ðµ Ð²ÐµÑ€ÑÑ‚ÐºÐ¸.
 *
 * ÐÐµÑÐ»Ð¾Ð¶Ð½Ñ‹Ð¹ Ð´Ð²Ð¸Ð¶Ð¾Ðº Ð¿Ð°Ñ€Ð°Ð»Ð»Ð°ÐºÑÐ° --
 * -- Ñ€Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚Ð°Ð½ Ð² Ð¡Ñ‚ÑƒÐ´Ð¸Ð¸ Numart
 * by furikuretsu.
 *
 * */

function parallax(param) {

	/* ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ */

	var parallaxID = "parallax", overflowsParentClass = "overflowsSlide", wrapsWindowWidthClass = 'wrapsWindowWidth', paralaxBackgroundClass = 'parallaxBackground',

	/* ÐžÑ‚ÐºÐ»ÑŽÑ‡Ð°ÐµÑ‚ ÑÐºÑ€Ð¾Ð»Ð»Ð±Ð°Ñ€ Ð²Ð¾Ð²ÑÐµ */
	scrollbarFullyRemoved = param.removeScrollbar;

	/*
	 * ÐœÐ¾Ð¶Ð½Ð¾ Ð·Ð°Ð´Ð°Ñ‚ÑŒ Ñ‚Ð¸Ð¿ Ð°Ð½Ð¸Ð¼Ð°Ñ†Ð¸Ð¸ Ð¿Ð°Ñ€Ð°Ð»Ð»Ð°ÐºÑÐ° Ð¸ ÑÐ»Ð¾ÐµÐ²
	 * Ð¸ Ð°Ð½Ð¸Ð¼Ð¸Ñ€ÑƒÐµÐ¼Ð¾Ðµ ÑÐ²Ð¾Ð¹ÑÑ‚Ð²Ð¾.
	 *
	 * Ð”Ð°Ð»ÐµÐµ ÑÐ»ÐµÐ´ÑƒÐµÑ‚ Ð¾Ñ†ÐµÐ½ÐºÐ°
	 * ÑÐ¾Ð²Ð¼ÐµÑÑ‚Ð¸Ð¼Ð¾ÑÑ‚Ð¸ Ð½Ð°ÑÑ‚Ñ€Ð¾ÐµÐº
	 * Ð² Ð²Ð¸Ð´Ðµ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ñ‹.
	 *
	 * Ð‘ÐµÐ· Ð°Ð½Ð¸Ð¼Ð°Ñ†Ð¸Ð¸ Ð²Ð¸Ñ€Ñ‚ÑƒÐ°Ð»ÑŒÐ½Ð¾Ð³Ð¾ ÑÐºÑ€Ð¾Ð»Ð»Ð°:
	 *
	 *              X     JQuery     CSS3
	 * left      |	o  |    o    |    o    |
	 * translate |	o  |    ?    |    o    |
	 *
	 * Ð¡ Ð°Ð½Ð¸Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ñ‹Ð¼ Ð²Ð¸Ñ€Ñ‚ÑƒÐ°Ð»ÑŒÐ½Ñ‹Ð¼ ÑÐºÑ€Ð¾Ð»Ð»Ð¾Ð¼:
	 *
	 *              X     JQuery     CSS3
	 * left      |	o  |    x    |    x    |
	 * translate |	o  |    x    |    x    |
	 *
	 *
	 *  */


	var animationTypes = {
		NONE : 0,
		JQ_EASED : 1,
		CSS3_EASED : 2,
		SUPER_EASED : 3,
		EASED : 4
	}, shiftPropertyTypes = {
		LEFT : 'left',
		TRANSLATEX : 'translateX',
		TRANSLATE : 'translate',
		TRANSLATE3D : 'translate3d'
	};

	var layerAnimationType = animationTypes.NONE, 
		scrollValueAnimationType = animationTypes.EASED, 
		parallaxLeftAnimationType = animationTypes.NONE;

	var layerShiftProperty = param.layerShiftProperty || 'left', 
		parallaxShiftProperty = param.parallaxShiftProperty ||  'left';

	//http://easings.net/ru
	var scrollEasing = 'easeOutExpo', scrollAnimationDuration = 1500;

	/* Ð­Ñ‚Ñƒ Ñ„ÑƒÐ½ÐºÑ†Ð¸ÑŽ ÑÑ‚Ð¾Ð¸Ñ‚ Ð´Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð² document).on('ready */
	this.onInit = function() {
	};

	/* ÐšÐ¾Ð½ÐµÑ† Ð½Ð°ÑÑ‚Ñ€Ð¾ÐµÐº, Ð½Ð°Ñ‡Ð°Ð»Ð¾ Ñ€Ð°Ð±Ð¾Ñ‡ÐµÐ³Ð¾ ÐºÐ¾Ð´Ð° */

	var para_cached = this;
	
	var windowWidth;

	var slides = {
		$src : undefined,
		array : [],
		singleSlideWidth : 0
	};

	
	var scroll = {
		add : function() {
		},
		get : function() {
		},
		delta : 0,
		cur : 0,
		previous : 0,
		maxLimit : 0,
		firstStep : 0,
		$src : undefined,
		startWindowWidth : 0,
		resizeModifier : 1,
		minimalStep : 0
	};
	
	para_cached.scroll = scroll;

	this.currentSlideI = 0;

	this.mouseWheelTarget = $('body');

	this.findLayerWrapper = function(src) {

		for (var i = 0, s = slides.array[0]; i < slides.array.length; i++, s = slides.array[i]) {

			for (var j = 0, l = s.layers[0]; j < s.layers.length; j++, l = s.layers[j]) {

				if (src == l.$src[0]) {
					return l;
				}

			}

		}
	}
	
	var slideChangeModel = 'onBorder';
	
	function layer($src, prnt) {

		//$src.parent().css('display','');

		var hasParalaxBackgroundClass = $src.hasClass(paralaxBackgroundClass);

		this.$src = $src;
		this.prnt = prnt;
		this.spd = +$src.attr('alt');

		if (hasParalaxBackgroundClass) {
			$src.css('min-height', '100%');
		}

		var slowness = 1 - this.spd, extraSpeed = this.spd - 1;

		var halfWindowWidth, halfParentWidth, preCalculatedPosition, halfWidth;

		var hasOverflowMarker = $src.hasClass(overflowsParentClass), isSmallAndSlow;

		var relLeftBorder = 0, relRightBorder;

		if (layerAnimationType == animationTypes.CSS3_EASED) {
			CSS3setupAdjust(layerShiftProperty, this.$src);
		}

		this.applyWindowSize = function() {

			if (!hasParalaxBackgroundClass) {
				$src.attr('style', '');
			} else {

				hotdot.applyHorizontalShift('', $src);
				$src.css({
					width : ''
				});
				// Opera:
				// Ð¿ÐµÑ€ÐµÐºÐ»ÑŽÑ‡ÐµÐ½Ð¸Ðµ Ð¿Ð¾Ð·Ð¸Ñ†Ð¸Ð¾Ð½Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ
				// ÑÐ»Ð¾Ñ Ñ Ð¾Ñ‚Ð½Ð¾ÑÐ¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾Ð³Ð¾ Ð½Ð° Ð°Ð±ÑÐ¾Ð»ÑŽÑ‚Ð½Ð¾Ðµ
				// Ñ€ÑƒÑˆÐ¸Ñ‚ Ð²ÐµÑ€ÑÑ‚ÐºÑƒ.
				var usingOpera = navigator.userAgent.indexOf('Opera') > -1;
				if (!usingOpera) {
					$src.css({
						position : ''
					});
				}
			}

			halfWindowWidth = windowWidth / 2;
			halfParentWidth = this.prnt.width / 2;

			/*var isTestSlide = false&&$src.parent().is('#intro');*/
			
			if (hasParalaxBackgroundClass) {

				this.width = $src.width();
				var minWidth = this.spd * (this.prnt.prnt.width - windowWidth) + windowWidth;

				if (this.width < minWidth) {
					this.width = minWidth;
					$src.width(this.width);
				}

			} else {
				
				// Ð‘Ð°Ð³ Ð² (sic!) Ð¥Ñ€Ð¾Ð¼Ðµ.
				// Ð­Ð»ÐµÐ¼ÐµÐ½Ñ‚ <img alt="5.5" class='test-subject' src="../img/mainPage/intro/4.png" />
				// Ð˜Ð¼ÐµÐµÑ‚ Ð¿Ñ€Ð°Ð²Ð¸Ð»Ð°, Ð¼ÐµÐ½ÑÑŽÑ‰Ð¸Ðµ ÐµÐ³Ð¾ Ð²Ñ‹ÑÐ¾Ñ‚Ñƒ.
				// Ð’ ÑÑ‚Ð¾Ñ‚ Ð¼Ð¾Ð¼ÐµÐ½Ñ‚ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ñ‹ Ð¥Ñ€Ð¾Ð¼ Ð¼ÐµÐ½ÑÐµÑ‚ Ð²Ñ‹ÑÐ¾Ñ‚Ñƒ Ð² ÑÐ¾Ð¾Ñ‚Ð²ÐµÑ‚ÑÑ‚Ð²Ð¸Ð¸ Ñ Ð¿Ñ€Ð°Ð²Ð¸Ð»Ð¾Ð¼,
				// Ð½Ð¾ Ð¾ÑÑ‚Ð°Ð²Ð»ÑÐµÑ‚ ÑˆÐ¸Ñ€Ð¸Ð½Ñƒ Ð½ÐµÐ¸Ð·Ð¼ÐµÐ½Ð½Ð¾Ð¹.
				// ÐŸÐ¾Ð¿Ñ€Ð¾Ð±ÑƒÐµÐ¼ Ð²Ñ‹Ð»ÐµÑ‡Ð¸Ñ‚ÑŒ Ð½ÐµÐ±Ð¾Ð»ÑŒÑˆÐ¸Ð¼ Ð²ÑÑ‚Ñ€ÑÑ…Ð¸Ð²Ð°Ð½Ð¸ÐµÐ¼ ÑÐ¾ÑÑ‚Ð¾ÑÐ½Ð¸Ñ ÑÐ»ÐµÐ¼ÐµÐ½Ñ‚Ð°.
				$src.css('position','absolute');
				/*(if(isTestSlide){
					console.log($src,$src.width());
				}*/
				this.width = $src.width();
				$src.css('position','');
				/*if(isTestSlide){
					console.log($src,$src.width());
				}*/
			}

			halfWidth = this.width / 2;
			relRightBorder = prnt.width - this.width;

			isSmallAndSlow = this.spd <= 1 && this.width < this.prnt.width;
			this.overflowsParent = hasOverflowMarker || hasParalaxBackgroundClass || !isSmallAndSlow;

			this.$src.css('left', '');

			// Moz:
			// Ð•ÑÐ»Ð¸ Ð¿Ð¾Ð·Ð¸Ñ†Ð¸Ð¾Ð½Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ ÑÐ»Ð¾Ñ Ð½Ð° ÑÑ‚Ð¾Ñ‚ Ð¼Ð¾Ð¼ÐµÐ½Ñ‚ Ð°Ð±ÑÐ¾Ð»ÑŽÑ‚Ð½Ð¾Ðµ,
			// Ñ‚Ð¾ Ð´Ð°Ð¶Ðµ Ñ ÑƒÑ‡ÐµÑ‚Ð¾Ð¼ Ñ€ÐµÑÐµÑ‚Ð° css('left', '')
			// .css('left') Ð±ÑƒÐ´ÐµÑ‚ Ð²Ñ‹Ð´Ð°Ð²Ð°Ñ‚ÑŒ Ñ‡Ð¸ÑÐ»Ð¾Ð²Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ,
			// Ð½Ðµ ÑÐ¾Ð´ÐµÑ€Ð¶Ð°Ñ‰ÐµÐµÑÑ Ð½Ð¸ Ð² Ð¾Ð´Ð½Ð¾Ð¼ Ð¸Ð· ÐºÐ°ÑÐºÐ°Ð´Ð½Ñ‹Ñ… ÑÑ‚Ð¸Ð»ÐµÐ¹.
			var cssLeft = $src.css('left');

			/*
			 * Ð’ ÐžÐ¿ÐµÑ€Ðµ Ð½ÐµÐ»ÑŒÐ·Ñ Ð¿ÐµÑ€ÐµÐºÐ»ÑŽÑ‡Ð°Ñ‚ÑŒ Ð¿Ð¾Ð·Ð¸Ñ†Ð¸Ð¾Ð½Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ñ„Ð¾Ð½Ð¾Ð²Ð¾Ð³Ð¾ ÑÐ»Ð¾Ñ,
			 * Ð½Ð¾ Ð¼Ð¾Ð¶Ð½Ð¾ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ð¸Ñ‚ÑŒ, Ñ‡Ñ‚Ð¾ css-left = auto, Ð¿Ñ€Ð¸ Ð°Ð±ÑÐ¾Ð»ÑŽÑ‚Ð½Ð¾Ð¼.
			 * Ð’ FF Ð¼Ð¾Ð¶Ð½Ð¾ Ð¿ÐµÑ€ÐµÐºÐ»ÑŽÑ‡Ð°Ñ‚ÑŒ Ð¿Ð¾Ð·Ð¸Ñ†Ð¸Ð¾Ð½Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ ÑÑ‚Ð¾Ð³Ð¾ ÑÐ»Ð¾Ñ,
			 * Ð½Ð¾ Ð½ÐµÐ»ÑŒÐ·Ñ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ð¸Ñ‚ÑŒ, Ñ‡Ñ‚Ð¾ css-left = auto, Ð¿Ñ€Ð¸ Ð°Ð±ÑÐ¾Ð»ÑŽÑ‚Ð½Ð¾Ð¼.
			 * Ð ÐµÑˆÐµÐ½Ð¸Ðµ: Ð´Ð»Ñ ÐžÐ¿ÐµÑ€Ñ‹ Ð²ÑÐµÐ³Ð´Ð° ÑÐ¾Ñ…Ñ€Ð°Ð½ÑÑ‚ÑŒ Ð°Ð±ÑÐ¾Ð»ÑŽÑ‚Ð½Ð¾Ðµ Ð¿Ð¾Ð·Ð¸Ñ†Ð¸Ð¾Ð½Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ,
			 * Ð´Ð»Ñ Ð¾ÑÑ‚Ð°Ð»ÑŒÐ½Ñ‹Ñ… Ð±Ñ€Ð°ÑƒÐ·ÐµÑ€Ð¾Ð² -- Ð¾Ñ‚ÐºÐ»ÑŽÑ‡Ð°Ñ‚ÑŒ Ð²Ð¾ Ð²Ñ€ÐµÐ¼Ñ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð¸Ñ css-left = auto.
			 */
			$src.css({
				display : 'inline-block',
				overflow : 'visible',
				position : 'absolute'
			});

			// Moz:
			// Ð­Ð»ÐµÐ¼ÐµÐ½Ñ‚Ñ‹ Ñ Ð¿Ð¾Ð·Ð¸Ñ†Ð¸Ð¾Ð½Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸ÐµÐ¼ Ð½Ðµ-static
			// Ð²Ñ‹Ð´Ð°ÑŽÑ‚ Ñ‡Ð¸ÑÐ»ÐµÐ½Ð½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð´Ð°Ð¶Ðµ Ð¿Ñ€Ð¸ Ð¾Ñ‚ÑÑƒÑ‚ÑÑ‚Ð²Ð¸Ð¸ left Ð² ÑÑ‚Ð¸Ð»Ðµ.
			if (cssLeft == 'auto') {
				this.left = halfParentWidth - halfWidth;
			} else {
				this.left = parseInt(cssLeft, 10);
			}

			if (layerShiftProperty !== shiftPropertyTypes.LEFT) {
				this.$src.css('left', '0px');
			};

			if (this.spd == 0) {
				preCalculatedPosition = halfWindowWidth - halfWidth;
			} else if (this.spd > 0 && this.spd < 1) {
				preCalculatedPosition = (halfWindowWidth - halfWidth) * (1 - this.spd) + this.left * this.spd;
			} else {
				preCalculatedPosition = this.left;
			}

		}
		/*
		 Ð¤Ð¾Ñ€Ð¼ÑƒÐ»Ñ‹ Ð¿Ð¾Ð´ÑÑ‡ÐµÑ‚Ð° Ð² ÑÑ‹Ñ€Ð¾Ð¼ Ð²Ð¸Ð´Ðµ:

		 spd = 0
		 halfWindowWidth-halfWidth+inScroll
		 spd: (0,1)
		 (halfWindowWidth-halfWidth+inScroll)*(1-this.spd)+this.left*this.spd
		 spd > 1
		 this.left-inScroll*(this.spd-1)
		 */

		this.parallaxLeft = function(inScroll) {

			if (this.spd == 0) {
				this.currentLeft = preCalculatedPosition + inScroll;
			} else if (this.spd > 0 && this.spd < 1) {
				this.currentLeft = preCalculatedPosition + inScroll * slowness;
			} else {
				this.currentLeft = preCalculatedPosition - inScroll * extraSpeed;
			}
			return this.currentLeft
		}

		this.adjust = function(inScroll) {

			var left = this.parallaxLeft(inScroll);

			/*
			 Ð¡Ð»Ð¾ÑÐ¼ Ð½Ð° Ð¿ÐµÑ€ÐµÐ´Ð½ÐµÐ¼ Ð¿Ð»Ð°Ð½Ðµ (Ð¾Ñ‡ÐµÐ½ÑŒ Ð±Ñ‹ÑÑ‚Ñ€Ñ‹Ð¼)
			 Ð¿Ð¾Ð·Ð²Ð¾Ð»ÑÐµÐ¼ Ð²Ñ‹Ñ…Ð¾Ð´Ð¸Ñ‚ÑŒ Ð·Ð° Ð³Ñ€Ð°Ð½Ð¸Ñ†Ñƒ ÑÐ»Ð°Ð¹Ð´Ð°
			 */

			if (!this.overflowsParent) {

				var leftBorder = relLeftBorder, rightBorder = relRightBorder;

				if (left < leftBorder) {
					left = leftBorder;
				} else if (left > rightBorder) {
					left = rightBorder;
				}

			}

			if (layerAnimationType == animationTypes.CSS3_EASED || layerAnimationType == animationTypes.NONE) {

				hotdot.applyHorizontalShift(left, this.$src, layerShiftProperty);
			} else if (layerAnimationType == animationTypes.JQ_EASED) {
				jqueryAnimateShift(this.$src, left);
			}

		}

		return this;
	}

	function slide($src, masterSlide, prnt) {

		this.masterSlide = masterSlide;
		this.layers = [];
		this.$src = $src;
		this.initialLeft = 0;
		this.left = 0;
		this.width = 0;
		this.$axis = {};
		this.prnt = prnt;
		var children = this.$src.children();

		var windowWidth_cache;

		this.childrenVisible = true;

		this.adjust = function() {

			this.left = this.initialLeft - this.prnt.$src.scroll;

			var right = this.left + this.width;

			var toTheLeftOfScreen = this.left < 0 && right < 0, toTheRightOfScreen = this.left > windowWidth_cache && right > windowWidth_cache;

			if ((toTheLeftOfScreen || toTheRightOfScreen)
				&& !param.noSlideHideOptimization) {
				if (this.childrenVisible) {
					children.hide();
					this.childrenVisible = false;
				}
			} else {
				if (!this.childrenVisible) {

					children.show();
					this.childrenVisible = true;
				}

				/* ÐŸÐµÑ€ÐµÑ…Ð¾Ð´ Ðº Ð´Ð¾Ñ‡ÐµÑ€Ð½Ð¸Ð¼ ÑÐ»Ð¾ÑÐ¼ */

				var scrollPosition = -this.left;

				for (var i = 0, l = this.layers[0], len = this.layers.length; i < len; i++, l = this.layers[i]) {
					l.adjust(scrollPosition);
				}
			}

		}
		var slide = this;

		this.applyWindowSize = function() {

			windowWidth_cache = windowWidth;
			this.$src.css('display', '');
			if (masterSlide) {
				this.width = this.prnt.width;
				this.initialLeft = 0;

			} else {
				this.width = windowWidth;
				this.initialLeft = this.prnt.width;
				this.$src.css('width', this.width);

			}

		}
		this.applyWindowSize();

		this.applyWindowSizeToChildren = function() {

			children.show();

			for (var i = 0, j = slide.layers.length; i < j; i++) {
				slide.layers[i].applyWindowSize();
			};
		}

		this.initChildren = function() {

			var layerChildren;

			if (masterSlide) {
				layerChildren = this.$src.children('[alt]');
			} else {
				layerChildren = $('*[alt]', this.$src);
			}

			children.show();

			layerChildren.each(function() {

				var $layer = $(this)

				if ($layer.attr('alt') == '1') {
					$layer.css({
						position : 'absolute'
					});
					slide.$axis = $layer;

				} else {
					var wrapped = new layer($layer, slide);
					slide.layers.push(wrapped);
				}
			});
		}
		this.initChildren();

		return this;

	}


	this.init = init;
	function init() {

		slides.$src = $('#' + parallaxID);
		slides.$src.scroll = 0;

		if (scrollbarFullyRemoved) {
			$('html').css('overflow', 'hidden');
		} else {
			$('html').css({
				'overflow-x' : 'scroll',
				'overflow-y' : 'hidden'
			});
		}

		slides.$src.children('div').css({
			height : '100%',
			position : 'relative',
			float : 'left',
			overflow : 'hidden'
		});

		slides.$src.css({
			width : '100%',
			height : '100%',
			'overflow-x' : 'visible',
			position : 'fixed'
		});

		if (parallaxLeftAnimationType === animationTypes.CSS3_EASED) {
			CSS3setupAdjust(parallaxShiftProperty, slides.$src);
		}

		initSlides();

		applyWindowSize();
		
		applyWindowSizeToParallaxLayers();

		refreshSlides();
		
		//$('body').bind('mousewheel', onMouseWheel);

		$('.' + paralaxBackgroundClass).css('z-index', 'auto');

		this.onInit();

	}

	function initSlides() {

		/* ÐžÐ±Ñ‹Ñ‡Ð½Ñ‹Ðµ ÑÐ»Ð°Ð¹Ð´Ñ‹ */

		slides.array = [];

		slides.$src.find('> div').each(function() {
			var $slide = $(this);
			if ($slide.attr('alt'))
				return;
			var p = new slide($slide, false, slides);

			slides.array.push(p);
		});

		para_cached.slidesCount = slides.array.length;

		/* Ð¡Ð°Ð¼ Ð¿Ð°Ñ€Ð°Ð»Ð»Ð°ÐºÑ Ð²Ñ‹ÑÑ‚ÑƒÐ¿Ð°ÐµÑ‚ Ð² ÐºÐ°Ñ‡ÐµÑÑ‚Ð²Ðµ ÑÐ»Ð°Ð¹Ð´Ð°
		 * Ð¿Ð¾ Ð¾Ñ‚Ð½Ð¾ÑˆÐµÐ½Ð¸ÑŽ Ðº Ñ„Ð¾Ð½Ñƒ Ð¿Ð°Ñ€Ð°Ð»Ð»Ð°ÐºÑÐ° */

		var p = new slide(slides.$src, true, slides);
		slides.array.push(p);

	}

	function applyWindowSize() {

		windowWidth = $(window).innerWidth();

		slides.singleSlideWidth = windowWidth;

		scroll.minimalStep = windowWidth / 1000 / 15;

		slides.width = 0;

		for (var i = 0, l = slides.array.length; i < l; i++) {
			var s = slides.array[i]
			s.applyWindowSize();
			if (!s.masterSlide) {
				slides.width += s.width;
			}
		}

		slides.$src.width(slides.width);
		scroll.maxLimit = slides.width - windowWidth;

		initScrollbar();

	}

	function applyWindowSizeToParallaxLayers() {
		for (var i = 0, s = slides.array[i]; i < slides.array.length; i++, s = slides.array[i]) {

			s.applyWindowSizeToChildren();
		}

		customEventEngine.call(para_cached, 'engineRebuild', slides.$src.scroll);
	}

	var intervalID, stepToBe;

	// Ð£Ñ‡Ð°ÑÑ‚Ð½Ð¸Ðº ÑÐ¾Ð±ÑÑ‚Ð²ÐµÐ½Ð½Ð¾Ñ€ÑƒÑ‡Ð½Ð¾ ÑÐ´ÐµÐ»Ð°Ð½Ð½Ð¾Ð³Ð¾ ÑÐ³Ð»Ð°Ð¶ÐµÐ½Ð½Ð¾Ð³Ð¾ ÑÐºÑ€Ð¾Ð»Ð»Ð°
	function stepF() {

		stepToBe = (scroll.cur - slides.$src.scroll) / 15;

		if (Math.abs(stepToBe) > scroll.minimalStep) {
			slides.$src.scroll += stepToBe;

			refreshSlidesAndFireListeners();

		} else if (scroll.doingNextMove) {
			scroll.doingNextMove = false;

			customEventEngine.call(para_cached, 'finishedMove', slides.$src.scroll);
			slides.$src.removeClass('disable-hover');

		}

	};

	var straightScrollSwitch = false;

	function straightScroll() {

		slides.$src.scroll = scroll.cur;

		refreshSlidesAndFireListeners();

		straightScrollSwitch = false;
	}

	var lastSlideI = 0, currentSlideI = 0, rawScroll = 0;

	function trackSlideChange() {

		rawScroll = scroll.cur / slides.singleSlideWidth;

		if(slideChangeModel == 'onBorder'){
			
			// ÑÐ¼ÐµÐ½Ð° Ð¿Ñ€Ð¾Ð¸ÑÑ…Ð¾Ð´Ð¸Ñ‚
			// Ð½Ð° Ð³Ñ€Ð°Ð½Ð¸Ñ†Ðµ ÑÐ»Ð°Ð¹Ð´Ð¾Ð²
			while (rawScroll <= lastSlideI - .5) {
				para.currentSlideI--;
				lastSlideI = para.currentSlideI;
			}
	
			while (rawScroll >= lastSlideI + .5) {
				para.currentSlideI++;
				lastSlideI = para.currentSlideI;
			}
		
		} else {
			
			// ÑÐ¼ÐµÐ½Ð° Ð¿Ñ€Ð¾Ð¸ÑÑ…Ð¾Ð´Ð¸Ñ‚ 
			// Ð² Ñ†ÐµÐ½Ñ‚Ñ€Ðµ ÑÐ¾ÑÐµÐ´Ð½ÐµÐ³Ð¾ ÑÐ»Ð°Ð¹Ð´Ð°
			while (rawScroll <= lastSlideI - 1) {
				para.currentSlideI--;
				lastSlideI = para.currentSlideI;
			}
	
			while (rawScroll >= lastSlideI + 1) {
				para.currentSlideI++;
				lastSlideI = para.currentSlideI;
			}
		}
	}

	function getScrollPositionAndAnimateEverything() {

		scroll.cur = scroll.get();
		scroll.delta = Math.abs(slides.$src.scroll - scroll.cur);

		scroll.doingNextMove = true;

		
		customEventEngine.call(para_cached, 'startedMove', slides.$src.scroll);

		if(!straightScrollSwitch) slides.$src.addClass('disable-hover');


		if (false)
			alert('getScrollPositionAndAnimateEverything : .cur: ' + scroll.cur + ', $src.scroll: ' + slides.$src.scroll);

		if (straightScrollSwitch) {

			straightScroll();

		} else if (scrollValueAnimationType == animationTypes.EASED) {

			if (!intervalID)
				intervalID = setInterval(stepF, 17);

		} else if (scrollValueAnimationType == animationTypes.SUPER_EASED) {
			if (scroll.delta > 70) {

				scroll.firstStep = true;

				slides.$src.stop(true, true).animate({
					scroll : scroll.cur
				}, {
					step : function(now, fx) {

						/* Ð´Ð¸ÐºÐ¸Ð¹ Ñ…Ð°Ðº */
						if (scroll.firstStep) {
							fx.start = slides.$src.scroll;
							scroll.firstStep = false;
							return;
						}

						refreshSlidesAndFireListeners();
						slides.$src.scroll = now;

					},
					duration : scrollAnimationDuration,
					easing : scrollEasing
				});

			} else {

				slides.$src.stop(true, true);
				slides.$src.scroll = scroll.cur;
				refreshSlidesAndFireListeners()
			}

		} else if (scrollValueAnimationType == animationTypes.JQ_EASED) {

			slides.$src.stop().animate({
				scroll : scroll.cur
			}, {
				step : function(now, fx) {
					slides.$src.scroll = now;
					refreshSlidesAndFireListeners();

				},
				duration : scrollAnimationDuration,
				easing : scrollEasing
			});

		} else {
			straightScroll();
		}

		trackSlideChange();

	}
	
	function refreshSlidesAndFireListeners(){
		
		refreshSlides();
		customEventEngine.call(para_cached, 'scrollChange', slides.$src.scroll);
		
	}

	function refreshSlides() {

		if (parallaxLeftAnimationType == animationTypes.CSS3_EASED || parallaxLeftAnimationType == animationTypes.NONE) {
			hotdot.applyHorizontalShift(-slides.$src.scroll, slides.$src, parallaxShiftProperty);
		} else if (parallaxLeftAnimationType == animationTypes.JQ_EASED) {
			jqueryAnimateShift(slides.$src, -slides.$src.scroll);
		}

		
		for (var i = 0, s = slides.array[0], len = slides.array.length; i < len; i++, s = slides.array[i]) {
			s.adjust();
		}

		

		/*
		 for(var l in scrollListeners){

		 scrollListeners[l](slides.$src.scroll);
		 }*/

	}

	function initScrollbar() {

		var scrollListenerTarget;

		var firstInit = scroll.$src ? false : true;

		if (!firstInit) {
			scroll.$src.remove();
		} else {
			startWindowWidth = windowWidth;
		}

		if (param.touchNotScrollMode) {

			/*
			 $('html').css('overflow','hidden');
			 $('body').css('overflow','hidden');*/

			var dummy = $('<div/>').css({
				position : 'absolute',
				display : 'hidden'
			});

			if (firstInit)
				$('body').append(dummy);

			scroll.$src = $('<div/>').css({
				width : slides.width,
			});

			var touchStart = 0;
			time = {
				start : 0,
				end : 0
			};

			var delta, speed = {
				cur : 0,
				max : 15,
				min : .1
			};

			if (firstInit) {

				slides.$src[0].addEventListener("touchmove", function(e) {


					if (e.touches.length > 1)
						return;

					e.preventDefault();

					time.end = new Date().getTime();

					var deltaTime = time.end - time.start;

					delta = e.touches[0].screenX - touchStart;

					speed.cur = delta * delta / 15 * (delta < 0 ? -1 : 1);

					scroll.add(-speed.cur);

					touchStart = e.touches[0].screenX;

					time.start = time.end;

				});

				slides.$src[0].addEventListener("touchstart", function(e) {

					//e.preventDefault();


				time.start = new Date().getTime();

					touchStart = e.touches[0].screenX;

					scroll.stop();

				});

			}

			var maxScroll = slides.width - windowWidth, minScroll = 0;

			scroll.add = function(delta) {

				if (scroll.cur + delta > maxScroll) {
					scroll.cur = maxScroll
				} else if (scroll.cur + delta < minScroll) {
					scroll.cur = minScroll;
				} else {
					scroll.cur += delta;
				}

				getScrollPositionAndAnimateEverything();
			}

			scroll.stop = function() {
				scroll.cur = slides.$src.scroll;
			}

			scroll.get = function() {
				return scroll.cur;
			}
		} else {

			var scrollTarget;

			if (!scrollbarFullyRemoved) {

				scroll.$src = $('<div/>').css({
					width : slides.width,
					height : '1px'
				});

				$('body').append(scroll.$src);

				scrollTarget = window;
			}

			scroll.get = function() {

				if (scrollbarFullyRemoved) {
					return scroll.cur;
				}

				return $(scrollTarget).scrollLeft();
			}

			scroll.add = function(delta) {

				if (scrollbarFullyRemoved) {

					var newScroll = scroll.cur + delta;

					if (newScroll < 0) {
						newScroll = 0;
					} else if (newScroll > scroll.maxLimit) {
						newScroll = scroll.maxLimit;
					}

					scroll.cur = newScroll;
					getScrollPositionAndAnimateEverything();
					return;
				}
				$(scrollTarget).scrollLeft($(scrollTarget).scrollLeft() + delta);
			}
			if (firstInit && !scrollbarFullyRemoved) {

				$(scrollTarget).on('scroll', getScrollPositionAndAnimateEverything);
			}
		}

		para_cached.add = scroll.add;

		para_cached.width = slides.width;
	}


	this.toSlide = function(index) {
		if (index > -1 && index < slides.array.length) {
			this.to(windowWidth * index);
		}
	}

	this.to = function(value) {
		scroll.add(value - scroll.get());
	}
	function closerGeneric(left) {
		var cur = scroll.get(), roun = left ? Math.floor : Math.ceil, curIndex = cur / slides.singleSlideWidth, dest = roun(cur / slides.singleSlideWidth);

		if (cur % slides.singleSlideWidth == 0) {
			dest += left ? (-1) : 1;
		}
		dest *= slides.singleSlideWidth;
		
		para_cached.to(dest);
	}


	this.closerLeft = function() {
		closerGeneric(true);
	}

	this.closerRight = function() {
		closerGeneric(false);
	}
	function CSS3setupAdjust(shiftProperty, $div) {

		var transiTrailer = scrollAnimationDuration + 'ms ease-in-out 1ms';

		if (shiftProperty == shiftPropertyTypes.LEFT) {

			transi = 'left ' + transiTrailer;

		} else if (shiftProperty == shiftPropertyTypes.TRANSLATE || shiftProperty == shiftPropertyTypes.TRANSLATEX || shiftProperty == shiftPropertyTypes.TRANSLATE3D) {

			transi = '-webkit-transform ' + transiTrailer;

		}

		$div.css({
			WebkitTransition : transi,
			MozTransition : transi,
			OTransition : transi,
			msTransition : transi,
			transition : transi
		});

	}

	function jqueryAnimateShift($div, value) {

		$div.stop(false).animate({
			left : value + 'px',
		}, scrollAnimationDuration, scrollEasing);
	}
	

	/* ÐžÐ±Ñ€Ð°Ñ‚Ð½Ñ‹Ðµ ÑÐ²ÑÐ·Ð¸ */

	var absScroll, relativeScroll;

	this.onResizeSlides = function() {

		absScroll = scroll.get();
		relativeScroll = absScroll / windowWidth;

		applyWindowSize();

	}

	this.onResizeLayers = function() {

		applyWindowSizeToParallaxLayers();

		refreshSlidesAndFireListeners();

		var newScroll = relativeScroll * windowWidth;

		straightScrollSwitch = true;

		scroll.add(newScroll - scroll.get());
	}
}

