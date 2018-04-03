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
<link rel="stylesheet" href="resources/css/register.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>

	<div id="img-panel">
		<div id="filter">
		</div>
		<div id="right-panel">
			<div id="register-box">
				<h3>회원가입</h3>
				<p>Mr, Mention에 오신것을 환영합니다.</p>
				
				<div id="register-form-register">
					<form:form action="register.do" method="post" modelAttribute="vo" id="form">
						<form:input type="text" class="form-control" path="custom_name" placeholder="이름" /><br />
						<form:input type="text" class="form-control" path="custom_id" placeholder="이메일" /><br />
						<form:input type="password" class="form-control" path="custom_pw" placeholder="비밀번호" /><br />
						<input type="submit" class="btn btn-primary" value="회원가입" style="width: 100%" />
					</form:form>
				</div>
				
				<p align="left">이미 아이디가 있으신가요? <a href="login.do">로그인하기</a></p>
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
	<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
	<script>
		$(function() {
			$('#form').validate({
				submitHandler:function(){
					return true;
				},
				rules:{
					custom_id:{
						/*
						required : 비어있는지 확인여부  - true/false
						minlength: 최소길이 - 숫자
						digits : 숫자 - true(숫자만가능)/false
						email: 이메일 입력 -true/false
						*/
						required :true,
						email:true,						
						remote:'Json_id_check.do' // 아이디 중복확인
					},
					custom_pw:{
						required :true,
						minlength:6
					},
					custom_name:{
						required :true,
					}
				},
				messages:{
					custom_id:{
						required:'내용이 없습니다',
						email:'유효하지 않은 형식입니다',						
						remote:'사용중인 아이디 입니다'
					},
					custom_pw:{
						required:'내용이 없습니다',
						minlength:"6자 이상 입력하세요"
					},
					custom_name:{
						required :"내용이 없습니다",
					}
				}
			});
		});
	</script>
</body>
</html>