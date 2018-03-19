<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
<div class="col-md-9">
	<table class="table">
		<tr>
			<th>차단</th>
			<th>이름</th>
			<th>계정</th>
			<th>은행명</th>
			<th>계좌번호</th>
			<th>전화번호</th>
			<th>등록한 숙소</th>
			<th>회원가입일</th>
		</tr>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>
				<input type="radio" value="1" /> 차단<br />
				<input type="radio" value="0" /> 해제
				</td>
				<td>${i.custom_name }</td>
				<td>${i.custom_id }</td>
				<td>${i.custom_bank }</td>
				<td>${i.custom_cash }</td>
				<td>${i.custom_phone }</td>
				<td>${i.room_count }</td>
				<td>${i.custom_date }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	</div>
</section>


	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			$('.custom_menu').addClass("active");
			$('.table tr').hover(function(){				
				$(this).addClass('hover');
			},
			function(){				
				$(this).removeClass('hover');
			}
			)
			$('.table tr').click(function(){
				var idx = $(this).index();
				console.log(idx);
			})
		})
	</script>
</body>
</html>
