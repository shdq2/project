function w_resize() {
	var p_w = $('.user-hope').css('width');
	var l_w = $('.hope-img').css('width');
	var ph_w = $('.photo').css('width');
	$('.user-hope').css('height',p_w);
	$('.user-hope-list img').css('height',l_w);
	$('.photo').css('height',ph_w+50);
	if(width <= 768) {
		$('.hope-container').css('padding', '0px');
		$('.hope-nav').css('display', 'none');
		$('.hope-main').css('width', '100%');
		$('.hope-main').css('left', '0%');
		$('.hope-main').css('border-left', '0px');
		$('.col-main').removeClass('col-xs-9').addClass('col-xs-12');
		$('.col-img').removeClass('col-xs-3').addClass('col-xs-12');
		$('.hope-container').css('transition', 'transform 0.3s ease');
		
	} else {
		$('.hope-container').css('padding', '0px 0px 0px 15px');
		$('.hope-nav').css('display', 'inline-block');
		$('.hope-main').css('width', 'calc(100% - 220px)');
		$('.hope-main').css('left', '220px');
		$('.hope-main').css('border-left', '1px solid #f2f2f2');
		$('.col-main').removeClass('col-xs-12').addClass('col-xs-9');
		$('.col-img').removeClass('col-xs-12').addClass('col-xs-3');
		$('.hope-container').css('transition', 'transform 0s ease');
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('.hope-container').css('transform', 'translateX(0px)');
		
		$('.user-hope-list').css('height','');
	}
	if(width>=992){
		
	}

}

$(function() {
	width = $(window).width();
	height = $(window).height();


	scrollbar();
	w_resize();
	var p_w = $('.user-hope').css('width');
	var l_w = $('.hope-img').css('width');
	var ph_w = $('.photo').css('width');
	$('.user-hope').css('height',p_w);
	$('.user-hope-list img').css('height',l_w);
	$('.photo').css('height',ph_w+50);
	$(window).resize(function(){
		
		width = $(window).width();
		height = $(window).height();
		
		scrollbar();
		w_resize();

	});
	
	$('.hope-container').click(function() {
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('.hope-container').css('transform', 'translateX(0px)');
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
			$('.hope-container').css('transform', 'translateX(270px)');
		}
		
		if(box == 'topbar_cancel.png")') {
			str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
			$('.topbar-menu').css('background-image', str);
			
			$('.tmenu').css('transform', 'translateX(-270px)');
			$('.hope-container').css('transform', 'translateX(0px)');	
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

	var size = 0;
	var height = $(window).height();
	size = $('.topbar').outerHeight() + $('.custom-box.unlock').outerHeight() + $('.custom-box.lock').outerHeight() + $('.tmenu-list').outerHeight() + $('.tmenu-2').outerHeight();

	if(height < size) {
		$('.tmenu').css('overflow-y', 'scroll');
	} else {
		$('.tmenu').css('overflow-y', 'hidden');
	}
	
	return r;
}