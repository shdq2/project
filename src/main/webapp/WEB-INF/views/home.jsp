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
<a href="profile.do">이동!</a>
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		console.log('test');
		sessionStorage.setItem('chk',1);
		console.log(sessionStorage.getItem('chk'));
		console.log(${sessionScope.chk});
	</script>
</body>
</html>
