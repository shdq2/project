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
				var block = data1[i].room_block;
				$('.room_table tbody').append(
					'<tr class="rlist">'+
						'<td>'+(data1[i].room_count)+'</td>'+
						'<td>'+data1[i].room_name+'</td>'+
						'<td>'+numberformat(data1[i].room_day)+' 원</td>'+
						'<td><input type="button" value="날짜 선택"></td>'+
						'<td>'+
						'<select class="room_state form-control" style="width:100px;">'+
							'<option value="0">비공개</option>'+
							'<option value="1">미완성</option>'+
							'<option value="2">공개</option>'+
						'</select> '+
						'</td>'+
					'</tr>'
				);
				
				$('.room_state').eq(i).val(block).attr("selected","true");
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
					'<td>'+data1[i].reser_count+'</td>'+
					'<td>'+data1[i].room_name+'</td>'+
					'<td>'+data1[i].reservation_start+' ~ '+data1[i].reservation_end+' ( '+data1[i].reser_day+'박'+(data1[i].reser_day+1)+' 일 )</td>'+
					'<td>'+data1[i].reser_title+'</td>'+
					'<td>리뷰 작성 미완료</td>'+
				'</tr>'
			);
		}
	},'json');
}

function hope_paging(page,id){
	$('.hope_table tbody').empty();
	$.get('Json_member_hope.do?page='+page+'&id='+id,function(data){
		console.log(data);
		var p = data.page;
		if(page == 1){
			$('.hope_left').addClass("disabled");
			$('.hope_left').removeClass("hope_left_btn");
			$('.hope_right').removeClass("disabled");
			$('.hope_right').addClass("hope_right_btn");
			
		}else if(p == page){
			$('.hope_left').removeClass("disabled");
			$('.hope_left').addClass("hope_left_btn");
			$('.hope_right').addClass("disabled");
			$('.hope_right').removeClass("hope_right_btn");
		}else{
			$('.hope_right').addClass("hope_right_btn");
			$('.hope_left').addClass("hope_left_btn");
			$('.hope_right').removeClass("disabled");
			$('.hope_left').removeClass("disabled");
		}
		var data1 = data.data
		var length = data1.length;
		for(var i = 0; i<length;i++){
			var block = data1[i].room_block;
			$('.hope_table tbody').append(
				'<tr class="hlist">'+
					'<td>'+data1[i].room_name+'</td>'+
					'<td>'+data1[i].room_min_day+' 일 / '+data1[i].room_max_day+' 일</td>'+
					'<td>'+data1[i].custom_name+'</td>'+
					'<td>'+numberformat(data1[i].room_day)+' 원</td>'+
				'</tr>	'
			);			
		}
	},'json');
}
