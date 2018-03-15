function w_resize() {
	if(width <= 690) {
		/*$('.topbar-menu').css('display', 'inline-block');
		$('.topbar-menu').css('width', '40px');
		$('.topbar-menu').css('height', '40px');
		$('.topbar-bmenu').css('width', '40px');
		$('.topbar-bmenu').css('height', '40px');
		
		$('.tmenu').css('visibility', 'visible');
		$('.tmenu').css('transition', 'transform 0.3s ease');
		$('#img-panel').css('transition', 'transform 0.3s ease');
		
		$('.topbar-menu').css('position', 'absolute');
		$('.topbar-menu').css('left', '5%');
		$('.topbar-menu').css('transform', 'translateX(-50%)');
		
		$('.topbar-logo').css('position', 'absolute');
		$('.topbar-logo').css('left', '50%');
		$('.topbar-logo').css('transform', 'translateX(-50%)');
		
		$('.topbar-buttons').css('display', 'none');*/	
		console.log('width: '+width);
		$('.profile-container').css('padding', '0px');
		$('.profile-nav').css('display', 'none');
		$('.profile-main').css('width', '100%');
		$('.col-main').removeClass('col-xs-9').addClass('col-xs-12');
		$('.col-img').removeClass('col-xs-3').addClass('col-xs-12');
		$('.profile-container').css('transition', 'transform 0.3s ease');
	} else {
		/*$('.topbar-menu').css('display', 'none');
		
		$('.tmenu').css('visibility', 'hidden');
		$('.tmenu').css('transition', 'transform 0s ease');
		$('#img-panel').css('transition', 'transform 0s ease');
		
		$('.topbar-logo').css('position', 'relative');
		$('.topbar-logo').css('left', '0%');
		$('.topbar-logo').css('transform', 'translateX(0%)');
		
		$('.topbar-buttons').css('display', 'inline');
		
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);*/
		console.log('width: '+width);
		$('.profile-container').css('padding', '0px 15px 0px 15px');
		$('.profile-nav').css('display', 'inline-block');
		$('.profile-main').css('width', 'calc(100% - 220px)');
		$('.col-main').removeClass('col-xs-12').addClass('col-xs-9');
		$('.col-img').removeClass('col-xs-12').addClass('col-xs-3');
		$('.profile-container').css('transition', 'transform 0s ease');
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('.profile-container').css('transform', 'translateX(0px)');
	}
}

function scrollbar() {
	/*var size = 0;
	
	console.log('register : ' + size);
	console.log('window : ' + height);
	console.log('topbar : ' + $('.topbar').outerHeight() + ', unlock : ' + $('.custom-box.unlock').outerHeight() + ', lock : ' + $('.custom-box.lock').outerHeight() + ', list : ' + $('.tmenu-list').outerHeight() + ', tmenu-2 : ' + $('.tmenu-2').outerHeight());
	
	size = $('.topbar').outerHeight() + $('.custom-box.unlock').outerHeight() + $('.custom-box.lock').outerHeight() + $('.tmenu-list').outerHeight() + $('.tmenu-2').outerHeight();
	console.log('size : ' + size);
	if(height < size) {
		$('.tmenu').css('overflow-y', 'scroll');
	} else {
		$('.tmenu').css('overflow-y', 'hidden');
	}
	
	size = 0;
	size = $('#register-box').outerHeight();
	
	if(height < size) {
		$('#register-box').css('overflow-y', 'scroll');
	} else {
		$('#register-box').css('overflow-y', 'hidden');
	}*/
}

$(function() {
	width = $(window).width();
	height = $(window).height();
	
	scrollbar();
	w_resize();
	
	$(window).resize(function(){
		width = $(window).width();
		height = $(window).height();

		scrollbar();
		w_resize();
	});
	
	$('.profile-container').click(function() {
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('.profile-container').css('transform', 'translateX(0px)');
	});
	
	var a_id = [document.getElementById("Acc1"), document.getElementById("Acc2"), document.getElementById("Acc3"), document.getElementById("Acc4")];
	var c_id = [document.getElementById("cursor1"), document.getElementById("cursor2"), document.getElementById("cursor3"), document.getElementById("cursor4")];
	var save_open_menu = -1;
	
	$('#list-item1').click(function() {	    
		save_open_menu = myAccFunc(a_id, c_id, 0, save_open_menu);
	});
	
	$('#list-item2').click(function() {
		save_open_menu = myAccFunc(a_id, c_id, 1, save_open_menu);
	});
	
	$('#list-item3').click(function() {	    
		save_open_menu = myAccFunc(a_id, c_id, 2, save_open_menu);
	});
	
	$('#list-item4').click(function() {	    
		save_open_menu = myAccFunc(a_id, c_id, 3, save_open_menu);
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

			$('.tmenu').css('transform', 'translateX(0px)');
			$('.profile-container').css('transform', 'translateX(270px)');
		}
		
		if(box == 'topbar_cancel.png")') {
			str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
			$('.topbar-menu').css('background-image', str);
			
			$('.tmenu').css('transform', 'translateX(-270px)');
			$('.profile-container').css('transform', 'translateX(0px)');	
		}
	});
});

function myAccFunc(x, c, n, s) {
	var r = -1;
	var size = 0;

	for(var i=0; i<4; i++) {
		if(i == s) {
			c[i].className = c[i].className.replace(" glyphicon-menu-down", " glyphicon-menu-right");
			x[i].className = x[i].className.replace(" w3-show", "");
	        x[i].previousElementSibling.className = 
	        x[i].previousElementSibling.className.replace(" w3-green", "");
	        
	        size = 0;
	        if(s == n) {
	        	break;
	        }
		}
		if(i == n) {
			c[i].className = c[i].className.replace(" glyphicon-menu-right", " glyphicon-menu-down");
			x[i].className += " w3-show";
	        x[i].previousElementSibling.className += " w3-green";
	        
	        size = $(x[i]).css('height');
	        
	        r = i;
		}
	}

	$('body').css('height', 'calc(100% + ' + size);
	console.log('body : ' + $('body').height());
	scrollbar();
	
	return r;
}