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
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">게스트는 검색결과에서 숙소의 대략적인 위치만 볼 수 있습니다. 정확한 주소는 비공개이며 숙소를 예약한 게스트에게만 공개됩니다.</h3>
							</div>
							<div class="panel-body">
								<div  style="width:90%; height:400px" id="map">
								</div>
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
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKORYGgAycyWg8G27QMj_vzTyC-AEEBW0&callback=initMap"></script>
	<script type="text/javascript">
		var marker;
	    var m; //변경한 좌표 저장
	 
	    function initMap() {
	         var pusan = {lat: 35.1980, lng: 129.0860};
	         var map = new google.maps.Map(document.getElementById('map'), {
	           zoom: 11,
	           center: pusan
	         });
	         marker = new google.maps.Marker({
	           position: pusan,
	           map: map
	         });
	         
	         map.addListener('click', function(e) {
	            m = {lat: e.latLng.lat(), lng: e.latLng.lng()};
	           //map.setCenter(e.latLng);
	           map.panTo(e.latLng);
	           marker.setMap(null); //이전 마크 삭제
	           
	           marker = new google.maps.Marker({
	              position: m,
	              map: map,
	              animation: google.maps.Animation.DROP
	            });
	       });
	       }
	</script>

</body>
</html>