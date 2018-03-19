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
<link rel="stylesheet" href="resources/css/profile_view.css" />
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
			<div class="profile-header">
				<h3>비밀번호 변경</h3>
				<p>Password Changing</p>
			</div>
			
			<div class="profile-content">
				<form action="passwordEdit.do" method="post">
				<div class="wrap">
					<label>이전 비밀번호</label><input type="password" class="form-control" name="pre_pw" placeholder="이전 비밀번호를 입력하세요." />
				</div>
				<div class="wrap">
					<label>새 비밀번호</label><input type="password" class="form-control" name="pw1" placeholder="새 비밀번호를 입력하세요." />
				</div>
				<div class="wrap">
					<label>비밀번호 확인</label><input type="password" class="form-control" name="pw2" placeholder="새 비밀번호를 한번 더 입력하세요." />
				</div>
				<input type="submit" class="btn btn-primary" value="비밀번호 업데이트" />
 				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/topbar.js"></script>
	<script type="text/javascript" src="resources/js/profile_view.js"></script>
	<script>
		$(function() {
			
		});
	</script>
</body>
</html>