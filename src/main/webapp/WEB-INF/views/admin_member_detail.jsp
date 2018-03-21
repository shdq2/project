<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
	<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #BCE9B7;">
							<h3 class="panel-title">찜목록</h3>
						</div>
						<div class="panel-body">
		<table class="table">
			<tr>
				<td rowspan="4" align="center" style="width:30%">프로필 사진</td>
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
		</table>
	</div>
	</div>	
	</div>
	<div style="border-top: 1px solid #ccc;height: 15px;"></div>
	<div class="col-md-3">
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
<div class="col-md-3">
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
	</div><div class="col-md-3">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<h3 class="panel-title">등록한 목록</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>숙소이름</th>
						<th>가격</th>
						<th>사용 불가 기간 선택</th>
						<th>현재 상태</th>
					</tr>			
					<tr>
						<th>1</th>
						<th>test</th>
						<th>25000</th>
						<th><input type="button" value="달력선택" /></th>
						<th>등록</th>
					</tr>
					<tr>
						<th>2</th>
						<th>test</th>
						<th>25000</th>
						<th><input type="button" value="달력선택" /></th>
						<th>등록대기</th>
					</tr>		
					<tr>
						<th>3</th>
						<th>test</th>
						<th>25000</th>
						<th><input type="button" value="달력선택" /></th>
						<th>미등록</th>
					</tr>		
										
				</table>
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
									
		})
	</script>
</body>
</html>
