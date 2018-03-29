<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">

<title>호스트 페이지</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/host.css">
	<style>
	</style>
</head>
<body>
	<!-- 메뉴바  -->
	<jsp:include page="topbar.jsp"></jsp:include>

	<div class="container1">
		<div class="host-side">
			<p style="text-align:center; margin-bottom:30px" >숙소설정</p>
			<a href="#">
				<span class="pull-left">설명</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			
			<a href="#">기본설정<i class="glyphicon glyphicon-ok-circle"></i></a>
			<a href="#">위치<i class="glyphicon glyphicon-ok-circle"></i></a>
			<a href="#">편의시설<i class="glyphicon glyphicon-ok-circle"></i></a>
			<a href="#">사진<i class="glyphicon glyphicon-ok-circle"></i></a>
			<a href="#">예약/요금 설정<i class="glyphicon glyphicon-ok-circle"></i></a>
			<a href="#">입/퇴실시간<i class="glyphicon glyphicon-ok-circle"></i></a>
			<a href="#"><i class="glyphicon glyphicon-calendar"></i> 달력 관리</a>
			<a href="#"><i class="	glyphicon glyphicon-plus"></i> 새로운 숙소 등록</a>
			<a href="#"><i class="	glyphicon glyphicon-th-list"></i> 숙소목록</a>
		</div>
		<div class="host-intro">
			소개합니다.
		</div>
	</div>
	
	
	

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script type="text/javascript">
	</script>

</body>
</html>