<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
	<table class="table" id="table">
		<thead>
		<tr>
			<th >번호</th>
			<th>이름</th>
			<th>원하는 지역</th>
			<th>내용</th>
			<th>여행 시작일 ~ 여행 마지막일</th>
			<th>인원</th>
			<th>비고</th>								
		</tr>
		</thead>
		<tbody>
		<c:forEach var="i" items="${wlist }">
			<tr class="wlist">
				<td class="wish_code">${i.wish_code }</td>
				<td>${i.wish_name }</td>
				<td>${i.wish_region}</td>
				<td>${i.wish_msg }</td>
				<td>${i.wish_start } ~ ${i.wish_end }</td>				
				<td>${i.wish_number}</td>
				<td><c:if test="${i.wish_chk == 0 }"><span class="badge">new</span></c:if></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div align="center">
		<ul id="pagination" class="pagination-sm"></ul>
	</div>
	</div>

</div>

	</div>
	</div>
</section>
 

	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
	<script>
	
	var numberformat = function(num){
		var str;
		
		num = num+"";
		var len = num.length;
		var idx = num.length%3;
		str = num.substring(0,idx);
		while(idx<len){
			if(str != ""){
				str+=",";
			}
			str+= num.substring(idx,idx+3);
			idx+=3;
		}
		return str;
	}

		$(function(){
			//활성화된 메뉴 처리
			$('.wish_menu').addClass("active");
			///
			
			 $('#pagination').twbsPagination({
			      totalPages:${tot},
			      visiblePages: 7,
			      onPageClick: function (event, page) {
					 $.get('json_wish.do?page='+page,function(data){
						$('#table tbody').empty();
						var leng = data.length;
						for(var i=0;i<leng;i++){			
							if(data[i].wish_chk == 0){
								$('#table tbody').append(
										'<tr class="wlist">'+
										'<td class="wish_code">'+data[i].wish_code+'</td>'+
										'<td>'+data[i].wish_name+'</td>'+
										'<td>'+data[i].wish_region+'</td>'+
										'<td>'+data[i].wish_msg+'</td>'+
										'<td>'+data[i].wish_start+' ~ '+data[i].wish_end+'</td>'+				
										'<td>'+data[i].wish_number+'</td>'+
										'<td><span class="badge">new</span></td>'+
									'</tr>'
								);
							}								
							else{
								$('#table tbody').append(
										'<tr class="wlist">'+
										'<td class="wish_code">'+data[i].wish_code+'</td>'+
										'<td>'+data[i].wish_name+'</td>'+
										'<td>'+data[i].wish_region+'</td>'+
										'<td>'+data[i].wish_msg+'</td>'+
										'<td>'+data[i].wish_start+' ~ '+data[i].wish_end+'</td>'+			
										'<td>'+data[i].wish_number+'</td>'+
										'<td></td>'+
									'</tr>'
								);
							}
						}
					},'json'); 
			      }
		   });
			
			 $(document).on('click', '.wlist', function(){
				var idx = $(this).index('.wlist');
				var code = $('.wish_code').eq(idx).text();
				window.location.href="admin_wish_detail.do?code="+code;
			})
			 $(document).on('mouseover', '.wlist', function(){
					$(this).addClass('hover');							 
				});
			 $(document).on('mouseout', '.wlist', function(){			
					$(this).removeClass('hover');							
				});	
			})
							
	
	</script>
</body>
</html>
