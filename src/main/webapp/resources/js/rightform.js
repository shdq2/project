/**
 * 
 */
function w_resize() {
	if(width <= 690) {
		$('#img-panel').css('width', width);
		$('#filter').css('display', 'none');
		$('#register-form-login').css('height', '240px');
		$('#right-panel').css('position', 'absolute');
		$('#right-panel').css('width', '100%');
		$('.reg-btn').css('display', 'inline-block');
		$('.reg-a').removeAttr('href');
		$('.reg-a').css('color', 'gray');
		$('.reg-a').text('회원가입 버튼을 눌러 주세요!');
	} else {
		$('#img-panel').css('width', '100%');
		$('#filter').css('display', 'block');
		$('#filter').css('width', 'calc(100% - 475px)');
		$('.tmenu').css('left', '-270px');
		$('#register-form-login').css('height', '205px');
		$('#right-panel').css('position', 'relative');
		$('#right-panel').css('width', 475);
		$('#right-panel').css('left', '0px');
		$('.reg-btn').css('display', 'none');
		$('.reg-a').attr('href', 'register.do');
		$('.reg-a').css('color', '#d200ad');
		$('.reg-a').text('회원가입하기');
	}
}

$(function() {
	width = $(window).width();

	w_resize();
	
	$(window).resize(function(){
		width = $(window).width();
		
		w_resize();
	});
	
	$('#right-panel').click(function() {
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
		
		$('.tmenu').animate({left:'-270px'}, 300);
		$('#right-panel').animate({left:'0px'}, 300);
	});
});