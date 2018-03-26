<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
	<div class="col-md-6" style="min-height: 340px;">
	<div class="panel panel-default" style="height:315px;">
						<div class="panel-heading" style="background-color: #BCE9B7;">
							<h3 class="panel-title">프로필</h3>
						</div>
						<div class="panel-body"style="height: 270px;">
		<table class="table table-striped">
			<tr>
				<td rowspan="6" align="center" style="width:30%">프로필 사진</td>
				<td style="width:20%">회원 아이디</td>
				<td>아이디</td>
			</tr>
			<tr>
				
				<td>회원 이름</td>
				<td>김수한무</td>
			</tr>
			<tr>
				
				<td>회원가입일</td>
				<td>가입일</td>
			</tr>
			<tr>
				
				<td>전화번호</td>
				<td>010-1234-1234</td>
			</tr>
			<tr>
				
				<td>여행 횟수</td>
				<td>0</td>
			</tr> 
			<tr>
				
				<td>여행 횟수</td>
				<td>0</td>
			</tr> 
		</table>
	</div>
	</div>	
	</div>
	<div class="col-md-6" style="min-height: 340px;">
		<div class="panel panel-default" style="height:315px;">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<table style="width:100%">
					<tr>
						<td style="width:30%"> < </td>
						<td style="width:30%;text-align: center" > <h3 class="panel-title">등록한 목록</h3> </td>
						<td style="width:30%; text-align: right;"> > </td>						
					</tr>
				</table>
				
				
			</div>
			<div class="panel-body" style="height: 270px;">
				<table class="table table-striped">
					<tr>
						<th>번호</th>
						<th>숙소이름</th>
						<th>가격</th>
						<th>사용 불가 기간 선택</th>
						<th>현재 상태</th>
					</tr>		
					<c:if test="${!empty list }">	
					<c:forEach var="i" items="${list }" varStatus="j">
						<tr class="rlist">
							<td>${j.count }</td>
							<td>${i.room_name }</td>
							<td>${i.room_price }</td>
							<td><input type="button" value="날짜 선택"></td>
							<td></td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
					<tr><td rowspan="4" colspan="5" style="text-align:center;width:100%;height:100%">등록된 숙소가 없습니다</td></tr>
					
					</c:if>
				</table>
			</div>
		</div>
	</div>
		<div style="border-top: 1px solid #ccc;height: 15px;"></div>
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<h3 class="panel-title">찜목록</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>숙소이름</th>
						<th>가격</th>
						<th>기간</th>
					</tr>					
				</table>
			</div>
		</div>
	</div>
<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<h3 class="panel-title">여행 목록</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>숙소이름</th>
						<th>가격</th>
						<th>기간</th>
						<th>리뷰</th>
					</tr>					
				</table>
			</div>
		</div>
	</div>
	
	</div>


</div>

	</div>
	</div>
</section>
 

	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			//활성화된 메뉴 처리
			$('.custom_menu').addClass("active");
			///
						
			 $(document).on('mouseover', '.rlist', function(){
					$(this).addClass('hover');
				});
			 $(document).on('mouseout', '.rlist', function(){			
					$(this).removeClass('hover');							
				});	
			
		})
	</script>
</body>
</html>
