<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/nouislider.css" />
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<link rel="stylesheet" href="resources/css/room_search.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>

	<div class="profile-container">
		<div class="profile-main">
			<div id="col-map" class="col-xs-5" style="border: 1px solid #ccc">
				<div id="map" style="height: 100%; width: 100%;"></div>
			</div>
			<div id="col-main" class="col-xs-7">
				<div id="col-search">
					<div id="row-1">
						<select id="div-place" class="form-control">
							<option>부산</option>
						</select>

						<div class="input-group" style="display: block">
							<input id="div-chkin" type="text" class="form-control" id="chkin"
								placeholder="체크인" name="chkin" /> <i class="icon fa-calendar"
								aria-hidden="true" style="width: 30px; height: 30px;"></i> <input
								id="div-chkout" type="text" class="form-control" id="chkout"
								placeholder="체크아웃" name="chkout" /> <i class="icon fa-calendar"
								aria-hidden="true" style="width: 30px; height: 30px;"></i> <select
								id="div-person-count" class="form-control">
								<option>인원</option>
								<option value="1명">1명</option>
								<option value="2명">2명</option>
								<option value="3명">3명</option>
								<option value="4명">4명</option>
								<option value="5명">5명</option>
								<option value="6명">6명</option>
								<option value="7명 이상">7명 이상</option>
							</select>
						</div>
						<div style="clear: both"></div>
					</div>
					<hr style="width: 100%; margin-top: 5px; margin-bottom: 5px;" />
					<div id="row-2">
						<div class="col-md-2 standard">
							<select class="form-control">
								<option value="한달">한달</option>
								<option value="1박">1박</option>
							</select>
						</div>
						<div class="col-md-10" style="margin-top: 5px; height: 50px">
							<div id="slider-range"></div>
							<p style="margin-top: 8px;">
								<label id="a-1"
									style="border: 0; color: #f6931f; font-weight: bold;"></label>
								<label id="a-2"
									style="border: 0; color: #f6931f; font-weight: bold;"></label>
							</p>
						</div>
						<div style="clear: both"></div>
					</div>
					<div id="row-3">
						<div id="div-searchbar">
							<input type="text" id="searchbar" class="form-control"
								name="searchbar" placeholder="방 이름을 입력해주세요." /> <input
								type="button" id="btn-search" class="btn btn-custom"
								value="숙소 검색" />
						</div>
						<div style="clear: both"></div>
					</div>
				</div>
				<hr style="width: 100%; margin-top: 5px; margin-bottom: 5px;" />
				<div id="col-content">
					<div id="row-4">
						<label class="col-md-2 type-title"
							style="margin-bottom: 20px; float: left;">집 유형</label>
						<div class="col-md-8 house-type">
							<div style="clear: both"></div>
							<div class="col-md-4 chk-align">
								<input class="chk" type="checkbox" /><label class="tlabel">원룸</label>
							</div>
							<div class="col-md-4 chk-align">
								<input class="chk" type="checkbox" /><label class="tlabel">1.5룸</label>
							</div>
							<div class="col-md-4 chk-align">
								<input class="chk" type="checkbox" /><label class="tlabel">투룸<br />(방
									1개 + 거실 1개)
								</label>
							</div>
						</div>
						<div id="div-more-1" class="w3-hide"
							style="width: 100%; height: auto; display: inline-block">
							<div style="width: 100%; display: inline-block;">
								<label class="col-md-2 type-title" style="float: left;"></label>
								<div class="col-md-8 house-type" style="">
									<div style="clear: both"></div>
									<div
										class="col-md-4 chk-align checkbox-custom checkbox-primary">
										<input class="chk" type="checkbox" /><label class="tlabel">투룸(방2개)</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">쓰리룸이상</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">복층</label>
									</div>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div style="width: 100%; display: inline-block;">
								<label class="col-md-2 type-title" style="float: left;"></label>
								<div class="col-md-8 house-type">
									<div style="clear: both"></div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">호텔</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">리조트</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-2 div-more" style="margin-bottom: 20px">
							<a href="#" id="more-1" class="moremore">▼더보기</a>
						</div>



						<div style="clear: both; margin: 10px 0px 10px 0px"></div>
						<label class="col-md-2 type-title"
							style="margin-bottom: 20px; float: left;">시설</label>
						<div class="col-md-8 house-type">
							<div style="clear: both"></div>
							<div class="col-md-4 chk-align">
								<input class="chk" type="checkbox" /><label class="tlabel">TV</label>
							</div>
							<div class="col-md-4 chk-align">
								<input class="chk" type="checkbox" /><label class="tlabel">에어콘</label>
							</div>
							<div class="col-md-4 chk-align">
								<input class="chk" type="checkbox" /><label class="tlabel">난방</label>
							</div>
						</div>
						<div id="div-more-2" class="w3-hide"
							style="width: 100%; height: auto; display: inline-block">
							<div style="width: 100%; display: inline-block;">
								<label class="col-md-2 type-title" style="float: left;"></label>
								<div class="col-md-8 house-type" style="">
									<div style="clear: both"></div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">와이파이</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">애완동물
											가능</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">취사</label>
									</div>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div style="width: 100%; display: inline-block;">
								<label class="col-md-2 type-title" style="float: left;"></label>
								<div class="col-md-8 house-type" style="">
									<div style="clear: both"></div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">전자렌지</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">밥솥</label>
									</div>
									<div class="col-md-4 chk-align">
										<input class="chk" type="checkbox" /><label class="tlabel">냉장고</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-2 div-more" style="margin-bottom: 20px">
							<a href="#" id="more-2">▼더보기</a>
						</div>

						<div style="clear: both; margin: 10px 0px 10px 0px"></div>
					</div>

					<div style="clear: both"></div>
					<div class="col-lg-6 col-xlg-6 room-item" style="display: none;"></div>

					<div id="row-5" style="margin-top: 20px">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#detail-1" data-toggle="tab">추천순</a></li>
							<li><a href="#detail-2" data-toggle="tab">후기순</a></li>
							<li><a href="#detail-3" data-toggle="tab">조회순</a></li>
							<li><a href="#detail-4" data-toggle="tab">등록순</a></li>
							<li><a href="#detail-5" data-toggle="tab">낮은가격순</a></li>
							<li><a href="#detail-6" data-toggle="tab">높은가격순</a></li>
						</ul>

						<div class="tab-content tabs-detail">
							<div class="tab-pane fade in active" id="detail-1" style="">
							</div>
							<div class="tab-pane fade" id="detail-2"></div>
							<div class="tab-pane fade" id="detail-3"></div>
							<div class="tab-pane fade" id="detail-4"></div>
							<div class="tab-pane fade" id="detail-5"></div>
							<div class="tab-pane fade" id="detail-6"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/nouislider.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/topbar.js"></script>
	<script type="text/javascript" src="resources/js/room_search.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKORYGgAycyWg8G27QMj_vzTyC-AEEBW0&v=3.exp"></script>
	<script type="text/javascript"
		src="resources/js/CustomGoogleMapMarker.js"></script>
	<script>
	var map;

	function initialize() {
		var myLatlng = new google.maps.LatLng(35.1980, 129.0860);
		var mapOptions = {
			zoom: 11,
			center: myLatlng,
			mapTypeControl: false,
			streetViewControl: false,
			zoomControlOptions: {
				position: google.maps.ControlPosition.RIGHT_TOP
			}
		}
		
		map = new google.maps.Map(document.getElementById('map'), mapOptions);
		var projection = map.getProjection();
		
		addMarker(); //마커 출력
		
		google.maps.event.addListener(map, 'zoom_changed', function() {
			$('#marker-detail').css('visibility', 'hidden');
			var bounds = map.getBounds();
			var ne_lat = bounds.getNorthEast().lat();
			var ne_lng = bounds.getNorthEast().lng();
			var sw_lat = bounds.getSouthWest().lat();
			var sw_lng = bounds.getSouthWest().lng();

			reloadingMarkerDetail();
		});
		
		google.maps.event.addListener(map, 'dragend', function() {
			var bounds = map.getBounds();
			var ne_lat = bounds.getNorthEast().lat();
			var ne_lng = bounds.getNorthEast().lng();
			var sw_lat = bounds.getSouthWest().lat();
			var sw_lng = bounds.getSouthWest().lng();
			
			
		});
	}
	
	function reloadingMarkerDetail() {
		setTimeout(function() { 
			if($('#marker-detail').length>0) {
				var index = $('#marker-detail').attr('data-marker_id');

				$('#marker-detail').remove();
				
				var top = Number($('.marker[data-marker_id~='+ index +']').css('top').replace("px", ""));
				var left = Number($('.marker[data-marker_id~='+ index +']').css('left').replace("px", ""));
				
				$('.marker').parent('div').append('<div id="marker-detail" data-marker_id="'+index+'">'+
						'<img id="mdetail-img" src="'+$('.room-item[data-marker_id~='+ index +'] .room-img').attr('src')+'" />'+
						'<p id="mdetail-p">'+ $('.room-item[data-marker_id~='+ index +'] .room-name').html() +'</p></div>');
				$('#marker-detail').css('top', (top-157)+'px');
				$('#marker-detail').css('left', (left-45)+'px');
			}
		}, 300);
	}
	
	function addMarker() {
		var marker_id = 0;
		
		<c:forEach var='vo' items='${list}'>
			overlay = new CustomMarker(
				new google.maps.LatLng(${vo.map_lat}, ${vo.map_lng}), 
				map,
				{
					marker_id: (++marker_id) + '',
					room_price: '￦ ${vo.room_day}'
				}
			);

			$('#detail-1.tab-pane').append('<div class="col-lg-6 col-xlg-6 room-item" data-marker_id="'+ marker_id +'">'+
			'<img class="room-img" src="/project/resources/imgs/room_default.jpg" />' +
			'<div style="width: 200px; height: 64px; background: #526069; position: absolute; bottom: 150px; opacity: 0.85">' +
			'<h5>1박&nbsp;&nbsp;￦ ${vo.room_day} (최소 1박)<br />한달 ￦ ${vo.room_month} (최소 1박)</h5></div>' +
			'<div style="position: absolute; width: 76px; height: 76px; right: 40px; bottom: 110px; background: white; border: 3px solid white; border-radius: 60px; background-image: url(/project/resources/imgs/avatar.png); background-size: 70px 70px;"></div>' +
			'<div class="room-panel">' +
			'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin: 3px">' +
			'<span class="room-name">${vo.room_name}</span></div>' +
			'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin: 3px">' +
			'<span style="color: #c1c1c1">${vo.room_type}</span> <i class="glyphicon glyphicon-map-marker" style="font-size: 8pt; color: #c1c1c1"></i> <span style="color: #c1c1c1">${vo.room_addr}</span></div>' +
			'<div class="heart-icon" style="display: inline-block; padding: 5px 15px 15px 15px; clear: both; width: auto; height: auto; margin: 3px; text-align: center;">' +
			'<i class="glyphicon glyphicon-heart-empty" style="font-size: 16pt; color: #a50d73"></i><br/><span>${vo.room_like}</span></div></div></div>');
		</c:forEach>
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</body>
</html>