<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/profile_view.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	
	<div class="profile-container">
		<div class="profile-nav">
			<a href="profile.do" id="profile-list-1">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 보기</span>
			</a>
			<a href="profileEdit.do" id="profile-list-2">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 수정</span>
			</a>
			<a href="profile/picture/edit.do" id="profile-list-3">
				<i class="glyphicon glyphicon-picture menu-icon" aria-hidden="true"></i><span class="menu-title">사진 수정</span>
			</a>
			<a href="profile/certification.do" id="profile-list-4">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">인증 현황</span>
			</a>
		</div>
		
		<div class="profile-main">
			<div class="col-xs-3 col-img">
				<img class="user-picture" src="resources/imgs/no_picture.png" />
			</div>
			<div class="col-xs-9 col-main">
				<div class="profile-box-top">
					<h3 class="top-title">안녕하세요, <!-- ${vo.custom_name} -->입니다!</h3>
					<p class="join-date">Republic of Korea - 회원가입 : <!-- ${vo.custom_date} --></p>
					<p class="introduce">내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 내용 없음 <!-- ${vo.custom_intro} --></p>
					
					<a href="#" id="profile-edit" class="btn btn-default">프로필 수정하기</a>
					<div style="clear: both;"></div>
				</div>
				
				<div class="profile-box-bottom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#detail-1" data-toggle="tab">숙소</a></li>
						<li><a href="#detail-2" data-toggle="tab">게스트후기</a></li>
						<li><a href="#detail-3" data-toggle="tab">호스트후기</a></li>
					</ul>
					
					<div class="tab-content tabs-detail">
						<div class="tab-pane fade in active" id="detail-1">
							<p class="detail-1-p">등록된 숙소가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-2">
							<p class="detail-2-p">등록된 게스트후기가 없습니다.</p>
						</div>
						<div class="tab-pane fade" id="detail-3">
							<p class="detail-3-p">등록된 호스트후기가 없습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/topbar.js"></script>
	<script type="text/javascript" src="resources/js/profile_view.js"></script>
	<script>
		$(function() {
			
		});
	</script>
</body>
</html>