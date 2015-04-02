// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready;
ready = function() {
	// On click show our hide learn moments
	showOurHideLearnMoments()
	
	$('#js-log-date').datepicker({
		dateFormat: 'dd/mm/yy'
	});
	
	if($('.learnmoment-detail').find('img').length > 0) {
		setMaxWidthOnImage()
	}
	
	if($('body').find('.js-user-image').length > 0) {
		scaleImage();
	}

	var documentWidth = $(document).width()
	if(documentWidth > 1000) {
		$('header, .top-nav').addClass('js-width')
	}

	$('.notice, .alert').delay(2000).fadeOut('slow');
	
};

function setMaxWidthOnImage() {
	var el = $('.learnmoment-detail').find('img')
	var elWidth = el.get(0).naturalWidth;
	var elHeight = el.get(0).naturalHeight;
	
	$(el).css({
		maxWidth: elWidth + 'px',
		maxHeight: elHeight + 'px'
	});
	console.log(elWidth, elHeight);
}

function scaleImage() {
	$('.js-user-image').find('img').each(function () {
		var widthImg = $(this).width();
		var heightImg = $(this).height();
		if (widthImg > 100 && heightImg > 100) {
			if (widthImg < heightImg) {
				$(this).width('100px');
	 		} else {
	 			$(this).height('100px');
	 		}
		}
	}); 
}

function showOurHideLearnMoments() {
	$('.js-show').on('click', function(e) {
		e.preventDefault();
		var learnMoment = $(this).parent().find('.learn-moments');
		
		$(learnMoment).toggleClass('show');
		$(this).toggleClass('active');
		
		if ($(this).hasClass('active')) {
			$(this).text('Hide learn moments')
		} else {
			$(this).text('Show learn moments')
		}
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);
//$(window).load(ready)