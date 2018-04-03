<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
		<table class="table table-border">
			<thead>
			<tr>
				<th>사진</th>
				<th>이름</th>
				<th>호스트</th>
				<th>1박 가격</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		<div style="width:100%;text-align: center">
			<ul id="pagination" class="pagination-sm"></ul>
		</div>
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
	<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
	<script>
		$(function(){
			
			//활성화된 메뉴 처리
			$('.room_menu').addClass("active");
			///
			 $('#pagination').twbsPagination({
			      totalPages:${count},
			      visiblePages: 7,
			      onPageClick: function (event, page) {
					 $.get('json_room.do?page='+page,function(data){
						 var leng = data.length;
						 $('.table tbody').empty();
						 for(var i=0;i<leng;i++){
							 $('.table tbody').append(
									'<tr>'+
										'<td>'+
											'<img src="">'+
										'</td>'+
										'<td>'+data[i].room_name+'</td>'+
										'<td>'+data[i].custom_name+'</td>'+
										'<td>'+data[i].room_day+'</td>'+
										'<td>'+data[i].room_block+'</td>'+
										'<td>'+
											'<input type="button" value="수정">'+
										'</td>'+
									'</tr>'
							 );
						 }
					 },'json');
			      }
		   });
			
		});
							
	
	</script>
</body>
</html>

