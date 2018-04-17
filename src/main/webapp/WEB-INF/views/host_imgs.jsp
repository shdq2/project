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
				<h3 class="host-title">사진 <small>사진과 동영상을 등록하세요.</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-9">
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">사진이 많을수록 많이 찾게 됩니다.</h3>
							</div>
							<div class="panel-body">
								<form:form action="host_imgs.do" method="post" modelAttribute="vo" enctype="multipart/form-data">
									<form:input type="text" path="room_img_code" /><br/>
								<!-- 	<label for="img1" style="border:1px solid;border-radius: 6px">사진추가하기</label> -->
									<input type="file" name="img1" id="img1" /><!-- style="display:none" -->
									<input type="submit" class="btn btn-success" value="사진 올리기">
								</form:form>
							</div>
							<div class="panel-body">
								<table class="table">
									<tr>
										<td>번호</td>
										<td>사진</td>
										<td>수정/삭제</td>
									</tr>
									<c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.room_code}</td>
											<td><img src="host_imgs_img.do?room_img_code=${vo.room_img_code}" style="width:200px; height:50px;"></td>
											<td>
												<a href="#" class="btn btn-xs btn-success btn_update">수정</a>
												<a href="#" class="btn btn-xs btn-danger btn_delete">삭제</a>	
											</td>
										</tr>
									</c:forEach>
								</table>
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
	<script type="text/javascript">
	
	$(function(){
	})
	</script>

</body>
</html>