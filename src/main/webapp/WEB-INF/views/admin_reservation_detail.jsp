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
				기간 : ${vo.reservation_start } ~ ${vo.reservation_end } (${vo.reser_day }박 ${vo.reser_day+1 }일)
			</div>				
			<div>
				현재 상태 : <label id="state">${vo.reser_title }</label>
			</div>
			<div>
				총금액 : 
			</div>
			<div style="bottom:5px;position:absolute;left:50%;transform:translateX(-50%);">
				<input type="button" value="예약신청" id="request"  class="btn btn-default btn_state"/>
				<input type="button" value="결제진행중" id="payment" class="btn btn-warning btn_state"/>
				<input type="button" value="예약완료" id="request_finish" class="btn btn-danger btn_state"/><br />
				<input type="button" value="여행중" id="travel" class="btn btn-info btn_state"/>
				<input type="button" value="여행완료" id="finish" class="btn btn-success btn_state" />
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
		function update_state(idx,txt){
			if(state != idx){
				$.get('Json_update_state.do?state='+idx+'&code=${param.reser_code}',function(data){
					if(data == 1){
						state = idx;
						$('#state').text(txt);
						for(var i=0;i<5;i++){
							$('.btn_state').eq(i).attr("disabled",false);
						}
						$('.btn_state').eq(idx).attr("disabled",true);
					}else{
						
					}
				})
			}
		}
		$(function(){
			//활성화된 메뉴 처리
			$('.reser_menu').addClass("active");
			///
			var host_width = $('.host').width();
			var body_width = $('.body').width();			
			var reser_width = $('.reser_info').css('width',body_width-host_width+"px");
			var reser_width = $('.reser_info').css('left',host_width+"px");
			var state = '${vo.reser_code}';
			$('.btn_state').eq(state).attr("disabled",true);
			$('#request').click(function(){
				update_state(0,"예약신청");
			})
			$('#payment').click(function(){
				update_state(1,"결제진행중");
			})
			$('#request_finish').click(function(){
				update_state(2,"예약완료");
			})
			$('#travel').click(function(){
				update_state(3,"여행중");
			})
			$('#finish').click(function(){
				update_state(4,"여행완료");
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
