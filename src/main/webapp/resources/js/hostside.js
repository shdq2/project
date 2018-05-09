$(function() {
	if($('#confirm_name').val() == 1){
		$('#name_icon').css('color','#A50D73');
	}
	if($('#confirm_basic').val() == 1){
		$('#basic_icon').css('color','#A50D73');
	}
	if($('#confirm_location').val() == 1){
		$('#location_icon').css('color','#A50D73');
	}
	if($('#confirm_amenity').val() == 1){
		$('#amenity_icon').css('color','#A50D73');
	}
	if($('#confirm_img').val() == 1){
		$('#img_icon').css('color','#A50D73');
	}
	if($('#confirm_price').val() == 1){
		$('#price_icon').css('color','#A50D73');
	}
	if($('#confirm_inout').val() == 1){
		$('#inout_icon').css('color','#A50D73');
	}
	
	/*$('.btn_next').click(function(){
		alert('a');
		var color1 = $('#name_icon').css('color');
		var color2 = $('#basic_icon').css('color');
		var color3 = $('#location_icon').css('color');
		var color4 = $('#amenity_icon').css('color');
		var color5 = $('#img_icon').css('color');
		var color6 = $('#price_icon').css('color');
		var color7 = $('#inout_icon').css('color');
		
		if(color1 == '#A50D73' && color2 == '#A50D73' && color3 == '#A50D73' && color4 == '#A50D73'&& color5 == '#A50D73'&& color6 == '#A50D73'&& color7 == '#A50D73'){
			alert('b');
			window.location="host_block.do";
		}else{
			alert('c');
			$('#form').submit();
		}
	})
	$('#btn_next_price').click(function(){
		alert('a');
		var color1 = $('#name_icon').css('color');
		var color2 = $('#basic_icon').css('color');
		var color3 = $('#location_icon').css('color');
		var color4 = $('#amenity_icon').css('color');
		var color5 = $('#img_icon').css('color');
		var color6 = $('#price_icon').css('color');
		var color7 = $('#inout_icon').css('color');
		
		alert(color1);
		
		if(color1 == '#A50D73' && color2 == '#A50D73' && color3 == '#A50D73' && color4 == '#A50D73'&& color5 == '#A50D73'&& color6 == '#A50D73'&& color7 == '#A50D73'){
			window.location="host_block.do";
		}else{
			 window.location="host_price_next.do";
		}
	})*/
	
});