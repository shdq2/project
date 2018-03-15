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
		<c:forEach var="i" items="${list}" varStatus="j">
			<tr class="list">
				<td>
				<input type="radio" value="1" name="block_${j.index }" class="block" <c:if test="${i.custom_block == 1 }">checked</c:if>/> 차단<br />
				<input type="radio" value="0" name="block_${j.index }" class="block" <c:if test="${i.custom_block == 0 }">checked</c:if>/> 해제
				</td>
				<td>${i.custom_name }</td>
				<td class="id">${i.custom_id }</td>
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


<div style="position:relative">
	<c:forEach var="i" items="${list}" varStatus="j">
	    <div id="help_div_"+${j.index } class="help_div">설명 ${j.index }</div>
    </c:forEach>
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
			
			// 테이블에 마우스 올렸을때와 내렸을때 처리
			$('.list').each(function(index){
				$(this).mouseover(function() {	
							
							$(this).addClass('hover');
							$(".help_div").eq(index).css("display", "block");
							 $(".help_div").eq(index).css("top",$(this).offset().top-300 ); 
							$(".help_div").eq(index).css("margin", "0px auto");
						});
				 $(this).mouseout(function() {			
							$(this).removeClass('hover');
							$(".help_div").eq(index).css("display", "none");
						});	
			})
			
			////
			// 테이블 항목 클릭 이벤트	
			$('.list').click(function(){
				var idx = $(this).index('.list');
				
			});
			///
			// 멤버 차단 버튼 눌럿을때 처리
			$('input[type=radio]').change(function(){
				var idx = $(this).index('.block');			
				var value = $('.block').eq(idx).val();
				if(idx%2 == 0){
					idx=idx/2;	
				}else{
					idx = (idx-1)/2;
				}
				var id = $('.id').eq(idx).text();
				$.get('Json_member_block.do?id='+id+'&block='+value,function(data){
					if(data == 1){
						console.log("정상적으로 처리 되었습니다");
					}else{
						console.log("작업을 실패하였습니다");
					}
				})
			});
			//////
	
							
		})
	</script>
</body>
</html>
