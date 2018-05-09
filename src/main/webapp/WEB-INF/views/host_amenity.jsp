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
	<link rel="stylesheet" href="resources/css/font-awesome.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/host.css">
	<link rel="stylesheet" href="resources/css/checkbox.css">
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
				<h3 class="host-title">편의시설 <small>게스트들에게 회원님의 숙소에 대해서 알려주세요.</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-10">
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">회원님이 숙소에서 사용할 수 있는 편의시설들을 체크하세요.</h3>
							</div>
							<form:form action="host_amenity.do" method="post" modelAttribute="vo">
								<div class="panel-body">
									<div class="col-lg-3">
										<h3 class="checkbox-title">기본 시설</h3>
										
										<%-- <c:forEach var="tmp" items="${str}">
										<c:set var="loop_flag" value="false" />
										<c:if test="${not loop_flag}">
											<c:forEach var="tmp1" items="${room_option}">
												
													<c:if test="${tmp eq tmp1}">
														<div class="checkbox checkbox-primary">
															<input name="str[]" checked="checked" type="checkbox" value="${tmp}">
															<label >${tmp}</label>
															<c:set var="loop_flag" value="true" />
														</div>
													</c:if>
													<c:if test="${tmp ne tmp1}">
														<div class="checkbox checkbox-primary">
															<input name="str[]" type="checkbox" value="${tmp}">
															<label >${tmp}</label>
															<c:set var="loop_flag" value="true" />
														</div>
													</c:if>
												
											</c:forEach>
											</c:if>
										</c:forEach> --%>
										
										<c:forEach var="tmp" items="${str}" varStatus="status">
										
											<c:set var="a" value="0" />

											<c:forEach var="i" begin="0" end="${fn:length(str)}">
												<c:if test="${room_option[i] == tmp}">
													<div class="checkbox checkbox-primary">
														<input name="str[]" checked="checked" type="checkbox" id="${tmp}" value="${tmp}">
														<label for="${tmp}">${tmp}</label>
														<c:set var="a" value="1" />
													</div>
												</c:if>
											</c:forEach>
									
											<c:if test="${a == 0}">
												<div class="checkbox checkbox-primary">
													<input name="str[]" type="checkbox" id="${tmp}" value="${tmp}">
													<label for="${tmp}">${tmp}</label>
												</div>
											</c:if>
											
										</c:forEach>
										
										
									</div>
									<hr class="hidden-lg">
									<div class="col-lg-3">
										<h3 class="checkbox-title">추가시설</h3>
										
										<c:forEach var="tmp" items="${str1}" varStatus="status">
										
											<c:set var="a" value="0" />

											<c:forEach var="i" begin="0" end="${fn:length(str1)}">
												<c:if test="${room_option1[i] == tmp}">
													<div class="checkbox checkbox-primary">
														<input name="str1[]" checked="checked" type="checkbox" id="${tmp}" value="${tmp}">
														<label for="${tmp}">${tmp}</label>
														<c:set var="a" value="1" />
													</div>
												</c:if>
											</c:forEach>
									
											<c:if test="${a == 0}">
												<div class="checkbox checkbox-primary">
													<input name="str1[]" type="checkbox" id="${tmp}" value="${tmp}">
													<label for="${tmp}">${tmp}</label>
												</div>
											</c:if>
											
										</c:forEach>
										
										<%-- <c:forEach var="tmp" items="${str1}">
											<div class="checkbox checkbox-primary">
												<input name="str1[]" type="checkbox" value="${tmp}">
												<label>${tmp}</label>
											</div>
										</c:forEach> --%>
									</div>
									<hr class="hidden-lg">
									<div class="col-lg-3">
										<h3 class="checkbox-title">특별시설</h3>
										<c:forEach var="tmp" items="${str2}" varStatus="status">
										
											<c:set var="a" value="0" />

											<c:forEach var="i" begin="0" end="${fn:length(str2)}">
												<c:if test="${room_option2[i] == tmp}">
													<div class="checkbox checkbox-primary">
														<input name="str2[]" checked="checked" type="checkbox" id="${tmp}" value="${tmp}">
														<label for="${tmp}">${tmp}</label>
														<c:set var="a" value="1" />
													</div>
												</c:if>
											</c:forEach>
									
											<c:if test="${a == 0}">
												<div class="checkbox checkbox-primary">
													<input name="str2[]" type="checkbox" id="${tmp}" value="${tmp}">
													<label for="${tmp}">${tmp}</label>
												</div>
											</c:if>
											
										</c:forEach>
									</div>
									<hr class="hidden-lg">
									<div class="col-lg-3">
										<h3 class="checkbox-title">숙소안전</h3>
										<c:forEach var="tmp" items="${str3}" varStatus="status">
										
											<c:set var="a" value="0" />

											<c:forEach var="i" begin="0" end="${fn:length(str3)}">
												<c:if test="${room_option3[i] == tmp}">
													<div class="checkbox checkbox-primary">
														<input name="str3[]" checked="checked" type="checkbox" id="${tmp}" value="${tmp}">
														<label for="${tmp}">${tmp}</label>
														<c:set var="a" value="1" />
													</div>
												</c:if>
											</c:forEach>
									
											<c:if test="${a == 0}">
												<div class="checkbox checkbox-primary">
													<input name="str3[]" type="checkbox" id="${tmp}" value="${tmp}">
													<label for="${tmp}">${tmp}</label>
												</div>
											</c:if>
											
										</c:forEach>
									</div>
								</div>
								<div class="panel-body" style="padding-right:50px">
									<input type="submit" value="다음" class="btn btn-primary pull-right btn_next" >
								</div>
							</form:form>
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
	
	

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script src="resources/js/hostside.js"></script>
	<script type="text/javascript">
	</script>
	<script>
 		/* $('.test_div').click(function(){
			var idx = $(this).index('.test_div');
			var val = $('.test_val').eq(idx).val();
			console.log(val);
			
			window.location.href=val;
		})  */
	</script>
</body>
</html>