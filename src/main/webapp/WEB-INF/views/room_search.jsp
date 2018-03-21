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
				<div id="row-1">
					<select id="div-place" class="form-control">
						<option>부산</option>
					</select>
						
					<div class="input-group" style="display: block">
						<input id="div-chkin" type="text" class="form-control" id="chkin" placeholder="체크인" name="chkin" />
						<i class="icon fa-calendar" aria-hidden="true" style="width: 30px; height: 30px;"></i>
						
						<input id="div-chkout" type="text" class="form-control" id="chkout" placeholder="체크아웃"	name="chkout" />
						<i class="icon fa-calendar" aria-hidden="true" style="width: 30px; height: 30px;"></i>
						
						<select id="div-person-count" class="form-control">
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
						<p style="margin-top: 15px;">
							<label id="a-1" style="border:0; color:#f6931f; font-weight:bold;"></label>
							<label id="a-2" style="border:0; color:#f6931f; font-weight:bold;"></label>
						</p>
					</div>
					<div style="clear: both"></div>
				</div>
				<div id="row-3">
					<div id="div-searchbar">
						<input type="text" id="searchbar" class="form-control"
							name="searchbar" placeholder="방 이름을 입력해주세요." />
						<input
							type="button" id="btn-search" class="btn btn-custom"
							value="숙소 검색" />
					</div>
					<div style="clear: both"></div>
				</div>
				<hr style="width: 100%; margin-top: 5px; margin-bottom: 5px;" />
				<div id="row-4">
					<label class="col-md-2 type-title" style="margin-bottom: 20px; float: left;">집 유형</label>
					<div class="col-md-8 house-type">
						<div style="clear: both"></div>
						<div class="col-md-4 chk-align">
							<input class="chk" type="checkbox" /><label class="tlabel">원룸</label>
						</div>
						<div class="col-md-4 chk-align">
							<input class="chk" type="checkbox" /><label class="tlabel">1.5룸</label>
						</div>
						<div class="col-md-4 chk-align">
							<input class="chk" type="checkbox" /><label class="tlabel">투룸<br />(방 1개 + 거실 1개)</label>
						</div>
					</div>
					<div id="div-more-1" class="w3-hide" style="width: 100%; height: auto; display: inline-block">
						<div style="width: 100%; display: inline-block;">
							<label class="col-md-2 type-title" style="float: left;"></label>
							<div class="col-md-8 house-type" style="">
								<div style="clear: both"></div>
								<div class="col-md-4 chk-align checkbox-custom checkbox-primary">
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
							<div class="col-md-8 house-type" style="height: auto;">
								<div style="clear: both"></div>
								<div class="col-md-4 chk-align">
									<input class="chk" type="checkbox" /><label class="tlabel">호텔</label>
								</div>
								<div class="col-md-4 chk-align" style="margin-bottom: 20px">
									<input class="chk" type="checkbox" /><label class="tlabel">리조트</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2 div-more" style="margin-bottom: 20px">
						<a href="#" id="more-1">▼더보기</a>
					</div>
					
					
					
					<div style="clear: both; margin: 10px 0px 10px 0px"></div>
					<label class="col-md-2 type-title" style="margin-bottom: 20px; float: left;">시설</label>
					<div id="facility-type" class="col-md-8">
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
					<div id="div-more-2" class="w3-hide" style="width: 100%; height: auto; display: inline-block">
						<div style="width: 100%; display: inline-block;">
							<label class="col-md-2 type-title" style="float: left;"></label>
							<div class="col-md-8 house-type" style="">
								<div style="clear: both"></div>
								<div class="col-md-4 chk-align">
									<input class="chk" type="checkbox" /><label class="tlabel">와이파이</label>
								</div>
								<div class="col-md-4 chk-align">
									<input class="chk" type="checkbox" /><label class="tlabel">애완동물 가능</label>
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
								<div class="col-md-4 chk-align" style="margin-bottom: 20px">
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
				
				<div id="row-5" style="margin-top: 20px">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#detail-1" data-toggle="tab">추천순</a></li>
						<li><a href="#detail-2" data-toggle="tab">후기순</a></li>
						<li><a href="#detail-3" data-toggle="tab">조회순</a></li>
						<li><a href="#detail-3" data-toggle="tab">등록순</a></li>
						<li><a href="#detail-3" data-toggle="tab">낮은가격순</a></li>
						<li><a href="#detail-3" data-toggle="tab">높은가격순</a></li>
					</ul>
					
					<div class="tab-content tabs-detail">
						<div class="tab-pane fade in active" id="detail-1">
							<p class="detail-p">등록된 숙소가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-2">
							<p class="detail-p">등록된 게스트후기가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-3">
							<p class="detail-p">등록된 호스트후기가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-4">
							<p class="detail-p">등록된 숙소가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-5">
							<p class="detail-p">등록된 게스트후기가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-6">
							<p class="detail-p">등록된 호스트후기가 없습니다.</p>
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
	<script>	
		function initMap() {
			var pusan = {
				lat : 35.200362,
				lng : 129.082922
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 11,
				center : pusan,
				mapTypeControl: false,
				streetViewControl: false,
				scaleControl: true,
				scaleControlOptions: {
					position: google.maps.ControlPosition.LEFT_CENTER
				}
			});
			/* var marker = new google.maps.Marker({
			  position: uluru,
			  map: map
			}); */
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKORYGgAycyWg8G27QMj_vzTyC-AEEBW0&callback=initMap"></script>
</body>
</html>