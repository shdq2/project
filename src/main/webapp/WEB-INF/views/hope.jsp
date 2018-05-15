<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/hope.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
   <jsp:include page="topbar.jsp"></jsp:include>
   
   <div class="hope-container">
      <div class="hope-nav">
         <a href="guest.do" id="hope-list-1"> 
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 여행보기</span>
         </a>
         <a href="hope.do" id="hope-list-2">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 찜 보기</span>
         </a>

      </div>
      
      <div class="hope-main">
      	<div class="block-xs-12 block-md-9" >
         <div class="main-header">
			<h3>찜 목록</h3>
			<p>Hope List</p>
		</div>
		<div class="main-content"style="width:100%;margin : 20px 15px 20px 0px;">			
			<div class="hope_count">
				<div style="float:right;margin-right:15px;">
					<p style="text-align:center;margin-bottom:0px;font-size: 25px;">${size }</p>내가 찜한 숙소
				</div>
			</div>
			
			<br />
			<div style="float:right;width:95%;margin:5px 15px 5px 15px">
				<hr />
				<table class="table">
					<thead>
						<tr>
							<th style="width:120px;">사진</th>
							<th>숙소이름</th>
							<th style="width:200px;">호스트</th>
							<th style="width:100px;">바로가기</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list }">
							<c:forEach var="i" items="${list }">
								<tr>
									<td><img src="admin/admin_room_img.do?id=${i.room_code }" style="width:100px;height:80px;margin:1px;" /></td>
									<td>
									<input type="hidden" class="code" value="${i.room_code}" />
									${i.room_name }<br />
									${i.room_addr }</td>
									<td>${i.custom_name }</td>
									<td>
										<a href="roomDetail.do?code=${i.room_code }" class="form-control" style="margin-bottom:5px;">바로가기</a>
										<input type="button" value="찜 해제" class="form-control remove" />
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<tr>
								<td colspan="4" style="text-align:center !important">조회된 항목이 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				
				<hr />
			</div>
			
		</div>
		</div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.js"></script>
   <script type="text/javascript" src="resources/js/topbar.js"></script>
   <script type="text/javascript" src="resources/js/hope.js"></script>
   
   <script>
	$(function() {	
		
		$(document).on('click','.remove',function(){			
			var idx=$(this).index('.remove');
			var code = $('.code').eq(idx).val();
			
			$.get('Json_guest_hope_remove.do?code='+code,function(data1){
				var data = data1.list;
				var leng = data.length;
				$('.hope_count p').text(data1.size);
				$('.table tbody').empty();
				if(leng>0){
					for(var i=0;i<leng;i++){
						$('.table tbody').append(
							'<tr>'+
								'<td><img src="admin/admin_room_img.do?id='+data[i].room_code+'" style="width:100px;height:80px;margin:1px;" /></td>'+
								'<td>'+
								'<input type="hidden" class="code" value="'+data[i].room_code+'" />'+
								data[i].room_name+'<br />'+
								data[i].room_addr+'</td>'+
								'<td>'+data[i].custom_name+'</td>'+
								'<td>'+
									'<a href="roomDetail.do?code='+data[i].room_code+'" class="form-control" style="margin-bottom:5px;">바로가기</a>'+
									'<input type="button" value="찜 해제" class="form-control remove" />'+
								'</td>'+
							'</tr>	'
						);
					}
				}else{
					$('.table tbody').append(
						'<tr>'+
							'<td colspan="4" style="text-align:center !important">조회된 항목이 없습니다</td>'+
						'</tr>'
					);
				}
				
			})
		})
		
   });
   </script>
</body>
</html>