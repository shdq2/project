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

$(function() {
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
			$('#img-panel').css('transform', 'translateX(270px)');
		}
		
		if(box == 'topbar_cancel.png")') {
			str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
			$('.topbar-menu').css('background-image', str);
			
			$('.tmenu').css('transform', 'translateX(-270px)');
			$('#img-panel').css('transform', 'translateX(0px)');	
		}
	});
});