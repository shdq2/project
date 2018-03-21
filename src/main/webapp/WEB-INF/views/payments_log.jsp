<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/payments_log.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	
	<div class="profile-container">
		<div class="profile-nav">
			<a href="passwordEdit.do" id="profile-list-1">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">비밀번호<br />변경</span>
			</a>
			<a href="paymentsLog.do" id="profile-list-2">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">결제 내역</span>
			</a>
		</div>
		
		<div class="profile-main">
			<div class="main-header">
				<h3>결제내역</h3>
				<p>Payments Log</p>
			</div>
			
			<div class="main-content">
				<table class="table">
					<tr>
						<th>No</th>
						<th>결과</th>
						<th>결제수단</th>
						<th>결제금액</th>
						<th>예약</th>
						<th>결제일시</th>
						<th>관리</th>
					</tr>
					<tr>
						<td colspan="7">조회된 내용이 없습니다.</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/topbar.js"></script>
	<script type="text/javascript" src="resources/js/payments_log.js"></script>
	<script>
		$(function() {
			
		});
	</script>
</body>
</html>