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
	
		<jsp:include page="hostside.jsp"></jsp:include>
		
		<div class="host-main">
			<div class="host-header">
				<h3 class="host-title">달력관리 <small>예약 가능날짜를 설정하세요</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
				
					<div class="col-md-12 col-lg-8">
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">언제든지 예약 가능한 날짜를 변경할 수 있습니다.</h3>
							</div>
							<div class="panel-body">
								
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	<div style="display:none">
		<input type="text" id="confirm_name" value="${cVO.confirm_name}"/>
		<input type="text" id="confirm_basic" value="${cVO.confirm_basic}"/>
		<input type="text" id="confirm_location" value="${cVO.confirm_location}"/>
		<input type="text" id="confirm_amenity" value="${cVO.confirm_amenity}"/>
		<input type="text" id="confirm_img" value="${cVO.confirm_img}"/>
		<input type="text" id="confirm_price" value="${cVO.confirm_price}"/>
		<input type="text" id="confirm_inout" value="${cVO.confirm_inout}"/>
	</div>
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script src="resources/js/hostside.js"></script>
	<script type="text/javascript">
	</script>

</body>
</html>