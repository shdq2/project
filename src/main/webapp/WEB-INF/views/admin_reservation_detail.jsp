<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	
	<div class="col-md-9 body">
	<div style="position:relative;">
		<div style="border:1px solid;height:200px;width:40%;position:absolute;" class="host">
			호스트 정보
		</div>
		<div style="border:1px solid;height:200px;width:40%;top:200px;position:absolute;">
			게스트 정보
		</div> 
		<div style="border:1px solid;left:360px;width:60%;height:400px;position:absolute;" class="reser_info">
			<div>
				숙소명 : ${vo.room_code }
			</div>
			<div>
				기간 : ${vo.reservation_start } ~ ${vo.reservation_end }
			</div>				
			<div>
				현재 상태 : ${vo.reser_title }
			</div>
			<div>
				1박당 가격 : 
			</div>
			<div style="bottom:0px;">
				<input type="button" value="예약신청" id="request" />
				<input type="button" value="결제진행중" id="payment"/>
				<input type="button" value="예약완료" id="request_finish"/>
				<input type="button" value="여행중" id="travel"/>
				<input type="button" value="여행완료" id="finish"/>
			</div>			
		</div> 
	</div>
	
	
	
</div>

	</div>
	</div> 

</section>
 

	
	<script type="text/javascript" src="/project/resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="/project/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/project/resources/js/member_paging.js"></script>
	<script>
	
		$(function(){
			//활성화된 메뉴 처리
			$('.reser_menu').addClass("active");
			///
			var host_width = $('.host').width();
			var body_width = $('.body').width();			
			var reser_width = $('.reser_info').css('width',body_width-host_width+"px");
			var reser_width = $('.reser_info').css('left',host_width+"px");
			
			$('#request').click(function(){
				
			})
			$('#payment').click(function(){
				
			})
			$('#request_finish').click(function(){
				
			})
			$('#travel').click(function(){
				
			})
			$('#finish').click(function(){
				
			})
			
			$(window).resize(function(){
				var host_width = $('.host').width();
				var body_width = $('.body').width();			
				var reser_width = $('.reser_info').css('width',body_width-host_width+"px");
				var reser_width = $('.reser_info').css('left',host_width+"px");	
			});
		})
	</script>
</body>
</html>
