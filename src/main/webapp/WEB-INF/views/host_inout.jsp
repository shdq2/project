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
								<form method="POST"
									action="http://www.mrmention.co.kr/user/rooms/3586/calendar"
									accept-charset="UTF-8" id="editRoomForm">
									<input name="_method" type="hidden" value="PUT"><input
										name="_token" type="hidden"
										value="mXHLWNYjQSKCEUj6aJpb9tMuBhT3O7po7YcjMe8y">

									<div class="input-daterange  form-group">

										<div class="input-group">
											<span class="input-group-addon"> <i aria-hidden="true"
												class="icon wb-time"></i> 입실
											</span> <select class="form-control" name="calendar[check_in_time]"><option
													value="09:00:00">09:00:00</option>
												<option value="10:00:00">10:00:00</option>
												<option value="11:00:00">11:00:00</option>
												<option value="12:00:00">12:00:00</option>
												<option value="13:00:00">13:00:00</option>
												<option value="14:00:00">14:00:00</option>
												<option value="15:00:00">15:00:00</option>
												<option value="16:00:00">16:00:00</option>
												<option value="17:00:00">17:00:00</option>
												<option value="18:00:00">18:00:00</option>
												<option value="19:00:00">19:00:00</option>
												<option value="20:00:00">20:00:00</option>
												<option value="21:00:00">21:00:00</option>
												<option value="22:00:00">22:00:00</option>
												<option value="23:00:00">23:00:00</option>
												<option value="00:00:00" selected="selected">00:00:00</option></select>
										</div>

										<div class="input-group">
											<span class="input-group-addon"> <i aria-hidden="true"	class="icon wb-time"></i> 퇴실
											</span> <select class="form-control" name="calendar[check_out_time]"><option
													value="09:00:00">09:00:00</option>
												<option value="10:00:00">10:00:00</option>
												<option value="11:00:00">11:00:00</option>
												<option value="12:00:00">12:00:00</option>
												<option value="13:00:00">13:00:00</option>
												<option value="14:00:00">14:00:00</option>
												<option value="15:00:00">15:00:00</option>
												<option value="16:00:00">16:00:00</option>
												<option value="17:00:00">17:00:00</option>
												<option value="18:00:00">18:00:00</option>
												<option value="19:00:00">19:00:00</option>
												<option value="20:00:00">20:00:00</option>
												<option value="21:00:00">21:00:00</option>
												<option value="22:00:00">22:00:00</option>
												<option value="23:00:00">23:00:00</option>
												<option value="00:00:00" selected="selected">00:00:00</option></select>
										</div>

									</div>
									<div class="form-group ">
										<div class="col-sm-2 pull-right">
											<input class="btn btn-primary btn-block" type="submit"
												value="저장">
										</div>
									</div>
								</form>
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