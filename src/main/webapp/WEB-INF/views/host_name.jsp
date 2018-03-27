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
	
	<style>
	</style>
</head>
<body>
	<!-- 메뉴바  -->
	<jsp:include page="topbar.jsp"></jsp:include>


	<div class="container1" align="center" style="margin-top:62px">
		<div style="width: 300px; position:absolute">
			<a href="#" class="w3-bar-item w3-button">Link 1</a><br>
			<a href="#" class="w3-bar-item w3-button">Link 2</a><br>
			<a href="#"	class="w3-bar-item w3-button">Link 3</a>
		</div>
		<div class="host-side">
			<h5>숙소 설정</h5>
			<a href="#">설명</a>
			<a href="#">기본설정</a>
			<a href="#">위치</a>
			<a href="#">편의시설</a>
			<a href="#">사진</a>
			<a href="#">예약/요금설정</a>
			<a href="#">입/퇴실시간</a>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script type="text/javascript">
	</script>

</body>
</html>