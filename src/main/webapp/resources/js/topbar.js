function topbar_view() {
	if(width <= 768) {
		$('.topbar-menu').css('display', 'inline-block');
		$('.topbar-menu').css('width', '40px');
		$('.topbar-menu').css('height', '40px');
		$('.topbar-bmenu').css('width', '40px');
		$('.topbar-bmenu').css('height', '40px');
		
		$('.tmenu').css('visibility', 'visible');
		$('.tmenu').css('transition', 'transform 0.3s ease');
		
		$('.topbar-menu').css('position', 'absolute');
		$('.topbar-menu').css('left', '5%');
		$('.topbar-menu').css('transform', 'translateX(-50%)');
		
		$('.topbar-logo').css('position', 'absolute');
		$('.topbar-logo').css('left', '50%');
		$('.topbar-logo').css('transform', 'translateX(-50%)');
		
		$('.topbar-buttons').css('display', 'none');
	} else {
		$('.topbar-menu').css('display', 'none');
		
		$('.tmenu').css('visibility', 'hidden');
		$('.tmenu').css('transition', 'transform 0s ease');
		
		$('.topbar-logo').css('position', 'relative');
		$('.topbar-logo').css('left', '0%');
		$('.topbar-logo').css('transform', 'translateX(0%)');
		
		$('.topbar-buttons').css('display', 'inline');
		
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
	}
}

function scrollbar() {
	var size = 0;	
	
	size = 0;
	size = $('#register-box').outerHeight();
	
	if(height < size) {
		$('#register-box').css('overflow-y', 'scroll');
	} else {
		$('#register-box').css('overflow-y', 'hidden');
	}
}

$(function() {
	width = $(window).width();
	height = $(window).height();
	
	scrollbar();
	topbar_view();
	
	$(window).resize(function(){
		width = $(window).width();
		height = $(window).height();

		scrollbar();
		topbar_view();
	});
});