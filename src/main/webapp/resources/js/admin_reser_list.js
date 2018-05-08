var tot=0;
function reser_list(state,page){
	$.post('Json_reser_list.do',{"state":state,"page":page},function(d){
		var data = d.list;
		tot = d.tot;
		var leng = data.length; 
		destroy_page(state);
		$('.reser_list').empty();
		for(var i=0;i<leng;i++){
			
			$('.reser_list').append(
					'<div class="reser_item">'+
					'<div class="reser_profile">'+
					'<input type="hidden" class="reser_num" value="'+data[i].reservation_code+'" />'+
					'<input type="hidden" class="reser_guest_id" value="'+data[i].guest_id+'" />'+
					'<input type="hidden" class="reser_host_id" value="'+data[i].host_id+'" />'+
					'<input type="hidden" class="reser_room_code" value="'+data[i].room_code+'" />'+
					'<input type="hidden" class="reser_code" value="'+data[i].reser_code+'" />'+
						'<img src="admin_show_profile.do?id='+data[i].host_id+'" class="reser_img"/>'+
						data[i].host_name+
					'</div>'+
					'<div class="reser_profile">'+
						'<img src="admin_show_profile.do?id='+data[i].guest_id+'" class="reser_img"/>'+
						data[i].guest_name+
					'</div>'+
					'<div class="reser_content">'+
						'<p>'+data[i].room_name+'<br />'+
						data[i].reservation_start+ '~'+ data[i].reservation_end+ ' ( '+ data[i].reser_day+'박'+ (data[i].reser_day+1)+'일 )</p>'+
					'</div>'+
					'<div class="reser_payment">'+
						'<div style="width:50%;text-align: right">'+
							'<label class="reser_title">'+data[i].reser_title+'</label> <br />'+
							numberformat(data[i].room_day*data[i].reser_day)+'원<br />'+
							numberformat(data[i].room_day*data[i].reser_day*0.1)+'원<br />'+
					 	'</div>'+
					 	'<div>'+
					 	'</div>'+
					'</div>'+
					'<div class="show_detail">'+
						'<span class="glyphicon glyphicon-chevron-down" ></span>'+
					'</div>'+
					'<div class="detail">'+
						'<ul >'+
							'<li class="active reser_btn" >예약 정보</li>'+
							'<li class="host_btn">호스트 정보</li>'+
							'<li class="guest_btn">게스트 정보</li>'+
						'</ul>'+
						'<div class="detail_content" style="width:100%;height:170px;">'+
							'<div class="img-div">'+
								'<img src="admin_room_img.do?id='+data[i].room_code+'"/>'+
							'</div>'+
							'<div style="float:left" class="detail_infomation" style="">'+
								'<table class="table table-reser" style="height:205px; margin:0px;">'+
									'<tr>'+
									'<th>숙소명</th>'+
									'<td class="room_name">'+data[i].room_name+'</td>'+
									'<th>인원</th>'+
									'<td><label class="reservation_people">'+data[i].reservation_people+'</label> 명</td>'+
									'</tr>'+
									'<tr>'+ 
										'<th>입실일</th>'+
										'<td><label class="reser_start">'+data[i].reservation_start+'</label> ( <label class="reser_start_day" >'+data[i].dayofweek_start+' </label> )</td>'+
										'<th>총 결제 금액</th>'+
										'<td>'+
										'<label class="reser_total">'+
										numberformat(data[i].room_day*data[i].reser_day)+'원'+
										'</label> <br />'+
										'( 1박당 가격 : <label class="room_day">'+numberformat(data[i].room_day)+' 원</label> / 숙박일수 : <label class="reser_day">'+data[i].reser_day+'</label>박 )'+
										'</td>'+
									'</tr>'+
									'<tr>'+
										'<th>퇴실일</th>'+
										'<td><label class="reser_end">'+data[i].reservation_end+'</label> ( <label class="reser_end_day"> '+data[i].dayofweek_end+'</label> )</td>'+
										'<th>예약금</th>'+
										'<td>'+
										'<label class="reser_price">'+numberformat(data[i].room_day*data[i].reser_day*0.1)+' 원</label><br />'+
										'( 총 결제 금액의 10% )'+
										'</td>'+
									'</tr>'+
								'</table>'+
								
								'<table class="table table_member" style="height:205px;">'+
									'<tr>'+
										'<th >성명</th>'+
										'<td class="name">홍길동</td>'+
										'<th>아이디</th>'+
										'<td class="custom_id">부산</td>									</td>'+ 
									'</tr>'+
									'<tr> '+
										'<th >전화번호</th>'+
										'<td class="phone">'+data[i].custom_phone+										
										'<th class="bank">이용횟수</th>'+
										'<td class="using">0</td>'+
									'</tr>'+
									'<tr>'+
										'<th colspan="2" style="width:50%"><a href="admin_member_detail.do?id='+data[i].host_id+'" class="form-control member_info">회원 정보 보기</a></th>'+									
										'<th colspan="2" style="width:50%">'+
										'<a href="admin_room.do?id='+data[i].host_id+'" class="form-control">등록된 다른 숙소 보기</a>'+
										'</th>'+
									'</tr>'+
								'</table>'+
							'</div>'+			
							'<div style="float:right">'+
								'<input type="button" id="request_'+i+'" value="예약신청" class="request btn btn-default btn_state" />'+
								'<input type="button" id="payment_'+i+'" value="결제진행중"  class="payment btn btn-default btn_state"/>'+
								'<input type="button" id="request_finish_'+i+'" value="예약완료"  class="request_finish btn btn-default btn_state"/>'+
								'<input type="button" id="travel_'+i+'" value="여행중"  class="travel btn btn-default btn_state" />'+
								'<input type="button" id="finish_'+i+'" value="여행완료"  class="finish btn btn-default btn_state" />'+
								'<input type="button" id="cancel_'+i+'" value="취소"  class="cancel btn btn-default btn_state" />'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>	');
			if(data[i].dayofweek_start == '토' || data[i].dayofweek_end=='토'){
				$('.reser_start_day').eq(i).css('color','blue');
			}
			else if(data[i].dayofweek_start== '일' || data[i].dayofweek_end=='일'){
				$('.reser_start_day').eq(i).css('color','red');
			}		
			
			if(data[i].reser_code == 0){						
				$('.request').eq(i).attr('disabled',true).css('border','1px solid #ccc').css('background-color','#ccc').css('color','black');;				
			}
			else if(data[i].reser_code == 1){						
				$('.payment').eq(i).attr('disabled',true).css('border','1px solid #eee236').css('background-color','#eee236').css('color','black');
			}
			else if(data[i].reser_code == 2){						
				$('.request_finish').eq(i).attr('disabled',true).css('border','1px solid #337ab7').css('background-color','#337ab7').css('color','white');
			}
			else if(data[i].reser_code == 3){						
				$('.travel').eq(i).attr('disabled',true).css('border','1px solid #46b8da').css('background-color','#46b8da').css('color','white');
			}
			else if(data[i].reser_code == 4){						
				$('.finish').eq(i).attr('disabled',true).css('border','1px solid #4cae4c').css('background-color','#4cae43').css('color','white');
			}
			else if(data[i].reser_code == 5){						
				$('.cancel').eq(i).attr('disabled',true).css('border','1px solid #d9534f').css('background-color','#d9534f').css('color','white');
			}
			
		}
		
	})	
	
}
function destroy_page(state){
	$('#pagination').twbsPagination('destroy');
	
	$('#pagination').twbsPagination({
	      totalPages:tot,
	      visiblePages: 7,
	      onPageClick: function (event, page) {		
	    	  $.post('Json_reser_list.do',{"state":state,"page":page},function(d){
	    			var data = d.list;
	    			tot = d.tot;
	    			var leng = data.length;
	    			$('.reser_list').empty();
	    			for(var i=0;i<leng;i++){
	    				$('.reser_list').append(
	    						'<div class="reser_item">'+
	    						'<div class="reser_profile">'+
	    						'<input type="hidden" class="reser_num" value="'+data[i].reservation_code+'" />'+
	    						'<input type="hidden" class="reser_guest_id" value="'+data[i].guest_id+'" />'+
	    						'<input type="hidden" class="reser_host_id" value="'+data[i].host_id+'" />'+
	    						'<input type="hidden" class="reser_room_code" value="'+data[i].room_code+'" />'+
	    						'<input type="hidden" class="reser_code" value="'+data[i].reser_code+'" />'+
	    							'<img src="admin_show_profile.do?id='+data[i].host_id+'" class="reser_img"/>'+
	    							data[i].host_name+
	    						'</div>'+
	    						'<div class="reser_profile">'+
	    							'<img src="admin_show_profile.do?id='+data[i].guest_id+'" class="reser_img"/>'+
	    							data[i].guest_name+
	    						'</div>'+
	    						'<div class="reser_content">'+
	    							'<p>'+data[i].room_name+'<br />'+
	    							data[i].reservation_start+ '~'+ data[i].reservation_end+ ' ( '+ data[i].reser_day+'박'+ (data[i].reser_day+1)+'일 )</p>'+
	    						'</div>'+
	    						'<div class="reser_payment">'+
	    							'<div style="width:50%;text-align: right">'+
	    								'<label class="reser_title">'+data[i].reser_title+'</label> <br />'+
	    								numberformat(data[i].room_day*data[i].reser_day)+'원<br />'+
	    								numberformat(data[i].room_day*data[i].reser_day*0.1)+'원<br />'+
	    						 	'</div>'+
	    						 	'<div>'+
	    						 	'</div>'+
	    						'</div>'+
	    						'<div class="show_detail">'+
	    							'<span class="glyphicon glyphicon-chevron-down" ></span>'+
	    						'</div>'+
	    						'<div class="detail">'+
	    							'<ul >'+
	    								'<li class="active reser_btn" >예약 정보</li>'+
	    								'<li class="host_btn">호스트 정보</li>'+
	    								'<li class="guest_btn">게스트 정보</li>'+
	    							'</ul>'+
	    							'<div class="detail_content" style="width:100%;height:170px;">'+
	    								'<div class="img-div">'+
	    									'<img src="admin_room_img.do?id='+data[i].room_code+'"/>'+
	    								'</div>'+
	    								'<div style="float:left" class="detail_infomation" style="">'+
	    									'<table class="table table-reser" style="height:205px; margin:0px;">'+
	    										'<tr>'+
	    										'<th>숙소명</th>'+
	    										'<td class="room_name">'+data[i].room_name+'</td>'+
	    										'<th>인원</th>'+
	    										'<td><label class="reservation_people">'+data[i].reservation_people+'</label> 명</td>'+  
	    										'</tr>'+
	    										'<tr>'+ 
	    											'<th>입실일</th>'+
	    											'<td><label class="reser_start">'+data[i].reservation_start+'</label> ( <label class="reser_start_day" >'+data[i].dayofweek_start+' </label> )</td>'+
	    											'<th>총 결제 금액</th>'+
	    											'<td>'+
	    											'<label class="reser_total">'+
	    											numberformat(data[i].room_day*data[i].reser_day)+'원'+
	    											'</label> <br />'+
	    											'( 1박당 가격 : <label class="room_day">'+numberformat(data[i].room_day)+' 원</label> / 숙박일수 : <label class="reser_day">'+data[i].reser_day+'</label>박 )'+
	    											'</td>'+
	    										'</tr>'+
	    										'<tr>'+
	    											'<th>퇴실일</th>'+
	    											'<td><label class="reser_end">'+data[i].reservation_end+'</label> ( <label class="reser_end_day"> '+data[i].dayofweek_end+'</label> )</td>'+
	    											'<th>예약금</th>'+
	    											'<td>'+
	    											'<label class="reser_price">'+numberformat(data[i].room_day*data[i].reser_day*0.1)+' 원</label><br />'+
	    											'( 총 결제 금액의 10% )'+
	    											'</td>'+
	    										'</tr>'+
	    									'</table>'+
	    									
	    									'<table class="table table_member" style="height:205px;">'+
	    										'<tr>'+
	    											'<th >성명</th>'+
	    											'<td class="name">홍길동</td>'+
	    											'<th>아이디</th>'+
	    											'<td class="custom_id">부산</td>									</td>'+ 
	    										'</tr>'+
	    										'<tr> '+
	    											'<th >전화번호</th>'+
	    											'<td class="phone">'+data[i].custom_phone+										
	    											'<th class="bank">이용횟수</th>'+
	    											'<td class="using">0</td>'+
	    										'</tr>'+
	    										'<tr>'+
	    											'<th colspan="2" style="width:50%"><a href="admin_member_detail.do?id='+data[i].host_id+'" class="form-control member_info">회원 정보 보기</a></th>'+									
	    											'<th colspan="2" style="width:50%"><a href="admin_room.do?id='+data[i].host_id+'" class="form-control">등록된 다른 숙소 보기</a></th>'+
	    										'</tr>'+
	    									'</table>'+
	    								'</div>'+			
	    								'<div style="float:right">'+
	    									'<input type="button" id="request_'+i+'" value="예약신청" class="request btn btn-default btn_state" />'+
	    									'<input type="button" id="payment_'+i+'" value="결제진행중"  class="payment btn btn-default btn_state"/>'+
	    									'<input type="button" id="request_finish_'+i+'" value="예약완료"  class="request_finish btn btn-default btn_state"/>'+
	    									'<input type="button" id="travel_'+i+'" value="여행중"  class="travel btn btn-default btn_state" />'+
	    									'<input type="button" id="finish_'+i+'" value="여행완료"  class="finish btn btn-default btn_state" />'+
	    									'<input type="button" id="cancel_'+i+'" value="취소"  class="cancel btn btn-default btn_state" />'+
	    								'</div>'+
	    							'</div>'+
	    						'</div>'+
	    					'</div>	');
	    				if(data[i].dayofweek_start == '토' || data[i].dayofweek_end=='토'){
	    					$('.reser_start_day').eq(i).css('color','blue');
	    				}
	    				else if(data[i].dayofweek_start== '일' || data[i].dayofweek_end=='일'){
	    					$('.reser_start_day').eq(i).css('color','red');
	    				}		
	    				
	    				if(data[i].reser_code == 0){						
	    					$('.request').eq(i).attr('disabled',true).css('border','1px solid #ccc').css('background-color','#ccc').css('color','black');;				
	    				}
	    				else if(data[i].reser_code == 1){						
	    					$('.payment').eq(i).attr('disabled',true).css('border','1px solid #eee236').css('background-color','#eee236').css('color','black');
	    				}
	    				else if(data[i].reser_code == 2){						
	    					$('.request_finish').eq(i).attr('disabled',true).css('border','1px solid #337ab7').css('background-color','#337ab7').css('color','white');
	    				}
	    				else if(data[i].reser_code == 3){						
	    					$('.travel').eq(i).attr('disabled',true).css('border','1px solid #46b8da').css('background-color','#46b8da').css('color','white');
	    				}
	    				else if(data[i].reser_code == 4){						
	    					$('.finish').eq(i).attr('disabled',true).css('border','1px solid #4cae4c').css('background-color','#4cae43').css('color','white');
	    				}
	    				else if(data[i].reser_code == 5){						
	    					$('.cancel').eq(i).attr('disabled',true).css('border','1px solid #d9534f').css('background-color','#d9534f').css('color','white');
	    				}
	    				
	    			}
	    			
	    		})	
	      }
   });
}
function search_reser(){
	var txt = $('#search_txt').val();
	var type= $('#type').val();
	if(txt =="")
		alert('검색어를 입력해 주세요');
	else{
		
		$.get('Json_reser_search.do?txt='+txt+'&type='+type,function(data){
			var leng = data.length;
			$('.reser_list').empty();
			for(var i=0;i<leng;i++){
				$('.reser_list').append(
						'<div class="reser_item">'+
						'<div class="reser_profile">'+
						'<input type="hidden" class="reser_num" value="'+data[i].reservation_code+'" />'+
						'<input type="hidden" class="reser_guest_id" value="'+data[i].guest_id+'" />'+
						'<input type="hidden" class="reser_host_id" value="'+data[i].host_id+'" />'+
						'<input type="hidden" class="reser_room_code" value="'+data[i].room_code+'" />'+
						'<input type="hidden" class="reser_code" value="'+data[i].reser_code+'" />'+
							'<img src="admin_show_profile.do?id='+data[i].host_id+'" class="reser_img"/>'+
							data[i].host_name+
						'</div>'+
						'<div class="reser_profile">'+
							'<img src="admin_show_profile.do?id='+data[i].guest_id+'" class="reser_img"/>'+
							data[i].guest_name+
						'</div>'+
						'<div class="reser_content">'+
							'<p>'+data[i].room_name+'<br />'+
							data[i].reservation_start+ '~'+ data[i].reservation_end+ ' ( '+ data[i].reser_day+'박'+ (data[i].reser_day+1)+'일 )</p>'+
						'</div>'+
						'<div class="reser_payment">'+
							'<div style="width:50%;text-align: right">'+
								'<label class="reser_title">'+data[i].reser_title+'</label> <br />'+
								numberformat(data[i].room_day*data[i].reser_day)+'원<br />'+
								numberformat(data[i].room_day*data[i].reser_day*0.1)+'원<br />'+
						 	'</div>'+
						 	'<div>'+
						 	'</div>'+
						'</div>'+
						'<div class="show_detail">'+
							'<span class="glyphicon glyphicon-chevron-down" ></span>'+
						'</div>'+
						'<div class="detail">'+
							'<ul >'+
								'<li class="active reser_btn" >예약 정보</li>'+
								'<li class="host_btn">호스트 정보</li>'+
								'<li class="guest_btn">게스트 정보</li>'+
							'</ul>'+
							'<div class="detail_content" style="width:100%;height:170px;">'+
								'<div class="img-div">'+
									'<img src="admin_room_img.do?id='+data[i].room_code+'"/>'+
								'</div>'+
								'<div style="float:left" class="detail_infomation" style="">'+
									'<table class="table table-reser" style="height:205px; margin:0px;">'+
										'<tr>'+
										'<th>숙소명</th>'+
										'<td class="room_name">'+data[i].room_name+'</td>'+
										'<th>인원</th>'+
										'<td><label class="reservation_people">'+data[i].reservation_people+'</label> 명</td>'+  
										'</tr>'+
										'<tr>'+ 
											'<th>입실일</th>'+
											'<td><label class="reser_start">'+data[i].reservation_start+'</label> ( <label class="reser_start_day" >'+data[i].dayofweek_start+' </label> )</td>'+
											'<th>총 결제 금액</th>'+
											'<td>'+
											'<label class="reser_total">'+
											numberformat(data[i].room_day*data[i].reser_day)+'원'+
											'</label> <br />'+
											'( 1박당 가격 : <label class="room_day">'+numberformat(data[i].room_day)+' 원</label> / 숙박일수 : <label class="reser_day">'+data[i].reser_day+'</label>박 )'+
											'</td>'+
										'</tr>'+
										'<tr>'+
											'<th>퇴실일</th>'+
											'<td><label class="reser_end">'+data[i].reservation_end+'</label> ( <label class="reser_end_day"> '+data[i].dayofweek_end+'</label> )</td>'+
											'<th>예약금</th>'+
											'<td>'+
											'<label class="reser_price">'+numberformat(data[i].room_day*data[i].reser_day*0.1)+' 원</label><br />'+
											'( 총 결제 금액의 10% )'+
											'</td>'+
										'</tr>'+
									'</table>'+
									
									'<table class="table table_member" style="height:205px;">'+
										'<tr>'+
											'<th >성명</th>'+
											'<td class="name">홍길동</td>'+
											'<th>아이디</th>'+
											'<td class="custom_id">부산</td>									</td>'+ 
										'</tr>'+
										'<tr> '+
											'<th >전화번호</th>'+
											'<td class="phone">'+data[i].custom_phone+										
											'<th class="bank">이용횟수</th>'+
											'<td class="using">0</td>'+
										'</tr>'+
										'<tr>'+
											'<th colspan="2" style="width:50%"><a href="admin_member_detail.do?id='+data[i].host_id+'" class="form-control member_info">회원 정보 보기</a></th>'+									
											'<th colspan="2" style="width:50%">'+
											'<a href="admin_room.do?id='+data[i].host_id+'" class="form-control">등록된 다른 숙소 보기</a>'+
											'</th>'+
										'</tr>'+
									'</table>'+
								'</div>'+			
								'<div style="float:right">'+
									'<input type="button" id="request_'+i+'" value="예약신청" class="request btn btn-default btn_state" />'+
									'<input type="button" id="payment_'+i+'" value="결제진행중"  class="payment btn btn-default btn_state"/>'+
									'<input type="button" id="request_finish_'+i+'" value="예약완료"  class="request_finish btn btn-default btn_state"/>'+
									'<input type="button" id="travel_'+i+'" value="여행중"  class="travel btn btn-default btn_state" />'+
									'<input type="button" id="finish_'+i+'" value="여행완료"  class="finish btn btn-default btn_state" />'+
									'<input type="button" id="cancel_'+i+'" value="취소"  class="cancel btn btn-default btn_state" />'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>	');
				if(data[i].dayofweek_start == '토' || data[i].dayofweek_end=='토'){
					$('.reser_start_day').eq(i).css('color','blue');
				}
				else if(data[i].dayofweek_start== '일' || data[i].dayofweek_end=='일'){
					$('.reser_start_day').eq(i).css('color','red');
				}		
				
				if(data[i].reser_code == 0){						
					$('.request').eq(i).attr('disabled',true).css('border','1px solid #ccc').css('background-color','#ccc').css('color','black');;				
				}
				else if(data[i].reser_code == 1){						
					$('.payment').eq(i).attr('disabled',true).css('border','1px solid #eee236').css('background-color','#eee236').css('color','black');
				}
				else if(data[i].reser_code == 2){						
					$('.request_finish').eq(i).attr('disabled',true).css('border','1px solid #337ab7').css('background-color','#337ab7').css('color','white');
				}
				else if(data[i].reser_code == 3){						
					$('.travel').eq(i).attr('disabled',true).css('border','1px solid #46b8da').css('background-color','#46b8da').css('color','white');
				}
				else if(data[i].reser_code == 4){						
					$('.finish').eq(i).attr('disabled',true).css('border','1px solid #4cae4c').css('background-color','#4cae43').css('color','white');
				}
				else if(data[i].reser_code == 5){						
					$('.cancel').eq(i).attr('disabled',true).css('border','1px solid #d9534f').css('background-color','#d9534f').css('color','white');
				}
			}
		})
	}
	
}