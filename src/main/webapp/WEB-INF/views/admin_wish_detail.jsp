<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
	<table class="table">
		<tr>
			<th>번호</th>
			<td>${vo.wish_code }</td>								
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.wish_name }</td>
		</tr>
		<tr>
			<th>원하는 지역</th>
			<td>${vo.wish_region }</td>
		</tr>
		<tr>
			<th>원하는 가격</th>
			<td>${vo.wish_price }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.wish_msg }</td>
		</tr>
		<tr>
			<th>여행 시작일 ~ 여행 마지막일</th>
			<td>${vo.wish_start } ~ ${vo.wish_end }</td>
		</tr>
		<tr>
			<th>연락 받을 전화번호</th>
			<td>${vo.wish_phone }</td>
		</tr>
		<tr>
			<th>연락 받을 이메일</th>
			<td>${vo.wish_email }</td>
		</tr>
		<tr>
			<th>인원</th>
			<td>${vo.wish_number }</td>
		</tr>
		<tr>
			<th>요청사항</th>
			<td>${req }</td>
		</tr>
	</table>
	<c:if test="${pre != 0}">
		<a href="admin_wish_detail.do?code=${pre}" class="btn btn-info">이전글</a>
	</c:if>
	<c:if test="${pre == 0}">
		<a class="btn btn-info disabled">이전글</a>
	</c:if>
	<a href="admin_wish.do" class="btn btn-info">목록보기</a>
	<c:if test="${next != 0 }">
		<a href="admin_wish_detail.do?code=${next}" class="btn btn-info">다음글</a>
	</c:if>
	<c:if test="${next == 0 }">
		<a class="btn btn-info disabled">다음글</a>
	</c:if>
	</div>

</div>

	</div>
	</div>
</section>
 

	
	<script type="text/javascript" src="/project/resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="/project/resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			//활성화된 메뉴 처리
			$('.wish_menu').addClass("active");
			///
			
		});
							
	
	</script>
</body>
</html>
