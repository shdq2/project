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
			<a href="/project/host.do">
				<span class="pull-left">설명</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_basic.do">
				<span class="pull-left">기본설정</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_location.do">
				<span class="pull-left">위치</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_amenity.do">
				<span class="pull-left">편의시설</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_imgs.do">
				<span class="pull-left">사진</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_price.do">
				<span class="pull-left">예약/요금 설정</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_inout.do">
				<span class="pull-left">입/퇴실시간</span>
				<span class="pull-right"><i class="glyphicon glyphicon-ok-circle"></i></span>
			</a>
			<a href="/project/host_calendar.do"><i class="glyphicon glyphicon-calendar"></i>  달력 관리</a>
			<a href="/project/host_new.do"><i class="	glyphicon glyphicon-plus"></i>  새로운 숙소 등록</a>
			<a href="/project/host_list.do"><i class="	glyphicon glyphicon-th-list"></i>  숙소목록</a>
		</div>
		
		<div class="host-main">
			<div class="host-header">
				<h3 class="host-title">설명 <small>숙소를 소개해주세요</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-8">
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">회원님만의 특별한 이름과 소개글로 꾸며주세요.</h3>
							</div>
							<div class="panel-body">
								<form:form action="#" method="post" modelAttribute="vo">
									<div class="form-group">
										<label class="control-label">숙소이름</label> 
										<form:input class="form-control" required="required" type="text" path="name_title"></form:input>
									</div>
									<div class="form-group">
										<label class="control-label">숙소소개</label>
										<form:textarea style="resize:none" path="name_content" class="form-control" required="required" cols="50" rows="10"></form:textarea>
									</div>
									<div class="form-group">
										<div class="pull-right button-next">
											<input class="btn btn-primary btn-block" type="submit" value="다음">
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script type="text/javascript">
	</script>

</body>
</html>