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

	var documentWidth = $(document).width()
	if(documentWidth < 1000) {
		$('header, .top-nav').removeClass('js-width')
	}

	// Notice, fail
	$('.notice').delay(4000).fadeOut('slow')
	
	$('.notice').addClass('js-move')


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