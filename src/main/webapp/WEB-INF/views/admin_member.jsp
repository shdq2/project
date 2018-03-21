<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
	<table class="table ">
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
				<td class="chk">
					<label class="custom-control custom-checkbox">
                    	<input type="checkbox" class="custom-control-input block" <c:if test="${i.custom_block == 1 }">checked</c:if>>
                    	<span class="custom-control-indicator"></span>
                    </label>
				<%-- <input type="radio" value="1" name="block_${j.index }" class="block" <c:if test="${i.custom_block == 1 }">checked</c:if>/> 차단<br />
				<input type="radio" value="0" name="block_${j.index }" class="block" <c:if test="${i.custom_block == 0 }">checked</c:if>/> 해제 --%>
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

<%-- 
<div style="position:relative">
	<c:forEach var="i" items="${list}" varStatus="j">
	    <div style="border:1px solid" class="help_div">설명 ${j.index }</div>
    </c:forEach>
</div>
 --%>

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
				$(this).mouseover(function(event) {	
							$(this).addClass('hover');
							/* $(".help_div").eq(index).css("display", "block");
							$(".help_div").eq(index).css("top",$(this).height()); 
							$(".help_div").eq(index).css("left",$(this).width()/2); */ 
						});
				 $(this).mouseout(function() {			
							$(this).removeClass('hover');
							/* $(".help_div").eq(index).css("display", "none"); */
						});	
			})
			
			////
			

			$('.list').click(function(e){
				var idx = $(this).index('.list');
				//테이블 항목 클릭
				if(!$('.chk').eq(idx).has(e.target).length){
					console.log("test");
					window.location.href = "admin_member_detail.do?id="+$('.id').eq(idx).text();	
				}	
					//차단 버튼 클릭			
			});
			$('.block').change(function(){
				var idx = $(this).index('.block');
				 var value = null;
				if($('.block').eq(idx).is(':checked')){
					value=1;
				}else{
					value=0;
				} 

				var id = $('.id').eq(idx).text();
				 $.get('Json_member_block.do?id='+id+'&block='+value,function(data){
					if(data == 1){
						console.log("정상적으로 처리되었습니다.");
					}else{
						console.log("작업이 성공적으로 수행되지 않았습니다.");
					}
				})
			})
			//////
		});
							
	
	</script>
</body>
</html>
