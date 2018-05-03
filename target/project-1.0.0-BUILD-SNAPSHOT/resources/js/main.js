function wish_view() {
	if(width <= 991) {
		$('.input-request').css('', '');
		$('.wish-left').css('margin', 'auto');
	} else {
		$('.wish-left').css('height', '560px');
		$('.wish-left').css('padding', '0px 45px 52px 45px');
	}
}


$(function() {
	width = $(window).width();
	height = $(window).height();
	
	wish_view();
	
	$(window).resize(function(){
		width = $(window).width();
		height = $(window).height();

		wish_view();
	});
});