<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	
		<jsp:include page="host_list_side.jsp"></jsp:include>
		
		<div class="host-main">
			<div class="host-header">
				<h3 class="host-title">숙소 목록 <small>Room list</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
				
					<div class="col-md-12 col-lg-12">
						<div class="panel">
							<div class="panel-body">
								<form:form action="/host_list.do" method="post" modelAttribute="list">
									<table class="table">
										<thead>
											<tr>
												<td>No</td>
												<td>방 사진</td>
												<td>상태</td>
												<td>제목</td>
												<td>설명</td>
												<td>관리</td>
											</tr>
										</thead>
										<c:if test="${empty list}">
											<tbody>
												<tr>
													<td colspan="6" style="text-align:center">조회 된 내용이 없습니다.</td>
												</tr>
											</tbody>
										</c:if>
										<tbody>
											<c:forEach var="tmp" items="${list}" varStatus="i">
												<tr>
													<td>${fn:length(list)-i.index}</td>
													<c:if test="${tmp.room_img_code ne 0}">
														<td style="width:20%">
															<img src="host_imgs_img.do?room_img_code=${tmp.room_img_code}" style="width:100px; height:100px;">
														</td>
													</c:if>
													<c:if test="${tmp.room_img_code eq 0}">
														<td style="width:20%">
															<img src="resources/imgs/default.png" style="width:100px; height:100px;">
														</td>
													</c:if>
													<td style="width:10%"></td>
													<c:if test="${tmp.room_name eq null}">
														<td>없음</td>
													</c:if>
													<c:if test="${tmp.room_name ne null}">
														<td>${tmp.room_name}</td>
													</c:if>
													<c:if test="${tmp.room_content eq null}">
														<td>없음</td>
													</c:if>
													<c:if test="${tmp.room_content ne null}">
														<td>${tmp.room_content}</td>
													</c:if>
													<td>
														<a href="host_list_revise.do?room_code=${tmp.room_code}" class="btn btn-sm btn-warning">수정</a><br>
														<a href="#" class="btn btn-sm btn-danger del_list" style="margin-top:5px">삭제</a>
														<input type="text" class="room_code" value="${tmp.room_code}" style="display:none"/>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form:form>
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
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript">
	
		$('.del_list').click(function(){
			 var idx = $(this).index('.del_list');
			 var rc = $('.room_code').eq(idx).val();
			/* alert(pc); */
			swal({
				title: "삭제",
				text: "정말 삭제하시겠습니까?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if(willDelete){
					window.location.href='host_list_del.do?room_code='+rc
				}
			});
		});
	</script>

</body>
</html>