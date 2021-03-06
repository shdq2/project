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
						<td style="width:30%"> <span class="btn-page glyphicon glyphicon-chevron-left room_left disabled" ></span> </td>
						<td style="width:30%;text-align: center" > <h3 class="panel-title">등록한 목록 ( ${count} )</h3> </td>
						<td style="width:30%; text-align: right;"> <span class="btn-page glyphicon glyphicon-chevron-right room_right right_btn"></span> </td>						
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
	<div class="col-md-6" style="min-height:370px;">
		<div class="panel panel-default"style="height:350px;">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<table style="width:100%">
					<tr>
						<td style="width:30%"> <span class="btn-page glyphicon glyphicon-chevron-left disabled hope_left" ></span> </td>
						<td style="width:30%;text-align: center" > <h3 class="panel-title">찜 목록 ( ${count} )</h3> </td>
						<td style="width:30%; text-align: right;"> <span class="btn-page glyphicon glyphicon-chevron-right hope_right hope_right_btn"></span> </td>						
					</tr>
				</table>
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
<div class="col-md-6" style="min-height:370px;">
		<div class="panel panel-default"style="height:350px;">
			<div class="panel-heading" style="background-color: #BCE9B7;">
				<table style="width:100%">
					<tr>
						<td style="width:30%"> <span class="btn-page glyphicon glyphicon-chevron-left travel_left disabled" ></span> </td>
						<td style="width:30%;text-align: center" > <h3 class="panel-title">여행 목록 ( ${rcount} )</h3> </td>
						<td style="width:30%; text-align: right;"> <span class="btn-page glyphicon glyphicon-chevron-right travel_right travel_right_btn"></span> </td>						
					</tr>
				</table>
			</div>
			<div class="panel-body">
				<table class="table table-striped travel_table">
					<thead>
						<tr>
							<th>번호</th>
							<th>숙소이름</th>						
							<th>기간</th>
							<th>상태</th>
							<th>리뷰</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty rlist }">
							<c:forEach var="i" items="${rlist }">
								<tr class="tlist">
									<td>${i.reservation_code }</td>
									<td>${i.room_name }</td>
									<td>${i.reservation_start } ~ ${i.reservation_end } ( ${i.reser_day }박 ${i.reser_day+1 }일 )</td>
									<td>${i.reser_title }</td>
									<td>리뷰 작성 미완료</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty rlist }">
							<tr>
								<td colspan ="5" style="text-align: center;">여행한 목록이 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div>
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
	<script type="text/javascript" src="resources/js/member_paging.js"></script>
	<script>
	
		$(function(){
			var page = 1;
			var rpage = 1;
			var id = '${param.id}';			
			var count='${count}';
			var rcount='${rcount}';
			
			if(count<=4){
				$('.room_left').addClass("disabled");
				$('.room_left').removeClass("left_btn");
				$('.room_right').addClass("disabled");
				$('.room_right').removeClass("right_btn");
			}
			if(rcount<=6){
				$('.travel_left').addClass("disabled");
				$('.travel_left').removeClass("travel_left_btn");
				$('.travel_right').addClass("disabled");
				$('.travel_right').removeClass("travel_right_btn");
			}
			
			$(document).on('click', '.left_btn', function(){
				page = page -1;				
				room_paging(page,id);
			})
			$(document).on('click', '.right_btn', function(){
				page = page +1;
				room_paging(page,id);
			})
			
			$(document).on('click', '.travel_left_btn', function(){
				rpage = rpage -1;				
				travel_paging(rpage,id);
			})
			$(document).on('click', '.travel_right_btn', function(){
				rpage = rpage +1;
				travel_paging(rpage,id);
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
