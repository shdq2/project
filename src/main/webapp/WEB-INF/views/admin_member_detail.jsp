<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
	<div class="col-md-6" style="min-height: 300px;">
	<div class="panel panel-default" style="height:280px;">
						<div class="panel-heading" style="background-color: #BCE9B7;">
							<h3 class="panel-title">프로필</h3>
						</div>
						<div class="panel-body"style="height: 250px;">
		<table class="table table-striped">
			<tr>
				<td rowspan="6" align="center" style="width:30%">프로필 사진</td>
				<td style="width:20%">회원 아이디</td>
				<td>${vo.custom_id }</td>  
			</tr>
			<tr>
				
				<td>회원 이름</td>
				<td>${vo.custom_name }</td>
			</tr>
			<tr>
				
				<td>회원가입일</td>
				<td>${vo.custom_date }</td>
			</tr>
			<tr>
				
				<td>전화번호</td>
				<td>${vo.custom_phone }</td>
			</tr>
			<tr>
				
				<td>여행 횟수</td>
				<td>0</td>
			</tr> 
		</table>
	</div>
	</div>	
	</div>
	<div class="col-md-6" style="min-height: 300px;">
		<div class="panel panel-default" style="height:280px;">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<table style="width:100%">
					<tr>
						<td style="width:30%"> <span class="btn-page glyphicon glyphicon-chevron-left disabled" ></span> </td>
						<td style="width:30%;text-align: center" > <h3 class="panel-title">등록한 목록 ( ${count} )</h3> </td>
						<td style="width:30%; text-align: right;"> <span class="btn-page glyphicon glyphicon-chevron-right right_btn"></span> </td>						
					</tr>
				</table>
				
				
			</div>
			<div class="panel-body" style="height: 250px;">
				<table class="table table-striped room_table">
					<thead>
						<tr>
							<th>번호</th>
							<th>숙소이름</th>
							<th>가격</th>
							<th>사용 불가 기간 선택</th>
							<th>현재 상태</th>
						</tr>	
					</thead>
					<tbody>	
						<c:if test="${!empty list }">	
							<c:set var="leng" value="${fn:length(list) }" />
							<c:forEach var="i" items="${list }" varStatus="j">
								<tr class="rlist">
									<td>${i.room_code - 111110 }</td>
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
					</tbody>
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
	function paging(page,id){
		$('.room_table tbody').empty();
		$.get('Json_member_room.do?page='+page+'&id='+id,function(data){
			var p = data.page;
			if(page == 1){
				$('.glyphicon-chevron-left').addClass("disabled");
				$('.glyphicon-chevron-left').removeClass("left_btn");
				
			}else if(p == page){
				$('.glyphicon-chevron-right').addClass("disabled");
				$('.glyphicon-chevron-right').removeClass("right_btn");
			}else{
				$('.glyphicon-chevron-right').addClass("right_btn");
				$('.glyphicon-chevron-left').addClass("left_btn");
				$('.glyphicon-chevron-right').removeClass("disabled");
				$('.glyphicon-chevron-left').removeClass("disabled");
			}
			var data1 = data.data
			var length = data1.length;
			for(var i = 0; i<length;i++){
				$('.room_table tbody').append(
					'<tr class="rlist">'+
						'<td>'+(data1[i].room_code-111110)+'</td>'+
						'<td>'+data1[i].room_name+'</td>'+
						'<td>'+data1[i].room_price+'</td>'+
						'<td><input type="button" value="날짜 선택"></td>'+
						'<td></td>'+
					'</tr>'
				);
			}
		},'json');
	}
		$(function(){
			var page = 1;
			var id = '${param.id}';
			$(document).on('click', '.left_btn', function(){
				page = page -1;				
				paging(page,id);
			})
			$(document).on('click', '.right_btn', function(){
				page = page +1;
				paging(page,id);
			})
			
			
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
