function w_resize() {
	if(width <= 768) {
		$('#col-main').css('display', 'none');
		$('#col-map').removeClass('col-xs-5').addClass('col-xs-12');
		$('.profile-container').css('transition', 'transform 0.3s ease');
	} else {
		$('#col-main').css('display', 'inline-block');
		$('#col-map').removeClass('col-xs-12').addClass('col-xs-5');
		$('.profile-container').css('transition', 'transform 0s ease');
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('.profile-container').css('transform', 'translateX(0px)');
	}
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
	
	$('.profile-container').click(function(e) {
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('.profile-container').css('transform', 'translateX(0px)');
	});
	
	var a_id = [document.getElementById("Acc1"), document.getElementById("Acc2"), document.getElementById("Acc3"), document.getElementById("Acc4")];
	var c_id = [document.getElementById("cursor1"), document.getElementById("cursor2"), document.getElementById("cursor3"), document.getElementById("cursor4")];
	var save_open_menu = -1;
	var active = 0;
	
	$(document).on('mouseover', '.heart-icon', function(e) {
		var index = $('.heart-icon').index(this);
		$('.heart-icon i:eq('+ index +')').removeClass('glyphicon glyphicon-heart-empty');
		$('.heart-icon i:eq('+ index +')').addClass('glyphicon glyphicon-heart');
	});
	
	$(document).on('mouseleave', '.heart-icon', function(e) {
		var index = $('.heart-icon').index(this);
		$('.heart-icon i:eq('+ index +')').removeClass('glyphicon glyphicon-heart');
		$('.heart-icon i:eq('+ index +')').addClass('glyphicon glyphicon-heart-empty');
	});
	
	var z_index = 0;
	
	$(document).on('mouseover', '.room-item', function(e) {
		var index = $('.room-item').index(this);
		$('.marker[data-marker_id~='+ active +']').css('background-image', 'url("/project/resources/imgs/price_marker.png")');
		$('#marker-detail').remove();
		
		$('.marker[data-marker_id~='+ index +']').css('background-image', 'url("/project/resources/imgs/price_marker_mouse_on.png")');
		
		z_index = $('.marker[data-marker_id~='+ index +']').css('z-index');
		$('.marker[data-marker_id~='+ index +']').css('z-index', 999);
		
		var top = Number($('.marker[data-marker_id~='+ index +']').css('top').replace("px", ""));
		var left = Number($('.marker[data-marker_id~='+ index +']').css('left').replace("px", ""));
		
		$('.marker').parent('div').append('<div id="marker-detail" data-marker_id="'+index+'" style="top: '+(top-157)+'px; left:'+(left-45)+'px;">'+
				'<img id="mdetail-img" src="'+$('.room-item[data-marker_id~='+ index +'] .room-img').attr('src')+'" />'+
				'<p id="mdetail-p">'+ $('.room-item[data-marker_id~='+ index +'] .room-name').html() +'</p></div>');
	});
	
	$(document).on('mouseout', '.room-item', function(e) {
		var index = $('.room-item').index(this);
		active = index;
		
		$('.marker[data-marker_id~='+ index +']').css('background-image', 'url("/project/resources/imgs/price_marker.png")');
		
		$('.marker[data-marker_id~='+ index +']').css('z-index', z_index);
		z_index = 0;
		
		$('#marker-detail').remove();
	});
	
	$(document).on('click', '.marker', function(e) {
		e.stopPropagation();
		
		var index = $('.marker').index(this) + 1;
		$('.marker[data-marker_id~='+ active +']').css('background-image', 'url("/project/resources/imgs/price_marker.png")');
		$('#marker-detail').remove();

		active = index;
		$('.marker[data-marker_id~='+ index +']').css('background-image', 'url("/project/resources/imgs/price_marker_mouse_on.png")');
		
		z_index = $('.marker[data-marker_id~='+ index +']').css('z-index');
		$('.marker[data-marker_id~='+ index +']').css('z-index', 999);
		
		var top = Number($('.marker[data-marker_id~='+ index +']').css('top').replace("px", ""));
		var left = Number($('.marker[data-marker_id~='+ index +']').css('left').replace("px", ""));
		
		$('.marker').parent('div').append('<div id="marker-detail" data-marker_id="'+index+'">'+
				'<img id="mdetail-img" src="'+$('.room-item[data-marker_id~='+ index +'] .room-img').attr('src')+'" />'+
				'<p id="mdetail-p">'+ $('.room-item[data-marker_id~='+ index +'] .room-name').html() +'</p></div>');
		$('#marker-detail').css('top', (top-157)+'px');
		$('#marker-detail').css('left', (left-45)+'px');		
	});
	
	$(document).on('click', '#col-map', function(e) {
		e.stopPropagation();
		
		$('.marker[data-marker_id~='+ active +']').css('background-image', 'url("/project/resources/imgs/price_marker.png")');
		$('#marker-detail').remove();
	});
	
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
	
	$('#more-1').click(function () {
		var id = document.getElementById("div-more-1");

		if($('#div-more-1').attr('class') == 'w3-hide') {
			id.className = id.className.replace("w3-hide", "w3-show");
			$('#more-1').text('▲숨기기');
			$('#more-1').css('text-decoration', 'none');
		} else {
			id.className = id.className.replace("w3-show", "w3-hide");
			$('#more-1').text('▼더보기');
			$('#more-1').css('text-decoration', 'none');
		}
	});

	$('#more-2').click(function () {
		var id = document.getElementById("div-more-2");

		if($('#div-more-2').attr('class') == 'w3-hide') {
			id.className = id.className.replace("w3-hide", "w3-show");
			$('#more-2').text('▲숨기기');
			$('#more-2').css('text-decoration', 'none');
		} else {
			id.className = id.className.replace("w3-show", "w3-hide");
			$('#more-2').text('▼더보기');
			$('#more-2').css('text-decoration', 'none');
		}
	});
	
	var nonLinearSlider = document.getElementById('slider-range');

	noUiSlider.create(nonLinearSlider, {
		connect: true,
		behaviour: 'tap',
		start: [ 0, 3000000 ],
		range: {
			// Starting at 500, step the value by 500,
			// until 4000 is reached. From there, step by 1000.
			'min': [ 0, 100 ],
			'40%': [ 100000, 1000 ],
			'70%': [ 1000000, 100000 ],
			'max': [ 3000000 ]
		}
	});
	
	var nodes = [
		document.getElementById('a-1'), // 0
		document.getElementById('a-2')  // 1
	];

	nonLinearSlider.noUiSlider.on('update', function ( values, handle, unencoded, isTap, positions ) {
		nodes[handle].innerHTML = '￦' + numberWithCommas(parseInt(values[handle]));
		
		if(values[handle] == 3000000 && handle != 0)
			nodes[handle].innerHTML += '+';
	});
	
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

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