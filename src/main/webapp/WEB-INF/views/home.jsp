<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
test
test
test
tes

<P>  The time on the server is ${serverTime}. </P>
<a href="profile.do">프로필 페이지 이동</a>
<a href="picture.do">사진수정 페이지 이동</a>
<a href="certification.do">인증현황 페이지 이동</a>
<a href="guest.do">게스트 페이지 이동</a>
<c:if test="${sessionScope.custom_id == null }">
<a href="login.do">로그인 페이지 이동</a>
</c:if>
<c:if test="${sessionScope.custom_id != null }">
<a href="logout.do">로그아웃</a>
</c:if>
<a href="admin/admin.do">어드민 페이지 이동</a>
<a href="host.do">호스트 페이지 이동</a>
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
	
	</script>
</body>
</html>
