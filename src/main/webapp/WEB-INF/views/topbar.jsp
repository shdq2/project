<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>

<!-- css -->
<link rel="stylesheet" href="resources/css/topbar.css"/>

<div class="topbar Fixed">
	<div class="topbar-menu">
		<button class="topbar-bmenu"></button>
	</div>
	<a href="/" class="topbar-logo"><img src="resources/imgs/logo.png" /></a>
	<div class="topbar-buttons">
		<ul class="topbar-ul">
			<img src="resources/imgs/korean_flag.png" id="topbar-flag" />
			<c:if test="${sessionScope.custom_id eq null}">
			<li class="topbar-li"><a href="login.do">로그인</a></li>
			<li class="topbar-li"><a href="register.do">회원가입</a></li>
			<li class="topbar-li"><a href="help.do">도움말</a></li>
			<li class="topbar-li"><a href="#">한국어</a></li>
			</c:if>
			
			<c:if test="${sessionScope.custom_id ne null}">
			<li class="topbar-li"><a href="#">메시지</a></li>
			<li class="topbar-li"><a href="#">게스트</a></li>
			<li class="topbar-li"><a href="#">호스트</a></li>
			<li class="topbar-li"><a href="help.do">도움말</a></li>
			<li class="topbar-li"><a href="#">한국어</a></li>
			</c:if>
		</ul>
		
		<c:if test="${sessionScope.custom_id ne null}">
		<img src="resources/imgs/user.png" id="topbar-user" /><br/>
		</c:if>
	</div>
</div>

<div class="tmenu">
	<div class="tmenu-1">
		<c:if test="${sessionScope.custom_id eq null}">
		<div class="custom-box lock">
			<div class="lock-icon"></div>
			<div class="lock-text">
				<p>로그인이 필요합니다.</p>
				<p>Mr, Mention 의 서비스를 이용하기 위해서 로그인이 필요합니다.</p>
			</div>
		</div>
		</c:if>
		
		<c:if test="${sessionScope.custom_id ne null}">
			<div class="custom-box unlock">
			<div class="unlock-icon"></div>
			<div class="unlock-text">
				<label style="color: #d200ad">${sessionScope.custom_id}</label><br />
				<label style="color: #626262">${sessionScope.custom_name}</label>
			</div>
		</div>
		</c:if>
		
		<div class="tmenu-list">
			<c:if test="${sessionScope.custom_id eq null}">
			<a href="register.do">
				<i class="glyphicon glyphicon-user menu-icon" aria-hidden="true"></i><span class="menu-title">회원가입</span><span class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a><br />
			<a href="login.do">
				<i class="glyphicon glyphicon-lock menu-icon" aria-hidden="true"></i><span class="menu-title">로그인</span><span class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a><br />
			<a href="help.do">
				<i class="glyphicon glyphicon-question-sign menu-icon" aria-hidden="true"></i><span class="menu-title">도움말</span><span class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a>
			</c:if>
			
			<c:if test="${sessionScope.custom_id ne null}">
			<a href="#" id="list-item1">
				<i class="glyphicon glyphicon-home menu-icon" aria-hidden="true"></i><span class="menu-title">호스트</span><span id="cursor1" class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a>			
			<div id="Acc1" class="w3-hide w3-white w3-card submenu w3-animate-opacity">
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">숙소등록하기</span>
				</a>
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">숙소목록</span>
				</a>
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">예약관리</span>
				</a>
			</div>
			
			<a href="#" id="list-item2">
				<i class="glyphicon glyphicon-briefcase menu-icon" aria-hidden="true"></i><span class="menu-title">게스트</span><span id="cursor2" class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a>
			<div id="Acc2" class="w3-hide w3-white w3-card submenu w3-animate-opacity">
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">여행목록</span>
				</a>
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">찜목록</span>
				</a>
			</div>
			
			
			<a href="#" id="list-item3">
				<i class="glyphicon glyphicon-user menu-icon" aria-hidden="true"></i><span class="menu-title">프로필</span><span id="cursor3" class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a>
			<div id="Acc3" class="w3-hide w3-white w3-card submenu w3-animate-opacity">
				<a href="profile.do" class="w3-bar-item w3-button">
					<span class="smenu-title">프로필보기</span>
				</a>
				<a href="profileEdit.do" class="w3-bar-item w3-button">
					<span class="smenu-title">프로필수정</span>
				</a>
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">사진수정</span>
				</a>
				<a href="#" class="w3-bar-item w3-button">
					<span class="smenu-title">인증현황</span>
				</a>
			</div>
			
			
			<a href="#" id="list-item4">
				<i class="glyphicon glyphicon-cog menu-icon" aria-hidden="true"></i><span class="menu-title">계정관리</span><span id="cursor4" class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a>
			<div id="Acc4" class="w3-hide w3-white w3-card submenu w3-animate-opacity">
				<a href="passwordEdit.do" class="w3-bar-item w3-button">
					<span class="smenu-title">비밀번호변경</span>
				</a>
				<a href="paymentsLog.do" class="w3-bar-item w3-button">
					<span class="smenu-title">결제내역</span>
				</a>
			</div>
			
			
			<a href="help.do">
				<i class="glyphicon glyphicon-question-sign menu-icon" aria-hidden="true"></i><span class="menu-title">도움말</span><span class="menu-arrow glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			</a>
			
			</c:if>
		</div>
		
		<div class="tmenu-2">
			<div class="tmenu-buttons">
				<button type="button" id="btn-logout" onclick="location.href='logout.do'"><i class="glyphicon glyphicon-off" aria-hidden="true"></i></button>
				<button type="button" id="btn-home" onclick="location.href='main.do'"><i class="glyphicon glyphicon-home" aria-hidden="true"></i></button>
			</div>
			<p class="tmenu-2-p">접속하신 단말/브라우저에서 Mr, Mention이 제공하는 일부 기능이 작동하지 않을 수 있다는 점 양해부탁드립니다.</p>
		</div>
	</div>
</div>