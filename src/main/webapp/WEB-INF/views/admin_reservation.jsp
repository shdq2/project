<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	<link href="/project/resources/css/admin_reser.css" rel="stylesheet" id="bootstrap-css">

		<div class="col-md-9">
		<c:forEach var="i" items="${list }">
		
			<div class="col-sm-12 col-md-6 reser-detail" style="border:1px solid; height:250px;border-radius:10px; margin-bottom:10px;position:relative;" >
				<div class="col-sm-6 col-md-6" style="height:70%">
					<div class= "reser-profile-div" >
						<input type="hidden" class="reser_num" value="${i.reservation_code}" />
						<div class="reser-profile-img">
							<img src="/project/show_img.do?code=${i.host_img_code }" />
						</div>
						<div class="reser-profile" >
							호스트 정보 <br />
							
						</div>
					</div>
				</div>
				
				<div class="col-sm-6 col-md-6" style="height:50%;">
					<div class= "reser-profile-div" >
						<div class="reser-profile-img">
							<img src="/project/show_img.do?code=${i.guest_img_code }" />
						</div>
						<div class="reser-profile">
							게스트 정보 <br />							
							
						</div>
					</div>
				</div>				
				<div class= "reser-text-div" style="width: 100%">
					<div class="reser-text" style="top:0%;height:auto;position:absolute;border:1px solid">
						예약정보					
						${i.room_name }<br />
						${i.reservation_start } ~ ${i.reservation_end }<br /> 
					</div>
				</div>
				
				
			</div>
			
		</c:forEach>
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
		$(function(){
			
			//활성화된 메뉴 처리
			$('.reser_menu').addClass("active");
			///
			$('.reser-detail').click(function(){
				var idx = $(this).index('.reser-detail');
				var reser_num = $('.reser_num').eq(idx).val();
				window.location.href="admin_reser_detail.do?reser_code="+reser_num;
			})
		});
							
	
	</script>
</body>
</html>

