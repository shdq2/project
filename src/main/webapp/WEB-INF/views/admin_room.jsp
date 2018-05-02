<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
		<div class="form-inline">
			<select id="state" class="form-control" style="float:left">
				<option value="-1">전체</option>
				<option value="0">비공개</option>
				<option value="1">미완성</option>
				<option value="2">공개</option>
			</select>
		</div>
		<div style="float:right;" class="form-inline">
			<select class="form-control" id="type">
				<option value="3">숙소명</option>
				<option value="4">호스트명</option>
			</select>
			<input type="text" class="form-control" id="search"/>
			<input type="button" class="btn btn-success" value="검색" id="search_btn"/>
		</div>
		<table class="table table-border" style="height:465px;">
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
 

	
	<script type="text/javascript" src="/project/resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="/project/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/project/resources/js/jquery.twbsPagination.js"></script>
	<script>
	function room_list(data){
		var leng = data.length;
		 var src = "";

		 $('.table tbody').empty();
		 for(var i=0;i<leng;i++){
			 if(data[i].room_block == 0){
				 src = "비공개";
			 }
			 else if(data[i].room_block == 1){
				 src = "미완성";
			 }else{
				 src = "공개";
			 }
			 $('.table tbody').append(
				'<tr>'+
					'<td style="width:110px;">'+
						'<img src="admin_room_img.do?id='+data[i].room_code+'" style="width:100px;height:100px;"><input type="hidden" value="'+data[i].room_code+'" class="room_code"/>'+
					'</td>'+
					'<td style="width:250px">'+data[i].room_name+'</td>'+
					'<td style="width:100px;">'+data[i].custom_name+'</td>'+
					'<td>'+data[i].room_day+'</td>'+
					'<td>'+
					'<select class="room_state form-control" style="width:100px;">'+
					'<option value="0">비공개</option>'+
					'<option value="1">미완성</option>'+
					'<option value="2">공개</option>'+
					'</select>'+
					'</td>'+
					'<td style="width:50px;">'+
						'<input type="button" class="form-control" value="수정">'+
					'</td>'+
				'</tr>'
			 );
			 
			 $('.room_state').eq(i).val(data[i].room_block).attr("selected","true");
		 }
	}
		$(function(){
			
			$('#state').change(function(){
				var state = $('#state').val();
				$.get('Json_room_state_search.do?state='+state,function(data){
					room_list(data);
				})
			})
			
			$('#search_btn').click(function(){
				var type = $('#type').val();
				var txt = $('#search').val();
				console.log(txt);
				console.log(type);
				$.get('Json_room_state_search.do?state='+type+'&text='+txt,function(data){
					console.log(data);
					room_list(data);
				})
				
			})
			//활성화된 메뉴 처리
			$('.room_menu').addClass("active");
			///
			 $('#pagination').twbsPagination({
			      totalPages:${count},
			      visiblePages: 7,
			      onPageClick: function (event, page) {
					 $.get('json_room.do?page='+page,function(data){
						 room_list(data);
					 },'json');
					 
					 
			      }
		   });
			
			 $(document).on('change','.room_state',function(){
				 var idx = $(this).index('.room_state');
				 var code = $('.room_code').eq(idx).val();
				 var value = $('.room_state').eq(idx).val();
				 $.get('json_room_state_change.do?value='+value+'&code='+code,function(data){
					 if(data == 1)
					 	console.log("정상적으로 수행 되었습니다");
					 else
						console.log("정상적으로 수행되지 않았습니다");
				 })
			 })
		});
							
	
	</script>
</body>
</html>

