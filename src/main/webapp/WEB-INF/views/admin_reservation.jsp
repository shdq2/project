<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9">
		<c:forEach var="i" items="${list }">
			<div style="border:1px solid; height:150px;border-radius:10px; margin-bottom:10px;" >
				<div style="border:1px solid #ccc;width:20%;height:100%;display:inline-block;">
					<div class="reser-profile-img" style="height:70%;">
					
					</div>
					<div class="reser-profile" style="bottom:0px;">
						${i.host_id }<br />
						${i.host_name }
					</div>
				</div>
				<div style="border:1px solid #ccc;width:20%;height:100%;display:inline-block;">
					<div class="reser-profile-img" style="height:70%;">
					
					</div>
					<div class="reser-profile" style="bottom:0px;">
						${i.guest_id }<br />
						${i.guest_name }
					</div>
				</div>
				<div style="border:1px solid #ccc;width:58%;height:100%;display:inline-block;">
					<div class="reser-profile-img" style="height:100%;">					
						${i.room_name }<br />
						${i.reservation_start } ~ ${i.reservation_end }<br /> 
						${i.reservation_start } ~ ${i.reservation_end }
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
 

	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
	<script>
		$(function(){
			
			//활성화된 메뉴 처리
			$('.reser_menu').addClass("active");
			///
			
		});
							
	
	</script>
</body>
</html>

