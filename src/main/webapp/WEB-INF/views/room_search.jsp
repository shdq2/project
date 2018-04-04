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
							<select id="day_type" class="form-control">
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
					<div class="col-lg-6 col-xlg-6" style="display: none;"></div>

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
					
					<div id="row-6" style="width: 100%; position: relative; display: inline-block; text-align: center">
						<ul id="pagination" class="pagination-sm" style=""></ul>
					</div>					
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/nouislider.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/topbar.js"></script>
	<script type="text/javascript" src="resources/js/room_search.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKORYGgAycyWg8G27QMj_vzTyC-AEEBW0&v=3.exp"></script>
	<script type="text/javascript"
		src="resources/js/CustomGoogleMapMarker.js"></script>
	<script>
	var map;
	var marker_list;
	var ne_lat, ne_lng, sw_lat, sw_lng;
	var count = 0;
	var active_tab = $('.tab-pane.fade.in.active').attr('id');
	var day_type = '한달';
	
	$('.nav-tabs li').click(function() {
		var index = $('.nav-tabs li').index(this) + 1;
		active_tab = 'detail-' + index;
		
		$('.marker').remove();
		$('#marker-detail').remove();
		
		$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
      		 "ne_lng" : ne_lng,
   		 "sw_lat" : sw_lat,
   		 "sw_lng" : sw_lng,
   		 "active_tab" : active_tab,
   		 "day_type" : day_type,
   		 "page" : 0 }, function(data) {
		    
   			var room_code = $('#marker-detail').attr('data-room_code');
   			marker_list = data;
   			addMarkerPost(marker_list, room_code);
   			
   			var total = ((data[0].room_count-1)/10) + 1;
   			
   			$('#pagination').twbsPagination('destroy');
   			
   			$('#pagination').twbsPagination({
   		        totalPages: total,
   		        visiblePages: 7,
   		        onPageClick: function (event, page) {
   		        	page = (page-1) * 10;

   		        	$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
   			       		 "ne_lng" : ne_lng,
   			    		 "sw_lat" : sw_lat,
   			    		 "sw_lng" : sw_lng,
   			    		 "active_tab" : active_tab,
   			    		 "day_type" : day_type,
   			    		 "page" : page }, function(data) {
   						$('.marker').remove();
   						$('#marker-detail').remove();

   						marker_list = data;
   						addMarkerPost(marker_list, 0);
   					});
   		    	}
   		    });
   		 });
	});
	
	$('#day_type').change(function() {
		day_type = $('#day_type').val();
		
		$('.marker').remove();
		$('#marker-detail').remove();
		
		$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
      		 "ne_lng" : ne_lng,
   		 "sw_lat" : sw_lat,
   		 "sw_lng" : sw_lng,
   		 "active_tab" : active_tab,
   		 "day_type" : day_type,
   		 "page" : 0 }, function(data) {
		    	var room_code = $('#marker-detail').attr('data-room_code');
   			marker_list = data;
   			addMarkerPost(marker_list, room_code);
   			
   			var total = ((data[0].room_count-1)/10) + 1;
   			
   			$('#pagination').twbsPagination('destroy');
   			
   			$('#pagination').twbsPagination({
   		        totalPages: total,
   		        visiblePages: 7,
   		        onPageClick: function (event, page) {
   		        	page = (page-1) * 10;
   		        	
   		        	$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
   			       		 "ne_lng" : ne_lng,
   			    		 "sw_lat" : sw_lat,
   			    		 "sw_lng" : sw_lng,
   			    		 "active_tab" : active_tab,
   			    		 "day_type" : day_type,
   			    		 "page" : page }, function(data) {
   						$('.marker').remove();
   						$('#marker-detail').remove();

   						marker_list = data;
   						addMarkerPost(marker_list, 0);
   					});
   		    	}
   		    });
   		 });
	});

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
		
		google.maps.event.addListener(map, 'tilesloaded', function() {
			if(count == 0) {
				var bounds = map.getBounds();
				ne_lat = bounds.getNorthEast().lat();
				ne_lng = bounds.getNorthEast().lng();
				sw_lat = bounds.getSouthWest().lat();
				sw_lng = bounds.getSouthWest().lng();
				
				$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
		       		 "ne_lng" : ne_lng,
		    		 "sw_lat" : sw_lat,
		    		 "sw_lng" : sw_lng,
		    		 "active_tab" : active_tab,
		    		 "day_type" : day_type,
		    		 "page" : 0 }, function(data) {
				    	var room_code = $('#marker-detail').attr('data-room_code');
		    			marker_list = data;
		    			addMarkerPost(marker_list, room_code);
		    			
		    			var total = parseInt(((data[0].room_count-1)/10) + 1);
		    			
		    			$('#pagination').twbsPagination('destroy');
		    			
		    			$('#pagination').twbsPagination({
		    		        totalPages: total,
		    		        visiblePages: 7,
		    		        onPageClick: function (event, page) {
		    		        	page = (page-1) * 10;
		    		        	
		    		        	console.log('page : ' + page);
		    		        	
		    		        	$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
		    			       		 "ne_lng" : ne_lng,
		    			    		 "sw_lat" : sw_lat,
		    			    		 "sw_lng" : sw_lng,
		    			    		 "active_tab" : active_tab,
		    			    		 "day_type" : day_type,
		    			    		 "page" : page }, function(data) {
		    						$('.marker').remove();
		    						$('#marker-detail').remove();

		    						marker_list = data;
		    						addMarkerPost(marker_list, 0);
		    					});
		    		    	}
		    		    });
	
		    			setTimeout(function() {
	    					reloadingMarkerDetail();
			    		}, 300);
	    		 });
				count = count + 1;
			}
		});
		
		google.maps.event.addListener(map, 'zoom_changed', function() {
			$('.marker').remove();
			$('#marker-detail').css('visibility', 'hidden');
			
			var bounds = map.getBounds();
			ne_lat = bounds.getNorthEast().lat();
			ne_lng = bounds.getNorthEast().lng();
			sw_lat = bounds.getSouthWest().lat();
			sw_lng = bounds.getSouthWest().lng();
			
			$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
	       		 "ne_lng" : ne_lng,
	    		 "sw_lat" : sw_lat,
	    		 "sw_lng" : sw_lng,
	    		 "active_tab" : active_tab,
	    		 "day_type" : day_type,
	    		 "page" : 0 }, function(data) {
			    	var room_code = $('#marker-detail').attr('data-room_code');
	    			marker_list = data;
	    			addMarkerPost(marker_list, room_code);
	    			
	    			$('#pagination').twbsPagination('destroy');
	    			
	    			var total = ((data[0].room_count-1)/10) + 1;
	    			
	    			$('#pagination').twbsPagination({
	    		        totalPages: total,
	    		        visiblePages: 7,
	    		        onPageClick: function (event, page) {
	    		        	page = (page-1) * 10;
	    		        	$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
	    			       		 "ne_lng" : ne_lng,
	    			    		 "sw_lat" : sw_lat,
	    			    		 "sw_lng" : sw_lng,
	    			    		 "active_tab" : active_tab,
	    			    		 "day_type" : day_type,
	    			    		 "page" : page }, function(data) {
	    						$('.marker').remove();
	    						$('#marker-detail').remove();

	    						marker_list = data;
	    						addMarkerPost(marker_list, 0);
	    					});
	    		    	}
	    		    });

	    			setTimeout(function() {
    					reloadingMarkerDetail();
		    		}, 300);
    		 });
		});
		
		google.maps.event.addListener(map, 'dragend', function() {
			$('.marker').remove();
			$('#marker-detail').css('visibility', 'hidden');
			
			var bounds = map.getBounds();
			ne_lat = bounds.getNorthEast().lat();
			ne_lng = bounds.getNorthEast().lng();
			sw_lat = bounds.getSouthWest().lat();
			sw_lng = bounds.getSouthWest().lng();
			
			$('#pagination').twbsPagination('destroy');
			
			$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
	       		 "ne_lng" : ne_lng,
	    		 "sw_lat" : sw_lat,
	    		 "sw_lng" : sw_lng,
	    		 "active_tab" : active_tab,
	    		 "day_type" : day_type,
	    		 "page" : 0 }, function(data) {
			    	var room_code = $('#marker-detail').attr('data-room_code');
	    			marker_list = data;
	    			addMarkerPost(marker_list, room_code);
	    			
					$('#pagination').twbsPagination('destroy');
	    			
	    			var total = ((data[0].room_count-1)/10) + 1;
	    			
	    			$('#pagination').twbsPagination({
	    		        totalPages: total,
	    		        visiblePages: 7,
	    		        onPageClick: function (event, page) {
	    		        	page = (page-1) * 10;
	    		        	
	    		        	$.post('boundsInMarker.do', { "ne_lat" : ne_lat,
	    			       		 "ne_lng" : ne_lng,
	    			    		 "sw_lat" : sw_lat,
	    			    		 "sw_lng" : sw_lng,
	    			    		 "active_tab" : active_tab,
	    			    		 "day_type" : day_type,
	    			    		 "page" : page }, function(data) {
			    		        	
	    						$('.marker').remove();
	    						$('#marker-detail').remove();

	    						marker_list = data;
	    						addMarkerPost(marker_list, 0);
	    					});
	    		    	}
	    		    });

	    			setTimeout(function() {
    					reloadingMarkerDetail();
		    		}, 300);
    		 });
		});
	}
	
	function checkMarker(room_code) {
		for(var i=0; i<marker_list.length; i++) {
			if(room_code == marker_list[i].room_code) {
				return false;
			}
		}
		return true;
	}
	
	function reloadingMarkerDetail() {
		if($('#marker-detail').length>0) {
			var index = $('#marker-detail').attr('data-marker_id');
			var room_code = $('#marker-detail').attr('data-room_code');
			
			if(checkMarker(room_code)) {
				$('#marker-detail').remove();
			} else {	
				var top = Number($('.marker[data-room_code~='+ room_code +']').css('top').replace('px', ''));
				var left = Number($('.marker[data-room_code~='+ room_code +']').css('left').replace('px', ''));
				
				$('#marker-detail').remove();
				
				$('.marker').parent('div').append('<div id="marker-detail" data-marker_id="'+index+'" data-room_code="'+ room_code +'">'+
						'<img id="mdetail-img" src="'+$('.room-item[data-room_code~='+ room_code +'] .room-img').attr('src')+'" />'+
						'<p id="mdetail-p">'+ $('.room-item[data-room_code~='+ room_code +'] .room-name').html() +'</p></div>');
				$('#marker-detail').css('top', (top-157)+'px');
				$('#marker-detail').css('left', (left-45)+'px');
			}
		}
	}
	
	function addMarkerPost(list, r) {
		var marker_id = 0;
		var image;
		
		$('.room-item').remove();
		
		$('#col-content').scrollTop(0);

		for(var i=0; i<list.length; i++) {
			var room_code = list[i].room_code;
			
			if(r == room_code) {
				overlay = new CustomMarker(
						new google.maps.LatLng(list[i].map_lat, list[i].map_lng), 
						map,
						{
							marker_id: marker_id + '',
							bg_image: 'url("/project/resources/imgs/price_marker_mouse_on.png")',
							z_index: '999',
							room_code: room_code + '',
							room_price: '￦ ' + list[i].room_day
						}
					);
			} else {
				overlay = new CustomMarker(
						new google.maps.LatLng(list[i].map_lat, list[i].map_lng), 
						map,
						{
							marker_id: marker_id + '',
							bg_image: 'url("/project/resources/imgs/price_marker.png")',
							z_index: marker_id+'',
							room_code: room_code + '',
							room_price: '￦ ' + list[i].room_day
						}
					);
			}

			$('#'+ active_tab +'.tab-pane').append('<div class="col-lg-6 col-xlg-6 room-item" data-marker_id="'+ marker_id +'" data-room_code="'+ room_code +'">'+
			'<img class="room-img" src="/project/resources/imgs/room_default.jpg" />' +
			'<div style="width: 200px; height: 64px; background: #526069; position: absolute; bottom: 150px; opacity: 0.85">' +
			'<h5>1박&nbsp;&nbsp;￦ '+ numberWithCommas(parseInt(list[i].room_day)) +' (최소 1박)<br />한달 ￦ '+ numberWithCommas(parseInt(list[i].room_month)) +' (최소 1박)</h5></div>' +
			'<div style="position: absolute; width: 76px; height: 76px; right: 40px; bottom: 110px; background: white; border: 3px solid white; border-radius: 60px; background-image: url(/project/resources/imgs/avatar.png); background-size: 70px 70px;"></div>' +
			'<div class="room-panel">' +
			'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin: 3px">' +
			'<span class="room-name">'+ list[i].room_name +'</span></div>' +
			'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin: 3px">' +
			'<span style="color: #c1c1c1">'+ list[i].room_type +'</span> <i class="glyphicon glyphicon-map-marker" style="font-size: 8pt; color: #c1c1c1"></i> <span style="color: #c1c1c1">'+ list[i].room_addr +'</span></div>' +
			'<div class="heart-icon" style="display: inline-block; padding: 5px 15px 15px 15px; clear: both; width: auto; height: auto; margin: 3px; text-align: center;">' +
			'<i class="glyphicon glyphicon-heart-empty" style="font-size: 16pt; color: #a50d73"></i><br/><span>'+ list[i].room_like +'</span></div></div></div>');
			
			marker_id = marker_id + 1;
		}
	}
	
	//가격 slider
	
	var nonLinearSlider = document.getElementById('slider-range');

	noUiSlider.create(nonLinearSlider, {
		connect: true,
		behaviour: 'tap',
		start: [ 0, 3000000 ],
		range: {
			// Starting at 500, step the value by 500,
			// until 4000 is reached. From there, step by 1000.
			'min': [ 0, 100 ],
			'40%': [ 100000, 1000 ],
			'70%': [ 1000000, 100000 ],
			'max': [ 3000000 ]
		}
	});
	
	var nodes = [
		document.getElementById('a-1'), // 0
		document.getElementById('a-2')  // 1
	];

	nonLinearSlider.noUiSlider.on('update', function ( values, handle, unencoded, isTap, positions ) {
		nodes[handle].innerHTML = '￦' + numberWithCommas(parseInt(values[handle]));

		active_tab = $('.tab-pane.fade.in.active').attr('id');
		
		$.post('moveSlider.do', { "min_price" : parseInt(values[0]), "max_price" : parseInt(values[1]), "active_tab" : active_tab, "day_type" : day_type, "page" : 0 }, function(data) {
			if(data != null) {			
				$('.marker').remove();
				$('#marker-detail').remove();
				
	   			marker_list = data;
	   			addMarkerPost(marker_list, 0);
	   			
	   			$('#pagination').twbsPagination('destroy');
    			
    			//var total = ((data[0].room_count-1)/10) + 1;
    			var total = 1;
    			$('#pagination').twbsPagination({
    		        totalPages: total,
    		        visiblePages: 7,
    		        onPageClick: function (event, page) {
    		        	page = (page-1) * 10;
    		        	
    		        	$.post('moveSlider.do', { "min_price" : parseInt(values[0]), "max_price" : parseInt(values[1]), "active_tab" : active_tab, "day_type" : day_type, "page" : page }, function(data) {
    						$('.marker').remove();
    						$('#marker-detail').remove();

    						marker_list = data;
    						addMarkerPost(marker_list, 0);
    					});
    		    	}
    		    });
			}
		 }).fail(function() {
			 console.log('fail');
			$('.marker').remove();
			$('#marker-detail').remove();
		 });
		
		if(values[handle] == 3000000 && handle != 0) {
			nodes[handle].innerHTML += '+';
		}
	});
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	</script>
</body>
</html>