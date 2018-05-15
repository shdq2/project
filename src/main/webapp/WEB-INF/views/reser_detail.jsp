<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html> 
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/guest.css" />
<link rel="stylesheet" href="resources/css/reser_detail.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>

   <jsp:include page="topbar.jsp"></jsp:include>
    <div class="btn_div" >
      		<c:if test="${reser.reser_code != 6 }">
      			<c:if test="${guest!=host.custom_id }">			
					<input type="button" value="예약 취소" class="cancel btn btn-danger reser_btn" style="width: 150px;"/>					
				</c:if>
				<c:if test="${guest==host.custom_id }">			
					<c:if test="${reser.reser_code ==0 }">
						<input type="button" value="예약 수락" class="accept btn btn-success reser_btn" style="width: 150px;"/>
					</c:if>
					<input type="button" value="예약 거절" class="cancel btn btn-danger reser_btn" style="width: 150px;"/>
				</c:if>	
			</c:if>
      	</div>
   <div class="guest-container">
      <div class="guest-nav">
         <a href="guest.do" id="guest-list-1"> 
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 여행보기</span>
         </a>
         <a href="profileEdit.do" id="guest-list-2">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 찜 보기</span>
         </a>
      </div>
      <div class="guest-main" style="margin-right:15px;">
      	<div class="block-xs-12 block-md-9" >
         <div class="main-header">
			<h3>여행 세부정보</h3>
			<p>Reservation Detail</p>
		</div>
		<div style="width:100%;position:relative;">
		
			<div style="width:44%;height:300px;float:left;text-align: center;vertical-align: middle;line-height: 300px;">
				<img src="admin/admin_room_img.do?id=${reser.room_code }" style="width:250px;height:250px;"/>
			</div>
			<div style="width:56%;height:150px;float:left;margin-bottom: 5px;">
				<div style="display: inline-block;width:39%;height:100%;float:left"><img src="show_img.do?code=${guest_img }" style="display: inline-block;border-radius: 50%;width:150px;height:100%" /></div>
				<div style="width:59%;height:100%;display: inline-block;float:left">
					<c:if test="${guest != host.custom_id }">
						<table class="table">
							<tr>
								<th>호스트 아이디</th>
							</tr>
							<tr>
								<td>${host.custom_id }</td>
							</tr>
							<tr>
								<th>호스트 이름</th>
							</tr>
							<tr>
								<td>${host.custom_name}</td>
							</tr>
						</table>
					</c:if>
					<c:if test="${guest == host.custom_id }">
						<table class="table">
							<tr>
								<th>게스트 아이디</th>
							</tr>
							<tr>
								<td>${gvo.custom_id }</td>
							</tr>
							<tr>
								<th>게스트 이름</th>
							</tr>
							<tr>
								<td>${gvo.custom_name}</td>
							</tr>
						</table>
					</c:if>
				</div>
			</div>
			<div style="width:56%;height:150px;float:left">
				<table class="table">
					<tr>
						<th>숙소이름</th>
						<td>${reser.room_name}</td>
						<th>현재 상태</th>
						<td id="reser_title">${reser.reser_title }</td>
					</tr>
					<tr>
						<th>여행시작일</th>
						<td>${reser.reservation_start } ( ${reser.dayofweek_start } )</td>
						<th>총 금액</th>
						<td><fmt:formatNumber value="${reser.room_day * reser.reser_day }" pattern="#,###" /> 원</td>
					</tr>
					<tr>
						<th>여행종료일</th>
						<td>${reser.reservation_end} ( ${reser.dayofweek_end } )</td>
						<th>예약금</th>
						<td><fmt:formatNumber value="${reser.room_day * reser.reser_day/10 }" pattern="#,###" /> 원</td>
					</tr>
					<tr>
						<th colspan="2">숙박일수</th>
						<td colspan="2">${reser.reser_day} 박 ${reser.reser_day+1 } 일</td>
						
					</tr>
				</table>				
				
				
			</div>
			<div style="clear:both;height:10px;"></div> 
			<div style="height:300px;width:100%;" id="reser_div">
					<c:if test="${guest!=host.custom_id }">
						<c:if test="${reser.reser_code == 0 }">
							<div style="width:100%;height:100%;text-align:center;background-image: url('resources/imgs/6.svg'); background-repeat: no-repeat;background-position: center;">								
								<label style="position:relative;top:140px; color:green">수락 대기중</label></div>
						</c:if>
						<c:if test="${reser.reser_code == 1 }">			
						<table class="table" style="width:20%;height:298px;float:left">						
							<tr>
								<th class="type_btn"style="border-right:1px solid #ddd;border-right:none;background:#f5f5f5;">결제 방법 선택</th>								
							</tr>
							<tr>
								<td class="type_btn">신용카드 /<br /> 체크카드 결제</td>
							</tr>
							
							<tr>								
								<td class="type_btn">계좌 이체</td>								
							</tr>
						</table>
						<div class="type_div">
							<ul style="list-style-type: circle">
								<li>산용카드 체크카드 결제</li>
									<p>신용카드 체크카드 설명</p>								
								<li>계좌이체</li>
									<p>계좌이체 설명</p>
							</ul>
						</div>
						<div style="display:none" class="type_div">
							<p style="color:red;text-align:center;font-size:12px;"> * 카드 결제 진행시 카드사 수수료가 부과될 수 있습니다 *</p>
							<div style="height:140px;width:20%;float:left;text-align: center;line-height: 125px;"><label style="vertical-align: middle;">카드 선택</label>
							</div>
							<div style="height:140px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<c:forEach var="c" items="${card }">
									<input type="button" value="${c}" class="card form-control" style="width:100px;height:35px;margin-top:5px;margin-left:2px;" />
								</c:forEach>
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제 방법</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<input type="radio" class="way" name="way1" value="0" checked/> 안전결제
								<input type="radio" class="way" name="way1" value="1"/> 일반결제
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">할부 방법</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<select id="monthly">
									<option value="0">일시불</option>
									<option value="3">3개월</option>
									<option value="5">5개월</option>
								</select>
							</div>
							<div style="height:30px;width:20%;float:right;margin-top:18px;"><input type="button" value="결제하기" class="cash form-control" style="background-color:#edc22f;color:white;"/></div>	
							<div style="height:30px;width:80%;float:right;margin-top:18px;text-align:center"><input type="checkbox" class="chk"/>구매 이용약관에 동의합니다.</div>
						</div> 
						
						<div style="display:none" class="type_div">
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">예금 은행</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								부산은행
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">계좌번호</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								123-456789-01-234
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">예금주</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								( 주 ) 미스터멘션
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금자명</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<input type="text" class="form-control" id="cash_name"/> <input type="checkbox" id="name_chk" />회원이름과 동일한 이름
							</div>
							<div style="height:20px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금 금액</label>
							</div>
							<div style="height:20px;width:80%;float:left;margin-bottom:5px;" class="form-inline" id="money">
								<fmt:formatNumber value="${reser.room_day * reser.reser_day/10 }" pattern="#,###" /> 원
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;margin-top:10px;"><label style="color:red;">주의 사항</label>
							</div>
							<div style="height:70px;width:80%;float:left;margin-bottom:15px;margin-top:10px;color:red;" class="form-inline">
								1) 입금자 명과 실제 입금자 명을 똑같이 맞춰주세요<br />
								2) 입금 금액을 정확히 입금해주세요<br />
								3) 입금자 명과 실제 입금자 명이 다를경우 <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;010-9203-7239로 연락주세요<br />
							</div> 
							
							<div style="height:30px;width:20%;float:right;"><input type="button" value="결제하기" class="cash form-control" style="background-color:#edc22f;color:white;"/></div>	
							<div style="height:30px;width:80%;float:right;text-align:center"><input type="checkbox" class="chk"/>구매 이용약관에 동의합니다.</div>
						</div>
						</c:if>
						<c:if test="${reser.reser_code==2 }">
							<div style="text-align: center">
							
							<c:if test="${!empty pvo }">
								<c:if test="${pvo.payment_type == 1 }">
									<label style="color:blue">진행 중인 결제내역이 있습니다</label>
									<div>
									
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제방법</label></div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										계좌이체
									</div>
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금금액</label>
									</div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										<fmt:formatNumber value="${pvo.payment_money }" pattern="#,###" /> 원										
									</div>
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금자명</label>
									</div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										${pvo.payment_name }
									</div>
									
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금날짜</label>
									</div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										${pvo.payment_date }
									</div>							 
										<input type="button" value="거래완료하기" class="success_btn" />
									</div>
								</c:if>
								<c:if test="${pvo.payment_type == 0 }">
									<label style="color:blue">진행중인 결제내역이 있습니다</label>
									<div>
									
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제방법</label></div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										카드결제
									</div>									
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제금액</label>
									</div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										<fmt:formatNumber value="${pvo.payment_money }" pattern="#,###" /> 원
									</div>
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">할부</label>
									</div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										${pvo.payment_monthly } 개월
									</div>
									<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제날짜</label>
									</div>
									<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
										${pvo.payment_date }
									</div>							 
										<input type="button" value="거래완료하기" class="success_btn" />
									</div>
								</c:if>
							</c:if>
								
							</div>
						</c:if>
						<c:if test="${reser.reser_code>2 and reser.reser_code <6}">
							<div>
								<label style="color:blue;text-align:center;width:100%">* 예약이 완료되었습니다. 호스트께 연락하여 자세한 일정을 설명해 드리세요. *</label>
								<br />
								<br />
								<br />
								<table class="table">
									<tr>
										<th>숙소명</th>
										<td>${reser.room_name }</td>
										<th>총 금액</th>
										<td><fmt:formatNumber value="${reser.room_day * reser.reser_day }" pattern="#,###" /> 원</td>
									</tr>
									<tr>
										<th>입실시간</th>
										<td>${reser.room_in }</td>
										<th>예약금</th>
										<td><fmt:formatNumber value="${reser.room_day * reser.reser_day/10 }" pattern="#,###" /> 원</td>
									</tr>
									<tr>
										<th>퇴실시간</th>
										<td>${reser.room_out}</td>
										<th>잔액</th>
										<td><fmt:formatNumber value="${reser.room_day * reser.reser_day*9/10 }" pattern="#,###" /> 원</td>
									</tr>
									
									<tr>
										<th>호스트 전화번호</th>
										<td>${host.custom_phone}</td>
										<th>게스트 전화번호</th>
										<td>${gvo.custom_phone }</td>
									</tr>
									<tr>
										<th>숙소위치</th>
										<td colspan="3">${map.room_addr}</td>
									</tr>
								</table>
								잔액은 호스트에게 직접 전달해주시면 됩니다.
							</div>
						</c:if>
						<c:if test="${reser.reser_code == 6}">
							<div style="width:100%;height:100%;text-align: center">
								<img src="resources/imgs/Cancel-icon.png"  style="margin-top:15px;"/>
								<br /> 
								<label style="margin-top:5px;">예약이 취소/거절 되었습니다. 다른 숙소를 예약해주세요</label>
							</div>
						</c:if>
					</c:if> 
					<c:if test="${guest==host.custom_id }">
						<c:if test="${reser.reser_code == 0 }">
							<div style="width:100%;height:100%;text-align:center;background-image: url('resources/imgs/6.svg'); background-repeat: no-repeat;background-position: center;">								
								<label style="position:relative;top:140px; color:green">수락 대기중</label>
							</div> 
						</c:if>
						<c:if test="${reser.reser_code == 1 || reser.reser_code == 2}" >
						<div style="text-align: center">
							<img src="resources/imgs/payment.gif" style="width:50%;height:50%;"/>
							<br />
							<label> 게스트가 결제를 완료할 때까지 기다려주세요</label>
						</div>
							
						</c:if>
						<c:if test="${reser.reser_code >= 3 and reser.reser_code != 6}">
							<label style="color:blue;text-align:center;width:100%">* 예약이 완료되었습니다. 게스트께 연락하여 자세한 내용을 설명해 드리세요. *</label>
								<br />
								<br />
								<br />
								<table class="table">
									<tr>
										<th>숙소명</th>
										<td>${reser.room_name }</td>
										<th>총 금액</th>
										<td><fmt:formatNumber value="${reser.room_day * reser.reser_day }" pattern="#,###" /> 원</td>
									</tr>
									<tr>
										<th>입실시간</th>
										<td>${reser.room_in }</td>
										<th>예약금</th>
										<td><fmt:formatNumber value="${reser.room_day * reser.reser_day/10 }" pattern="#,###" /> 원</td>
									</tr>
									<tr>
										<th>퇴실시간</th>
										<td>${reser.room_out}</td>
										<th>잔액</th>
										<td><fmt:formatNumber value="${reser.room_day * reser.reser_day*9/10 }" pattern="#,###" /> 원</td>
									</tr>
									
									<tr>
										<th>호스트 전화번호</th>
										<td>${host.custom_phone}</td>
										<th>게스트 전화번호</th>
										<td>${gvo.custom_phone }</td>
									</tr>
									<tr>
										<th>숙소위치</th>
										<td colspan="3">${map.room_addr}</td>
									</tr>
								</table>
						</c:if>
					</c:if>
			</div>	
			
			<div style="border:1px solid #ccc;height:300px;width:100%;margin-top:10px;" id="map">
				위치정보
			</div>	
			
		</div>
		<div style="height:50px;"></div>
		</div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.js"></script>
   <script type="text/javascript" src="resources/js/topbar.js"></script>
   <script type="text/javascript" src="resources/js/guest.js"></script>
   <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnOYeB3T5JzM-18j8gEjEt9JcN8wBQYbw&callback=initMap">
    </script>
   <script>
   function initMap() {
       var uluru = {lat: Number("${map.map_lat}"), lng: Number("${map.map_lng}")};
       var reser_code =Number("${reser.reser_code}");
       console.log(reser_code);    
       if(reser_code <3 || reser_code == 6)
	       var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 12,
			zoomControl:false,
			navigationControl:false,
			scrollwheel:false,
			draggable: false,
			mapTypeControl: false,
			fullscreenControl:false,
			streetViewControl:false,
	         center: uluru
	       });
       else
    	   var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 12,    			         
			center: uluru
			});
       var marker = new google.maps.Marker({
         position: uluru,
         map: map
       });
     }
	$(function() {		
		$('.type_btn').css('cursor','pointer');
		var card_chk = 0;
		var card="";
		var way = 0;
		var monthly=0;
		$('.cancel').click(function(){
			var txt = $(this).val();
			$(this).css('display','none');
			$.get('admin/Json_update_state.do?code=${param.code}&state=6',function(data){
				if(data.ret == 1)
				$('#reser_title').text(txt);
				$('#reser_div').empty();
				$('#reser_div').append(
				'<div style="width:100%;height:100%;text-align:center">'+
				'<img src="resources/imgs/Cancel-icon.png"  style="margin-top:15px;"/>'+
				'<br /> '+
				'<label style="margin-top:5px;">예약이 취소/거절 되었습니다. 다른 숙소를 예약해주세요</label>'+
				'</div>'
				);
			})
		});
		
		$('.accept').click(function(){
			$(this).css('display','none');
			$.get('admin/Json_update_state.do?code=${param.code}&state=1',function(data){
				if(data.ret == 1)
				$('#reser_title').text("수락");
			})
			
		})
		$('.way').click(function(){
			way = $(this).index('.way');
		})
		
		$('.type_btn').click(function(){	
			var idx= $(this).index('.type_btn');
			$('.type_btn').css('background','none');
			$('.type_div').css('display','none');
			$('.type_btn').eq(idx).css('background','#f5f5f5');
			$('.type_div').eq(idx).css('display','block');
		});
		
		$('.card').click(function(){
			var idx = $(this).index('.card');
			$('.card').css('border','');
			$('.card').eq(idx).css('border','1px solid red');
			card = $('.card').eq(idx).val();
			card_chk = 1;
		})
		
		$('.cash').click(function(){
			var idx = $(this).index('.cash');
			var monthly = $('#monthly').val();
			var money = ${reser.room_day * reser.reser_day/10 };
			if(idx == 0){
				if(card_chk == 1 && $('.chk').eq(idx).is(':checked')){
					console.log(${param.code});
					$.post('Json_reser_payment.do', 
							{"code":"${param.code}",
						"state":2,
						"payment_type":idx,
						"card":card,
						"card_type":way,
						"monthly":monthly,
						"money":money
						},function(data){
						if(data.ret == 1){ 
							$('#reser_title').text("결제진행중");
							$('#reser_div').empty();
							if(data.pvo.payment_type==1){
								$('#reser_div').append(
										'<div style="text-align: center">'+
										'<label style="color:blue">진행중인 결제내역이 있습니다</label>'+
										'<div>'+										
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제방법</label></div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											'계좌이체'+
										'</div>		'+							
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금금액</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
										numberformat(data.pvo.payment_money) + ' 원'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금자명</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_name+' 개월'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금날짜</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_date+
										'</div>						'+	 
											'<input type="button" value="거래완료하기" class="success_btn" />'+
										'</div>		'+
										'</div>'
								);	
							}else{
								$('#reser_div').append(
										'<div style="text-align: center">'+
										'<label style="color:blue">진행중인 결제내역이 있습니다</label>'+
										'<div>'+										
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제방법</label></div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											'카드결제'+
										'</div>		'+							
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제금액</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
										numberformat(data.pvo.payment_money) + ' 원'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">할부</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_monthly+' 개월'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제날짜</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_date+
										'</div>						'+	 
											'<input type="button" value="거래완료하기" class="success_btn" />'+
										'</div>		'+
										'</div>'
								);
							}
							
						}
						
					})
				}else{
					if(card_chk != 1){
						alert('카드를 선택해 주세요');
						$('.card').eq(0).focus();
					}else if(!$('.chk').eq(idx).is(':checked')){
						alert('구매이용 약관에 동의를 해주세요');
						$('.chk').eq(idx).focus();
					}
				}
			}else if(idx == 1){
				var name = $('#cash_name').val();
				if(name != "" && $('.chk').eq(idx).is(':checked')){
					$.post('Json_reser_payment.do', 
							{
						"code":"${param.code}",
						"state":2,
						"payment_type":idx,
						"name":name,
						"money":money
						},function(data){
						if(data.ret == 1){ 
							$('#reser_title').text("결제진행중");
							$('#reser_div').empty();
							if(data.pvo.payment_type==1){
								$('#reser_div').append(
										'<div style="text-align: center">'+
										'<label style="color:blue">진행중인 결제내역이 있습니다</label>'+
										'<div>'+										
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제방법</label></div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											'계좌이체'+
										'</div>		'+							
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금금액</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
										numberformat(data.pvo.payment_money) + ' 원'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금자명</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_name+' 개월'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">입금날짜</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_date+
										'</div>						'+	 
											'<input type="button" value="거래완료하기" class="success_btn" />'+
										'</div>		'+
										'</div>		'
								);	
							}else{
								$('#reser_div').append(
										'<div style="text-align: center">'+
										'<label style="color:blue">진행중인 결제내역이 있습니다</label>'+
										'<div>'+										
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제방법</label></div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											'카드결제'+
										'</div>		'+							
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제금액</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
										numberformat(data.pvo.payment_money) + ' 원'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">할부</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_monthly+' 개월'+
										'</div>'+
										'<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제날짜</label>'+
										'</div>'+
										'<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">'+
											data.pvo.payment_date+
										'</div>						'+	 
											'<input type="button" value="거래완료하기" class="success_btn" />'+
										'</div>		'+
										'</div>		'
								);
							}
						}
						
					})
				}else{
					if(name == ""){
						alert('입금자명을 입력하세요');
						$('#cash_name').focus();
					}else if(!$('.chk').eq(idx).is(':checked')){
						alert('구매이용 약관에 동의를 해주세요');
						$('.chk').eq(idx).focus();
					}
				}
			}
		})
		
		$('#name_chk').click(function(){
			if($('#name_chk').is(':checked')){
				$('#cash_name').val('${guest_name}');
				$('#cash_name').attr('readonly','readonly');
			}
			else{
				$('#cash_name').val('');
				$('#cash_name').attr('readonly',false);
			}
		})	
		
		$(document).on('click','.success_btn',function(){
			$.get('Json_reser_accept.do?code=${param.code}&state=3',function(data){
				var reser = data.reser;
				var host = data.host;
				var guest = data.gvo;
				var map = data.map
				if(data.ret == 1){					
					$('#reser_title').text("예약완료");
					alert("예약이 완료되었습니다.");
					$('#reser_div').empty();
					$('#reser_div').append(
							'<label style="color:blue;text-align:center;width:100%">* 예약이 완료되었습니다. 게스트께 연락하여 자세한 내용을 설명해 드리세요. *</label>'+
							'<br /><br /><br />'+
							'<table class="table">'+
								'<tr>'+
									'<th>숙소명</th>'+
									'<td>'+reser.room_name+'</td>'+
									'<th>총 금액</th>'+									
									'<td>'+numberformat(reser.room_day*reser.reser_day)+' 원</td>'+
								'</tr>'+
								'<tr>'+
									'<th>입실시간</th>'+
									'<td>'+reser.room_in+'</td>'+
									'<th>예약금</th>'+									
									'<td>'+numberformat(reser.room_day*reser.reser_day/10)+' 원</td>'+
								'</tr>'+
								'<tr>'+
									'<th>퇴실시간</th>'+
									'<td>'+reser.room_out+'</td>'+
									'<th>잔액</th>'+									
									'<td>'+numberformat(reser.room_day*reser.reser_day*9/10)+' 원</td>'+
								'</tr>'+								
								'<tr>'+
									'<th>호스트 전화번호</th>'+
									'<td>'+host.custom_phone+'</td>'+
									'<th>게스트 전화번호</th>'+
									'<td>'+guest.custom_phone+'</td>'+
								'</tr>'+
								'<tr>'+
									'<th>숙소위치</th>'+
									'<td colspan="3">'+map.room_addr+'</td>'+
								'</tr>'+
							'</table>'
					);
				}
			})
		})
	});
   </script>
</body>
</html>