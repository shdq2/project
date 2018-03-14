<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">

<title>메인 페이지</title>
	<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="resources/css/main_slide.css">
	<link rel="stylesheet" href="resources/css/main_button.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/main_main.css">
	<link rel="stylesheet" href="resources/css/jquery-ui.min.css">
	<link rel="stylesheet" href="resources/css/main_checkbox.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="resources/css/main_change">
</head>
<body>
	<!-- 메뉴바  -->
	<jsp:include page="topbar.jsp"></jsp:include>
		
	<div class="container1" align="center" style="margin-top:62px">
	
		<!-- 슬라이드  -->
		<div align="center">
			<div class="row">
				<div class="col-md-12">
					<div id="main">
						<section class="first_screen"> <img src="resources/imgs/mr1.PNG" >  </section>
					    <section class="second_screen"> <img src="resources/imgs/mr2.PNG" >  </section>
					    <section class="Last_screen"><img src="resources/imgs/mr3.PNG">   </section>
					</div>
					<!-- <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img src="resources/imgs/mr1.PNG" alt="First slide" >
								<div class="carousel-caption">
									<h3>First slide</h3>
									<p>첫번째 슬라이드</p>
								</div>
							</div>
							<div class="item">
								<img src="resources/imgs/mr2.PNG" alt="Second slide">
							</div>
							<div class="item">
								<img src="resources/imgs/mr3.PNG" alt="Third slide">
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		
		<!-- 어디로 (jpg) -->
		<div class="hidden-xs hidden-sm" align="center" style="padding-top:40px; padding-bottom:40px">
			<img src="resources/imgs/where.png" class="img_responsive" >
		</div>
		
		<!-- 어디로 (글) -->
		<div class="hidden-xs hidden-sm" align ="center" style="padding-bottom:40px;" >
			<h1>어디로 가실래요?</h1><br/>
			<h1>상몽쓰펜션!</h1>
		</div>
		
		<!-- 갈 곳 고르는 버튼  -->
		<div class="aaa" style="width:80%">
			  <div class="thumbex">
			    <div class="thumbnail"><a href="#"> <img src="resources/imgs/jeju.jpg"/><span>제주도</span></a></div>
			  </div>
			  <div class="thumbex">    
			    <div class="thumbnail"><a href="#"><img src="resources/imgs/british.jpg"/><span>영국</span></a></div>
			  </div>
			  <div class="thumbex">
			    <div class="thumbnail"><a href="#"><img src="resources/imgs/usa.png" /><span>미국</span></a></div>
			  </div>
			  <div class="thumbex">
			    <div class="thumbnail"><a href="#"><img src="resources/imgs/japan.jpg" /><span>일본</span></a></div>
			  </div>
		</div>	
		
		<!-- 안드로이드 어플 연결 -->
		<div align="center" style="max-width:1200px; padding-top:40px; padding-bottom:40px" >
        	<a href="#" style="margin:0px; padding:0px"><img src="resources/imgs/android.PNG" style="width: 100%;max-height: 100%"/></a>
        </div>
		
		<div align ="center" style="padding-bottom:40px">
	        <h3>미스터멘션은 제주도를 시작으로 <font color="#A50D73">전 세계 한 달 살기 문화</font> 를 만들어가는 서비스입니다.</h3>
	        <br>
	        <p size=3 color=#b5b5b5>미스터멘션에는 다양한 한 달 살기 방들이 있습니다.
	            <br>가격, 위치, 기간 등을 쉽게 비교 할 수 있고 사진과 영상을 통해
	            <br class="hidden-sm hidden-xs"/>보다 더 자세히 방을 확인 할 수 있습니다.
	        </p>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center">
                	<i class="glyphicon glyphicon-search" style="font-size:30px; color:#B75F5F"></i><br><br>
	                <h3>검색</h3><br>
	                <p class="text-muted" color=#b5b5b5>가격별, 위치별로 살고 싶은 방을 <!-- text-muted=>글자색 -->
	                    <br>손쉽게 검색할 수 있습니다.</p>
                </div>
                
                <div class="col-sm-4 text-center">
                	<i class="glyphicon glyphicon-book" style="font-size:30px; color:#B75F5F"></i><br><br>
	                <h3 class="margin-vertical-5">예약하기</h3><br>
	                <p class="text-muted" color=#b5b5b5>자동예약시스템 및 상담을 통한
	                    <br>빠르고 안전한 예약이 가능합니다.</p>
                </div>

                <div class="col-sm-4 text-center">
                	<i class="glyphicon glyphicon-home" style="font-size:30px; color:#B75F5F"></i><br><br>
	                <h3 class="margin-vertical-5">한달 살기</h3><br>
	                <p class="text-muted" color=#b5b5b5>일주일, 보름, 한달 살기
	                    <br>원하는 기간별로 숙박이 가능합니다.</p>
                </div>
            </div>
        </div>
        
        <!-- 방예약 정보 입력 -->
        <div class="input-request"> <!-- 여기 배경 들어가있음 -->
        	<div class="input-panel">
        		<form:form action="#" method="post" class="input-request-form" modelAttribute="vo">
        			
        			<!-- 왼쪽면 -->
        			<div class="default col-xs-12 col-sm-4 col-md-5">
        				<div style="padding:30px"><h3>내게 맞는 방을 찾아주세요!</h3></div>
        				<div class="personal-info col-md-12">
        					
        					<!-- 코드번호 -->
        					<div style="display:none;">
        						<form:input type="text" path="wish_code"/>
        					</div>
        					
        					<!-- 첫째줄 -->
        					<div>
	        					<div class="form-group col-md-5">
	        						<label class="control-label" align="left" style="width:100%">이름</label>
	        						<form:input class="form-control" type="text" path="wish_name" placeholder="예) 홍길동"/>
	        					</div>
	        					<div class="form-group col-md-7">
	        						<label class="control-label" align="left" style="width:100%">전화번호</label>
	        						<form:input class="form-control" type="text" path="wish_phone" placeholder="예) 010-1234-5678"/>
	        					</div>
        					</div>
        					
        					<!-- 둘째줄 -->
        					<div style="padding:0px 15px">
        						<label class="control-label" align="left" style="width:100%">
        							희망거주인원<small><label class="control-label">(자녀 수를 포함한 값을 입력해 주세요)</label></small>
        						</label>
        						<form:select class="form-control" path="wish_number">
        							<c:forEach var="i" begin="1" end="10">
        								<option>${i}</option>
        							</c:forEach>
        						</form:select>
        					</div>
        					
        					<!-- 모바일에서는 안나오는 놈 -->
        					<div class="form-group hidden-xs hidden-sm" style="margin-top:15px; padding:0px 15px; " >
        						<div>
        							<label class="control-label" align="left" style="width:100%">희망 숙박 기간</label>
        						</div>
        						<div class="form-inline" >
        							<div class=" col-sm-6" style="padding:5px;" >
        								<label align="left" style="width:150px">- 체크인</label><br>
        								<form:input class="form-control" type="text" placeholder="체크인" style="width:150px" id="checkin" path="wish_start"/>
        							</div>
        							<div class=" col-sm-6" style="padding:5px">
        								<label  align="left" style="width:150px">- 체크아웃</label><br>
        								<form:input class="form-control" type="text" placeholder="체크아웃" style="width:150px" id="checkout" path="wish_end"/>
        							</div>
        						</div>
        					</div>
        					
        					<div class="hidden-xs hidden-sm" style="height:50px"></div>
        					<div style="padding:0 15px; margin-top:10px" >
        						<label class="control-label" align="left" style="width:100%">
        							메세지<small><label class="control-label">(자녀가 있다면 연령대와 수를 알려주세요.)</label></small>
        						</label>
        						<form:textarea class="form-control" style="height:77px" rows="10" cols="50" placeholder="메세지를 적어주세요." path="wish_msg"></form:textarea>
        					</div>
        					
        					<div class="hidden-sm hidden-md hidden-lg" style="margin-top:20px; width:100%; height:20px">
        						<input type="submit" class="btn btn-danger btn-block" value="전송"/>
        					</div>
        				</div>
        			</div> 
        			
        			<!-- 오른쪽 면 -->	
        			<div class="extend hidden-xs hidden-sm col-md-7">
        				<div style="padding:30px"><h3>추가 요청사항을 입력해주세요.</h3></div>
        				
        				<div class="row col-sm-12">
        					
        					<label class="control-label" style="width:100%" align="left">1. 방타입 (복수선택 가능)</label>
        				
	        				<div class="btn-group" role="group">
	        					<div align="center">
	        					<c:forEach var="tmp" items="${str}">
	        						<label class="btn btn-default btn-checkbox" style="width:170px">
					                	<div align="left">
						                   <span class="glyphicon glyphicon-unchecked" data-icon-on="glyphicon glyphicon-check" data-icon-off="glyphicon glyphicon-unchecked" ></span>
						                   <input type="checkbox" style="display: none" autocomplete="false" name="str[]" value="${tmp}">${tmp}
						                </div>
					                </label>
	        					</c:forEach>
	        					<!-- 원래방식 -->
				                <!-- <label class="btn btn-default btn-checkbox" style="width:170px">
				                	<div align="left">
					                    <span class="glyphicon glyphicon-unchecked" data-icon-on="glyphicon glyphicon-check" data-icon-off="glyphicon glyphicon-unchecked" ></span>
					                    <input name="checkbox[]" type="checkbox" value="1" style="display: none" autocomplete="false"/> 원룸
					                </div>
				                </label>
				                 -->
				                </div>
			                </div>
		                </div>
		                
		                <div class="row col-sm-12" style="margin-top:20px">
		                	<div>
        						<label class="control-label" style="width:100%" align="left" >2. 희망하는 위치</label><br>
        					</div>
        					<div>
        						<form:input class="form-control" type="text" placeholder="예) 제주 애월" path="wish_region"/>
        					</div>
        					<div>
        						<label class="control-label" style="width:100%; margin-top:20px" align="left">3. 희망 임대료 (원)</label><br>
        					</div>
        					<div>
        						<form:input class="form-control" type="text" placeholder="예) 300,000"  path="wish_price"/>
        					</div><div>
        						<label class="control-label" style="width:100%; margin-top:20px" align="left">이메일</label><br>
        					</div>
        					<div>
        						<form:input class="form-control" type="text" placeholder="예) abc123@mail.com" path="wish_email"/>
        					</div>
        					<div style="margin-top:20px">
        						<input type="submit" class="btn btn-danger btn-block" value="전송"/>
        					</div>
        				</div>
        			</div>
        			
        		</form:form>
        	</div> <!-- 왼쪽면 오른쪽면 감싸는 놈 -->
        </div> 
        
	</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
		
		

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!-- <script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script> -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
	<script src="resources/js/main_checkbox.js"></script> <!-- 방타입 체크박스 -->
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script src="resources/js/reaction_main.js"></script>
	<script type="text/javascript">
		/* 슬라이드 넘어가는 시간 */
		$(document).ready(function(){
			$('.carousel').carousel({
				interval:2000	/* 숫자크게하면 느려짐 */
			});
		});
	
		/* 달력 관련 */
		$(function(){
			$('#checkin').datepicker({
				dateFormat : 'yymmdd'
			});
		});
		
		$(function(){
			$('#checkout').datepicker({
				dateFormat : 'yymmdd'
			});
		});
	
		$(function(){
			var values = document.getElementByName("checkbox");
			for(var i=0; i<values.length; i++){
				if(values[i].checked){
					alert(values[i].value);
				}
			}
			
		});
		
		//화면 바뀜.
		$(document).ready(function() {
		    $(".first_screen").delay(2000).fadeOut(500,function(){
		    $(".second_screen").fadeIn(1000).show().delay(2000).fadeOut(500,function(){
		    $(".Last_screen").fadeIn(300).show();
		   });
		  });
		 });
		});

	</script>


</body>
</html>