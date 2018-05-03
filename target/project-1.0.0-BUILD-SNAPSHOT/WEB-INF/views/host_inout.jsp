<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" 
	content="width=device-width, initial-scale=1, user-scalable=no">
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
				<h3 class="host-title">
					입/퇴실시간<small> 입/퇴실시간을 설정하세요.</small>
				</h3>
			</div>

			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-8">
						<div class="panel panel-bordered">
							<div class="panel-heading">
								<h3 class="panel-title">게스트의 입/퇴실시간을 설정하세요.</h3>
							</div>
							<div class="panel-body">
								<form:form method="POST" action="host_inout.do" modelAttribute="vo">
									<div style="display:none">
										<input type="text" value="${vo.room_code}">
									</div>
									<div class="form-group">

										<div class="input-group">
											<span class="input-group-addon">입실</span> 
											<form:select class="form-control" path="room_in">
												<c:forEach items="${str}" var="tmp">
													<c:if test="${vo.room_in eq tmp}">
														<option value="${tmp}" selected="selected">${tmp}</option>
													</c:if>
													<c:if test="${vo.room_in ne tmp}">
														<option value="${tmp}">${tmp}</option>
													</c:if>
												</c:forEach>
											</form:select>
										</div>

										<div class="input-group">
											<span class="input-group-addon">퇴실</span> 
											<form:select class="form-control" path="room_out">
												<c:forEach items="${str}" var="tmp">
													<c:if test="${vo.room_out eq tmp}">
														<option value="${tmp}" selected="selected">${tmp}</option>
													</c:if>
													<c:if test="${vo.room_out ne tmp}">
														<option value="${tmp}">${tmp}</option>
													</c:if>
												</c:forEach>
											</form:select>
										</div>
										
									</div>
									<div class="form-group ">
										<div class="pull-right">
											<input class="btn btn-primary btn-block" type="submit" value="저장">
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