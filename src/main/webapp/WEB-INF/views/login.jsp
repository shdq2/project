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
<link rel="stylesheet" href="resources/css/login.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>

	<div id="img-panel">
		<div id="filter">
		</div>
		<div id="right-panel">
			<div id="register-box">
				<h3>로그인</h3>
				<p>Mr, Mention에 오신것을 환영합니다.</p>
				
				<div id="register-form-login">
					<form:form action="login.do" method="post" modelAttribute="vo">
						<form:input type="text" class="form-control" path="custom_id" placeholder="이메일" /><br />
						<form:input type="password" class="form-control" path="custom_pw" placeholder="비밀번호" /><br />
						<div class="login-form1">
							<div id="form-chk" class="checkbox">
								<input type="checkbox" id="autoLogin" name="chk_login" value="자동 로그인" />
								<label>자동 로그인</label>
							</div>
							<a href="findPw.do" id="findPw">비밀번호가 기억안나세요?</a><br />
						</div>
						<input type="submit" id="btn_login" class="btn btn-primary" value="로그인" style="width: 100%" />
						<div class="reg-btn">
							<a href="register.do" class="btn btn-success">회원가입</a>
						</div>
					</form:form>
				</div>
				
				<p align="left">아이디가 없으세요? <label class="reg-label"><a href="register.do" class="reg-a">회원가입하기</a></label></p>
				<footer class="copyright">
					<p align="center">ⓒ 2015 Crafted by Mr, Mention</p>
				</footer>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/topbar.js"></script>
	<script type="text/javascript" src="resources/js/topbar_menu.js"></script>
	<script type="text/javascript" src="resources/js/rightform.js"></script>
	<script>	
		$(function() {
			
		});
	</script>
</body>
</html>