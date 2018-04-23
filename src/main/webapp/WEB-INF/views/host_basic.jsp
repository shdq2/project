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
				<h3 class="host-title">기본설정 <small>이 숙소의 기본정보를 등록하세요</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
				
					<div class="col-md-12 col-lg-8">
					<form:form action="host_basic.do" method="post" modelAttribute="vo">
						<div style="display:hidden">
							<form:input type="text" path="room_code"/>
						</div>
					
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">침실 및 침대<br><br>
								<span class="panel-desc">아래 항목들은 게스트들이 숙소를 찾을 때 사용됩니다.</span>
								</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="form-group col-sm-4">
										<label class="control-label">침실수</label>
										<form:select class="form-control" required="required" path="room_number">
											<c:forEach var="i" begin="0" end="10">
												<c:if test="${vo.room_number == i}">
													<option value="${i}">${i}</option>
												</c:if>
												<c:if test="${vo.room_number != i}">
													<option selected="selected" value="${i}">${i}</option>
												</c:if>
											</c:forEach>
											<option>10이상</option>
										</form:select>
									</div>
									<div class="form-group col-sm-4">
										<label class="control-label">침대수</label>
										<form:select class="form-control" required="required" path="room_bed_number">
											<c:forEach var="i" begin="0" end="10">
												<c:if test="${vo.room_bath_number == i}">
													<option value="${i}">${i}</option>
												</c:if>
												<c:if test="${vo.room_bath_number != i}">
													<option selected="selected" value="${i}">${i}</option>
												</c:if>
											</c:forEach>
											<option>10이상</option>
										</form:select>
									</div>
									<div class="form-group col-sm-4">
										<label class="control-label">욕실수</label>
										<form:select class="form-control" required="required" path="room_bath_number">
											<c:forEach var="i" begin="0" end="10">
												<c:if test="${vo.room_bath_number == i}">
													<option value="${i}">${i}</option>
												</c:if>
												<c:if test="${vo.room_bath_number != i}">
													<option selected="selected" value="${i}">${i}</option>
												</c:if>
											</c:forEach>
											<option>10이상</option>
										</form:select>
									</div>
								</div>
							</div>
						</div>
						
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">집/건물</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="form-group col-sm-4">
										<label class="control-label">숙소 종류</label> 
										<form:select class="form-control" required="required" path="room_type">
											<c:forEach var="tmp" items="${str}">
												<c:if test="${vo.room_type eq tmp}">
													<option value="${tmp}" selected="selected">${tmp}</option>
												</c:if>
												<c:if test="${vo.room_type ne tmp}">
													<option value="${tmp}">${tmp}</option>
												</c:if>
											</c:forEach>										
										</form:select>
									</div>
									<div class="form-group col-sm-4">
										<label class="control-label">건물유형</label> 
										<form:select class="form-control" required="required" path="room_building_type">
											<c:forEach var="tmp" items="${str1}">
												<c:if test="${vo.room_building_type eq tmp}">
													<option value="${tmp}" selected="selected">${tmp}</option>
												</c:if>
												<c:if test="${vo.room_building_type ne tmp}">
													<option value="${tmp}">${tmp}</option>
												</c:if>
											</c:forEach>	
										</form:select>
									</div>
									<div class="form-group col-sm-4">
										<label class="control-label">건물평수</label>
										<form:select class="form-control" required="required" path="room_space">
											<option>모름</option>
											<c:forEach var="i" begin="1" end="50">
												<option value="${i}">${i}</option>
											</c:forEach>
											<option>50이상</option>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<div class="pull-right button-next" style="padding-top:10px;">
										<input class="btn btn-primary btn-block" type="submit" value="다음">
									</div>
								</div>
							</div>
						</div>
						
					</form:form>
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