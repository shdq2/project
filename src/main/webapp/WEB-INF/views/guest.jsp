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
<link rel="stylesheet" href="resources/css/guest.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
   <jsp:include page="topbar.jsp"></jsp:include>
   
   <div class="guest-container">
      <div class="guest-nav">
         <a href="profile.do" id="guest-list-1"> 
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 여행보기</span>
         </a>
         <a href="profileEdit.do" id="guest-list-2">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">전체 찜 보기</span>
         </a>

      </div>
      
      <div class="guest-main">
      	<div class="block-xs-9" >
         <div class="main-header">
			<h3>여행목록</h3>
			<p>Travel List</p>
		</div>
		<div class="main-content"style="width:100%;margin : 20px 15px 20px 0px;">			
			<div class="reser_list" >
				<div class="div_menu"><p style="">${sum}</p>전체</div>
				<c:forEach var="i" items="${list }"> 
					<div class="div_menu"><p style="">${i.reser_count }</p>${i.reser_title }</div>
				</c:forEach>
			</div>
			<br />
			<div style="float:right;width:95%;margin:5px 15px 5px 15px">
				<table class="table" >
					<thead>
						<tr>
							<th>사진</th>
							<th>숙소명</th>
							<th>호스트</th>
							<th>기간</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty rlist }">
							<tr>
								<td colspan="5">조회된 내용이 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${!empty rlist }">
							<c:forEach var="i" items="${rlist }">
								<tr>
									<td><img src="admin/admin_room_img.do?id=${i.room_code }" style="width:80px;height:80px;margin:1px;" /></td>
									<td>${i.room_name }</td>
									<td>${i.host_name }</td>
									<td>${i.reservation_start }
									(<label style="<c:if test="${i.dayofweek_start == '토' }">color:blue;</c:if><c:if test="${i.dayofweek_start == '일' }">color:red;</c:if>"> ${i.dayofweek_start } </label>) ~ <br />${i.reservation_end }
									(<label style="<c:if test="${i.dayofweek_end == '토' }">color:blue;</c:if><c:if test="${i.dayofweek_end == '일' }">color:red;</c:if>">  ${i.dayofweek_end }</label> ) <br />(${i.reser_day }박 ${i.reser_day+1 } 일)</td>
									<td>${i.reser_title }</td>
								</tr>
							</c:forEach>
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
   <script type="text/javascript" src="resources/js/guest.js"></script>
   
   <script>
	$(function() {
		
		$('.div_menu p').eq(1).css('color','orange');
		$('.div_menu p').eq(2).css('color','#62a8ea');
		$('.div_menu p').eq(3).css('color','#A50D73');
		$('.div_menu p').eq(4).css('color','#46be8a');
		$('.div_menu p').eq(5).css('color','#757575');
		$('.div_menu p').eq(6).css('color','#B70000');
		$('.div menu p').css('font-style','italic');
		$('.div_menu').click(function(){
			var idx = $(this).index('.div_menu');
			
			if(idx == 0){
				state = -1;
			}
			else {
				state = idx-1;
			}
			$.get('Json_guest_reser.do?state='+state,function(data){
				var leng = data.length;
				$('.table tbody').empty();
				if(leng != 0){
					for(var i=0;i<leng;i++){
						$('.table tbody').append(
							'<tr>'+
								'<td><img src="admin/admin_room_img.do?id='+data[i].room_code+'" style="width:80px;height:80px;margin:1px;" /></td>'+
								'<td>'+data[i].room_name+'</td>'+
								'<td>'+data[i].host_name+'</td>'+
								'<td>'+data[i].reservation_start+
								'( <label class="dayofweek">'+data[i].dayofweek_start+'</label> ) ~ <br />'+data[i].reservation_end+
								'( <label class="dayofweek">'+data[i].dayofweek_end+'</label> ) <br />('+data[i].reser_day+'박 '+(data[i].reser_day+1)+' 일)</td>'+
								'<td>'+data[i].reser_title+'</td>'+
							'</tr>'
						);
					}	
				}
				else{
					$('.table tbody').append(
						'<tr>'+
							'<td colspan="5">조회된 내용이 없습니다</td>'+
						'</tr>		'
					);
				}
				
				$('.dayofweek').each(function(e){
					var txt = $('.dayofweek').eq(e).text();
					
					if(txt == "토"){						
						$('.dayofweek').eq(e).css('color','blue');
					}
					if(txt == "일"){						
						$('.dayofweek').eq(e).css('color','red');
					}	
				})
			})
			
		})
      });
   </script>
</body>
</html>