/**
 * 
 */
function w_resize() {
	if(width <= 690) {
		$('#filter').css('display', 'none');
		$('#register-form-login').css('height', '240px');
		$('#right-panel').css('width', '100%');
		$('#img-panel').css('transition', 'transform 0.3s ease');
		$('.reg-btn').css('display', 'inline-block');
		$('.reg-a').removeAttr('href');
		$('.reg-a').css('color', 'gray');
		$('.reg-a').text('회원가입 버튼을 눌러 주세요!');
	} else {
		$('#filter').css('display', 'inline-block');
		$('#filter').css('width', 'calc(100% - 475px)');
		$('#register-form-login').css('height', '205px');
		$('#right-panel').css('width', 475);
		$('#right-panel').css('left', '0px');
		$('#img-panel').css('transition', 'transform 0s ease');
		$('.reg-btn').css('display', 'none');
		$('.reg-a').attr('href', 'register.do');
		$('.reg-a').css('color', '#d200ad');
		$('.reg-a').text('회원가입하기');
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('#img-panel').css('transform', 'translateX(0px)');
	}
}

$(function() {
	width = $(window).width();

	w_resize();

	$(window).resize(function(){
		width = $(window).width();
		w_resize();
	});
	
	$('#img-panel').click(function() {
		var str = $('.topbar-menu').css('background-image');
		str = str.replace(/topbar_cancel.png/gi, 'topbar_menu.png');			
		$('.topbar-menu').css('background-image', str);
		
		$('.tmenu').css('transform', 'translateX(-270px)');
		$('#img-panel').css('transform', 'translateX(0px)');
	});
});