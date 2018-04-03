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
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">침실 및 침대<br><br>
								<span class="panel-desc">아래 항목들은 게스트들이 숙소를 찾을 때 사용됩니다.</span>
								</h3>
							</div>
							<div class="panel-body">
								<form:form method="POST" >
									<div class="row">
										<div class="form-group col-sm-4">
											<label class="control-label">침실수</label>
											<select class="form-control" required="required">
												<c:forEach var="i" begin="0" end="10">
													<option>${i}</option>
												</c:forEach>
												<option>10이상</option>
											</select>
										</div>
										<div class="form-group col-sm-4">
											<label class="control-label">침대수</label>
											<select class="form-control" required="required">
												<c:forEach var="i" begin="0" end="10">
													<option>${i}</option>
												</c:forEach>
												<option>10이상</option>
											</select>
										</div>
										<div class="form-group col-sm-4">
											<label class="control-label">욕실수</label>
											<select class="form-control" required="required">
												<c:forEach var="i" begin="0" end="10">
													<option>${i}</option>
												</c:forEach>
												<option>10이상</option>
											</select>
										</div>
									</div>
								</form:form>
							</div>
						</div>
						
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">집/건물</h3>
							</div>
							<div class="panel-body">
								<form:form method="POST" >
									<div class="row">
										<div class="form-group col-sm-4">
											<label class="control-label">숙소 종류</label> 
											<select class="form-control" required="required">
												<option	selected="selected">원룸</option>
												<option value="6">1.5룸</option>
												<option value="8">투룸(방1개 + 거실1)</option>
												<option value="2">투룸(방2개)</option>
												<option value="3">쓰리룸이상</option>
												<option value="5">복층</option>
												<option value="9">호텔</option>
												<option value="10">리조트</option>
											</select>
										</div>
										<div class="form-group col-sm-4">
											<label class="control-label">침대수</label> 
											<select class="form-control" required="required">
												<option	value="13" selected="selected">빌라</option>
												<option value="11">원룸</option>
												<option value="5">펜션</option>
												<option value="6">민박</option>
												<option value="1">아파트</option>
												<option value="3">오피스텔</option>
												<option value="4">레지던스</option>
												<option value="12">쉐어하우스</option>
												<option value="2">단독주택(독채)</option>
												<option value="10">단독주택(일부 사용)</option>
												<option value="7">게스트하우스(개인실)</option>
												<option value="9">게스트하우스(도미토리)</option>
											</select>
										</div>
										<div class="form-group col-sm-4">
											<label class="control-label">욕실수</label>
											<select class="form-control" required="required">
												<option>모름</option>
												<c:forEach var="i" begin="1" end="50">
													<option>${i}</option>
												</c:forEach>
												<option>50이상</option>
											</select>
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