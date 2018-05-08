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
									<form:input type="text" path="room_img_code" style="display:none"/>
								<!-- 	<label for="img1" style="border:1px solid;border-radius: 6px">사진추가하기</label> -->
									<input type="file" name="img1" id="img1" /><!-- style="display:none" -->
									<input type="submit" class="btn btn-success" value="사진 올리기" style="margin-top:10px">
								</form:form>
							</div>
							<div class="panel-body">
								<table class="table">
									<tr>
										<th style="width:10%; text-align:center">사진 번호</th>
										<th>사진</th>
										<th>삭제</th>
									</tr>
									<c:forEach var="vo" items="${list}" varStatus="i">
										<tr>
											<td style="width:10%; text-align:center">${i.count}</td>
											<td><img class="count" src="host_imgs_img.do?room_img_code=${vo.room_img_code}" style="width:100px; height:100px;"></td>
											<td>
												<a href="#" class="btn btn-xs btn-danger btn_delete img_delete">삭제</a>
												<input type="text" class="room_img_code" value="${vo.room_img_code}" style="display:none"/>
											</td>
										</tr>
									</c:forEach>
								</table>
								<div class="form-group">
									<div class="pull-right button-next">
										<a href="host_img_next.do" class="btn btn-primary btn-block" >다음</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div style="display:none">
		<input type="text" id="confirm_name" value="${cVO.confirm_name}"/>
		<input type="text" id="confirm_basic" value="${cVO.confirm_basic}"/>
		<input type="text" id="confirm_location" value="${cVO.confirm_location}"/>
		<input type="text" id="confirm_amenity" value="${cVO.confirm_amenity}"/>
		<input type="text" id="confirm_img" value="${cVO.confirm_img}"/>
		<input type="text" id="confirm_price" value="${cVO.confirm_price}"/>
		<input type="text" id="confirm_inout" value="${cVO.confirm_inout}"/>
	</div>
	

	
	<script src="resources/js/sweetalert.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script src="resources/js/hostside.js"></script>
	<script type="text/javascript">
	
		$('.img_delete').click(function(){
			var idx = $(this).index('.img_delete');
			var ic = $('.room_img_code').eq(idx).val();
			swal({
				title: "삭제",
				text: "정말 삭제하시겠습니까?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if(willDelete){
					window.location.href='host_img_delete.do?room_img_code='+ic
				}
			});
		});
			
	</script>

</body>
</html>