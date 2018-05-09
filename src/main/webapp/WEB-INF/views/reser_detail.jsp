<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
   <jsp:include page="topbar.jsp"></jsp:include>
   
   <div class="guest-container">
      <div class="guest-nav">
         <a href="guest.do" id="guest-list-1"> 
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 여행보기</span>
         </a>
         <a href="profileEdit.do" id="guest-list-2">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 찜 보기</span>
         </a>

      </div>
      
      <div class="guest-main">
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
				숙소이름 : ${reser.room_name}<br />
				예약일시 : ${reser.reservation_date }<br />
				현재 상태: ${reser.reser_title }<br />
				여행시작날짜 : ${reser.reservation_start }<br />				
				여행종료날짜 : ${reser.reservation_end}<br />
				<c:if test="${guest!=host.custom_id }">			
					<input type="button" value="취소" />					
				</c:if>
				<c:if test="${guest==host.custom_id }">			
					<input type="button" value="수락" />
					<input type="button" value="거절" />
				</c:if>				
			</div>
			<div style="clear:both;height:10px;"></div> 
			<div style="border:1px solid #ccc;height:300px;width:100%;">
				예약 방법 설정
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
	
	});
   </script>
</body>
</html>