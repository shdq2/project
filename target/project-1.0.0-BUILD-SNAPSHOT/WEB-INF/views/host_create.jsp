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
	
		<div class="host-main-create">
			<div class="host-header">
				<h3 class="host-title">숙소 등록하기 <small>Mr. Mention에 숙소를 등록하세요.</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-sm-12 col-md-8">
						<div class="panel">
							<div class="panel-body">
								<form:form action="host_create.do" method="post" modelAttribute="vo">
								<form:input type="hidden" path="room_code" />
								<div  class="row">
									<div class="form-group col-sm-12">
										<label class="col-sm-3 control-label">숙소종류</label>
										<div class="col-sm-9">
											<form:select class="form-control" required="required" path="create_room_type">
												<option selected="selected" value="">선택하세요.</option>
												<option value="원룸">원룸</option>
												<option value="1.5룸">1.5룸</option>
												<option value="투룸(방1개 + 거실1)">투룸(방1개 + 거실1)</option>
												<option value="투룸(방2개)">투룸(방2개)</option>
												<option value="쓰리룸이상">쓰리룸이상</option>
												<option value="복층">복층</option>
												<option value="호텔">호텔</option>
												<option value="리조트">리조트</option>
											</form:select>
										</div>
									</div>
								
									<div class="form-group col-sm-12">
										<label class="col-sm-3 control-label">건물유형</label>
										<div class="col-sm-9">
											<form:select class="form-control" required="required" path="create_building_type">
												<option selected="selected" value="">선택하세요.</option>
												<option value="빌라">빌라</option>
												<option value="원룸">원룸</option>
												<option value="펜션">펜션</option>
												<option value="민박">민박</option>
												<option value="아파트">아파트</option>
												<option value="오피스텔">오피스텔</option>
												<option value="레지던스">레지던스</option>
												<option value="쉐어하우스">쉐어하우스</option>
												<option value="단독주택(독채)">단독주택(독채)</option>
												<option value="단독주택(일부 사용)">단독주택(일부 사용)</option>
												<option value="게스트하우스(개인실)">게스트하우스(개인실)</option>
												<option value="게스트하우스(도미토리)">게스트하우스(도미토리)</option>
											</form:select>
										</div>
									</div>
									<div class="form-group col-sm-12">
										<label class="col-sm-3 control-label">기본 임대 인원</label>
										<div class="col-sm-9">
											<form:select class="form-control" required="required" path="create_basic_member">
												<option selected="selected" value="">선택</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16+</option>
											</form:select>
										</div>
									</div>
									<div class="form-group">
										<div class="pull-right button-next">
											<input class="btn btn-primary btn-block" type="submit" value="다음">
										</div>
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