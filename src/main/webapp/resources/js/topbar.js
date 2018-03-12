/**
 * 
 */
function topbar_view() {
	if(width <= 690) {		
		$('.topbar').css('width', width);
		$('.topbar-menu').css('display', 'inline-block');
		$('.topbar-menu').css('width', '40px');
		$('.topbar-menu').css('height', '40px');
		$('.topbar-bmenu').css('display', 'inline-block');
		$('.topbar-bmenu').css('width', '40px');
		$('.topbar-bmenu').css('height', '40px');
		
		$('.topbar-logo').css('position', 'absolute');
		$('.topbar-logo').css('left', '50%');
		$('.topbar-logo').css('transform', 'translateX(-50%)');
		
		$('.tmenu').css('display', 'inline-block');
		
		$('.topbar-buttons').css('display', 'none');
	} else {
		$('.topbar').css('width', '100%');
		$('.topbar-menu').css('display', 'none');
		$('.topbar-bmenu').css('display', 'none');
		
		$('.topbar-logo').css('position', 'relative');
		$('.topbar-logo').css('left', '0%');
		$('.topbar-logo').css('transform', 'translateX(0%)');
		
		$('.tmenu').css('display', 'none');
		
		$('.topbar-buttons').css('display', 'inline');
		
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
	}
}

function scrollbar() {
	if(height < 750) {
		$('body').css('overflow', 'scroll');
	} else {
		$('body').css('overflow', 'hidden');
	}
}

$(function() {
	width = $(window).width();
	height = $(window).height();
	topbar_view();
	
	$(window).resize(function(){
		width = $(window).width();
		height = $(window).height();
		
		scrollbar();
		topbar_view();
	});
	
	
	
	$('.topbar-menu').click(function() {
		var str = $('.topbar-menu').css('background-image');
		var root = str.split('/');
		var box = '';
		
		for(var i=0; i<root.length; i++) {
			box = root[i];
		}
		
		if(box == 'topbar_menu.png")') {
			str = str.replace(/topbar_menu.png/gi, 'topbar_cancel.png');
			$('.topbar-menu').css('background-image', str);

			$('.tmenu').animate({left:'0px'}, 300);
			$('#right-panel').animate({left:'270px'}, 300);
		}
		
		if(box == 'topbar_cancel.png")') {
			str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
			$('.topbar-menu').css('background-image', str);
			
			$('.tmenu').animate({left:'-270px'}, 300);
			$('#right-panel').animate({left:'0px'}, 300);			
		}
	});
});