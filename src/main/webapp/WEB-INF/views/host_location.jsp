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
				<h3 class="host-title">위치 <small>숙소의 위치를 설정하세요</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-9">
						<form:form action="host_location.do" method="post" modelAttribute="vo">
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">게스트는 검색결과에서 숙소의 대략적인 위치만 볼 수 있습니다. 정확한 주소는 비공개이며 숙소를 예약한 게스트에게만 공개됩니다.</h3>
							</div>
							<div class="panel-body">
								<div class="form-inline">
									<form:input class="form-control" type="text" id="sample5_address" style="width:80%" placeholder="주소" path="room_addr"/>
									<input type="button" class="btn btn-default" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
								</div>
							</div>
							<div class="panel-body">
								<div id="map" style="width:400px;height:400px;"></div>
							</div>
							<div class="panel-body">
								<div class="pull-right">
									<input type="submit" value="다음" class="btn btn-primary"/>
								</div>
							</div>
						</div>
						</form:form>
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
	<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKORYGgAycyWg8G27QMj_vzTyC-AEEBW0&callback=initMap"></script> -->
	<script src="resources/js/hostside.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 다음 우편번호 API -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58df2cba0566c75d227184822ceff298&libraries=services"></script>
	<script type="text/javascript">
	   
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		window.onloadfunction sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 기본 주소가 도로명 타입일때 조합한다.
							if (data.addressType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 주소 정보를 해당 필드에 넣는다.
							document.getElementById("sample5_address").value = fullAddr;
							// 주소로 상세 정보를 검색
							geocoder.addressSearch(data.address, function(
									results, status) {
								// 정상적으로 검색이 완료됐으면
								if (status === daum.maps.services.Status.OK) {

									var result = results[0]; //첫번째 결과의 값을 활용

									// 해당 주소에 대한 좌표를 받아서
									var coords = new daum.maps.LatLng(result.y,
											result.x);
									// 지도를 보여준다.
									mapContainer.style.display = "block";
									map.relayout();
									// 지도 중심을 변경한다.
									map.setCenter(coords);
									// 마커를 결과값으로 받은 위치로 옮긴다.
									marker.setPosition(coords)
								}
							});
						}
					}).open();
				}
	</script>

</body>
</html>