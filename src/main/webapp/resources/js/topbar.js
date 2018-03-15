/**
 * 
 */

function myAccFunc(x, c, n, s) {
	var r = -1;
	console.log(x + ' ' + n + ' ' + s);
	for(var i=0; i<4; i++) {
		if(i == s) {
			c[i].className = c[i].className.replace(" glyphicon-menu-down", " glyphicon-menu-right");
			x[i].className = x[i].className.replace(" w3-show", "");
	        x[i].previousElementSibling.className = 
	        x[i].previousElementSibling.className.replace(" w3-green", "");
	        
	        if(s == n) {
	        	break;
	        }
		}
		if(i == n) {
			c[i].className = c[i].className.replace(" glyphicon-menu-right", " glyphicon-menu-down");
			x[i].className += " w3-show";
	        x[i].previousElementSibling.className += " w3-green";
	        
	        r = i;
		}
	}
	
	return r;
}

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