	function room_paging(page,id){
		$('.room_table tbody').empty();
		$.get('Json_member_room.do?page='+page+'&id='+id,function(data){
			var p = data.page;
			if(page == 1){
				$('.room_left').addClass("disabled");
				$('.room_left').removeClass("left_btn");
				$('.room_right').removeClass("disabled");
				$('.room_right').addClass("right_btn");
				
			}else if(p == page){
				$('.room_left').removeClass("disabled");
				$('.room_left').addClass("left_btn");
				$('.room_right').addClass("disabled");
				$('.room_right').removeClass("right_btn");
			}else{
				$('.room_right').addClass("right_btn");
				$('.room_left').addClass("left_btn");
				$('.room_right').removeClass("disabled");
				$('.room_left').removeClass("disabled");
			}
			var data1 = data.data
			var length = data1.length;
			for(var i = 0; i<length;i++){
				$('.room_table tbody').append(
					'<tr class="rlist">'+
						'<td>'+(data1[i].room_code-111110)+'</td>'+
						'<td>'+data1[i].room_name+'</td>'+
						'<td>'+data1[i].room_price+'</td>'+
						'<td><input type="button" value="날짜 선택"></td>'+
						'<td></td>'+
					'</tr>'
				);
			}
		},'json');
	}

function travel_paging(page,id){
	$('.travel_table tbody').empty();
	$.get('Json_member_travel.do?page='+page+'&id='+id,function(data){
		var p = data.page;
		if(page == 1){
			$('.travel_left').addClass("disabled");
			$('.travel_left').removeClass("travel_left_btn");
			$('.travel_right').removeClass("disabled");
			$('.travel_right').addClass("travel_right_btn");
		}else if(p == page){
			$('.travel_right').addClass("disabled");
			$('.travel_right').removeClass("travel_right_btn");
			$('.travel_left').removeClass("disabled");
			$('.travel_left').addClass("travel_left_btn");
		}else{
			$('.travel_right').addClass("travel_right_btn");
			$('.travel_left').addClass("travel_left_btn");
			$('.travel_right').removeClass("disabled");
			$('.travel_left').removeClass("disabled");
		}
		var data1 = data.data
		var length = data1.length;
		for(var i = 0; i<length;i++){
			$('.travel_table tbody').append(
				'<tr class="tlist">'+
					'<td>'+data1[i].reservation_code+'</td>'+
					'<td>'+data1[i].room_name+'</td>'+
					'<td>'+data1[i].reservation_start+' ~ '+data1[i].reservation_end+' ( '+data1[i].reser_day+'박'+(data1[i].reser_day+1)+' 일 )</td>'+
					'<td>'+data1[i].reser_title+'</td>'+
					'<td>리뷰 작성 미완료</td>'+
				'</tr>'
			);
		}
	},'json');
}