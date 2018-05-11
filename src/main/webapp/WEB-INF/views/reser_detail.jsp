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
					<input type="button" value="예약 취소" class="cancel btn btn-danger reser_btn" />					
				</c:if>
				<c:if test="${guest==host.custom_id }">			
					<input type="button" value="예약 수락" class="accept btn btn-success reser_btn"/>
					<input type="button" value="예약 거절" class="cancel btn btn-danger reser_btn" />
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
			<div style="width:44%;height:300px;float:left">
				<img src="show_img.do?code=1" style="border:1px solid #ccc;width:100%;height:100%;"/>
			</div>
			<div style="width:56%;height:150px;float:left">
				<img src="show_img.do?code=1" style="width:39%;height:100%;display: inline-block;" />
				<div style="width:59%;height:100%;display: inline-block;">
					호스트 아이디 : ${host.custom_id }<br />
					호스트 이름 : ${host.custom_name }<br />
					호스트 번호 : ${host.custom_phone }
				</div>
			</div>
			<div style="border:1px solid #ccc;width:56%;height:150px;float:left">
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
			<div style="border:1px solid #ccc;height:300px;width:100%;" id="reser_div">
					<c:if test="${guest!=host.custom_id }">
						<c:if test="${reser.reser_code == 0 }">
							호스트가 수락을 하시고 결제를 완료하면 예약이 완료됩니다.
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
								<input type="radio" class="way" name="way" checked/> 안전결제
								<input type="radio" class="way" name="way"/> 일반결제
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">할부 방법</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<select id="money">
									<option value="0">일시불</option>
									<option value="3">3개월</option>
									<option value="5">5개월</option>
								</select>
							</div>
							<div style="height:30px;width:20%;float:right;"><input type="button" value="결제하기" class="cash form-control" style="background-color:#edc22f;color:white;"/></div>	
							<div style="height:30px;width:80%;float:right;text-align:center"><input type="checkbox" class="chk"/>구매 이용약관에 동의합니다.</div>
						</div> 
						
						<div style="display:none" class="type_div">
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">예금 은행</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								부산은행
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">결제 방법</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<input type="radio" class="way" name="way" checked/> 안전결제
								<input type="radio" class="way" name="way"/> 일반결제
							</div>
							<div style="height:30px;width:20%;float:left;text-align: center;"><label style="vertical-align: middle;">할부 방법</label>
							</div>
							<div style="height:30px;width:80%;float:left;margin-bottom:5px;" class="form-inline">
								<select id="money">
									<option value="0">일시불</option>
									<option value="3">3개월</option>
									<option value="5">5개월</option>
								</select>
							</div>
							<div style="height:30px;width:20%;float:right;"><input type="button" value="결제하기" class="cash form-control" style="background-color:#edc22f;color:white;"/></div>	
							<div style="height:30px;width:80%;float:right;text-align:center"><input type="checkbox" class="chk"/>구매 이용약관에 동의합니다.</div>
						</div>
						</c:if>
						<c:if test="${reser.reser_code==2 }">
							<div>
								결제가 비 정상적으로 종료되었습니다.
								<input type="button" value="거래완료하기" class="success_btn" />
							</div>
						</c:if>
						<c:if test="${reser.reser_code>2 and reser.reser_code <6}">
							<div>
								예약이 완료되었습니다. 
							</div>
						</c:if>
						<c:if test="${reser.reser_code == 6}">
							<div>
								예약이 취소되었습니다. 
							</div>
						</c:if>
					</c:if> 
					<c:if test="${guest==host.custom_id }">			
						게스트가 입금하기를 기다려 주세요
					</c:if>
				
			</div>	
			
			<div style="border:1px solid #ccc;height:300px;width:100%;margin-top:10px;">
				위치정보
			</div>	
		</div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.js"></script>
   <script type="text/javascript" src="resources/js/topbar.js"></script>
   <script type="text/javascript" src="resources/js/guest.js"></script>
   
   <script>
	$(function() {		
		$('.type_btn').css('cursor','pointer');
		var card_chk = 0;
		$('.cancel').click(function(){
			var txt = $(this).val();
			$(this).css('display','none');
			$.get('admin/Json_update_state.do?code=${param.code}&state=6',function(data){
				if(data.ret == 1)
				$('#reser_title').text(txt);
				
			})
		});
		
		$('.accept').click(function(){
			$(this).css('display','none');
			$.get('admin/Json_update_state.do?code=${param.code}&state=1',function(data){
				if(data.ret == 1)
				$('#reser_title').text("수락");
			})
			
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
			card_chk = 1;
		})
		
		$('.cash').click(function(){
			var idx = $(this).index('.cash');
			
			if(idx == 0){
				if(card_chk == 1 && $('.chk').eq(idx).is(':checked')){
					$.get('admin/Json_update_state.do?code=${param.code}&state=2',function(data){
						if(data.ret == 1){
							$('#reser_title').text("결제진행중");
							$('.type_div').eq(idx+1).empty();
							$('.type_div').eq(idx+1).append('<input type="button" class="success_btn" value="예약완료하기" />')
						}
						
					})
				} 
			}else if(idx == 1){
				
			}else if(idx == 2){
				
			}
		})
		
		$(document).on('click','.success_btn',function(){
			$.get('admin/Json_update_state.do?code=${param.code}&state=3',function(data){
				if(data.ret == 1){
					$('#reser_title').text("예약완료");
					alert("예약이 완료되었습니다.");
					$('#reser_div').empty();
					$('#reser_div').text('예약이 완료되었습니다.');
				}
			})
		})
	});
   </script>
</body>
</html>