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

<title>호스트 페이지</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/font-awesome.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/host.css">
	<link rel="stylesheet" href="resources/css/checkbox.css">
	<style>
	</style>
</head>
<body>
	<!-- 메뉴바  -->
	<jsp:include page="topbar.jsp"></jsp:include>

	<div class="container1">
		
		<jsp:include page="hostside.jsp"></jsp:include>
		
		<div class="host-main">
			<div class="host-header">
				<h3 class="host-title">요금설정 <small>숙박요금을 설정하세요</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-10 col-xlg-7">
						<div class="panel">
						
						<form:form action="host_price1.do" method="post" modelAttribute="vo">
							<div class="panel-heading">
								<h3 class="panel-title">회원님이 숙소에서 사용할 수 있는 편의시설들을 체크하세요.</h3>
							</div>
							
							<div class="panel-body">
								<div class="form-group" >
									<label  class="control-label col-sm-3">최소 숙박 일수</label>
									<div class="col-sm-9">
										<form:input type="number" class="form-control inline" min="1" style="width: calc(100% - 35px)" path="room_min_day"/> 박
										<p class="help-block">20박 이상 설정 시 숙소 상세정보에서 한달가격으로 표시됩니다.</p>
									</div>
								</div>

								<div class="form-group">
									<label  class="control-label col-sm-3">최대 숙박 일수</label>
									<div class="col-sm-9">
										<form:input type="number" class="form-control inline" min="2" style="width: calc(100% - 35px)" path="room_max_day"/> 박
										<p class="help-block">최대 365일까지 설정가능합니다.</p>
									</div>
								</div>
							</div>

							<div class="panel-heading">
								<h3 class="panel-title">게스트에게 보일 가격 표시 방식을 선택하세요.</h3>
							</div>

							<div class="panel-body">
								<div class="form-group">
									<label class="control-label col-sm-3">금액 표시 방식</label>
									<div class="col-sm-9">
										<c:if test="${vo.room_price_show eq 'month'}" > 
											<div class="radio-inline">
												<input name="room_price_show" type="radio" checked="checked"  value="month"/> <label>한 달 가격으로 표시</label>
											</div>
											<div class="radio-inline">
												<input name="room_price_show" type="radio" value="day"/> <label>1박 가격으로 표시</label>
											</div>
										</c:if>
										<c:if test="${vo.room_price_show eq 'day'}" > 
											<div class="radio-inline">
												<input name="room_price_show" type="radio" value="month"/> <label>한 달 가격으로 표시</label>
											</div>
											<div class="radio-inline">
												<input name="room_price_show" type="radio" checked="checked"  value="day"/> <label>1박 가격으로 표시</label>
											</div>
										</c:if>
										<span class="help-block"> 게스트들에게 어떤 방식으로 가격을 보여줄지 결정합니다. </span>
									</div>
								</div>

								<div class="panel-body">
									<div class="form-group">
										<div class="pull-right">
											<input class="btn btn-primary btn-block" type="submit" value="저장">
										</div>
									</div>
								</div>
							</div>
						</form:form>

							<div class="panel-heading">
								<h3 class="panel-title">기본 요금 정보를 등록하세요.</h3>
							</div>
							
						<form:form action="host_price2.do" method="post" modelAttribute="vo">				
							<div class="panel-body">
									<div class="form-group col-sm-12">
										<label class="control-label col-sm-3">한 달 숙박 가격(29박 기준)</label>
										<div class="col-sm-9">
											<form:input class="form-control inline" style="width: calc(100% - 35px)" type="text" value="${vo.room_month_price}" path="room_month_price"/> 원
											<span class="help-block"></span>
										</div>
									</div>
									<div class="form-group col-sm-12">
										<label class="control-label col-sm-3">기본 보증금</label>
										<div class="col-sm-9">
											<form:input class="form-control inline" style="width: calc(100% - 35px)" type="text" value="${vo.room_basic_deposit}" path="room_basic_deposit"/> 원
											<span class="help-block"></span> 
										</div>
									</div>
								
							</div>
							
							<div class="panel-heading">
								<h3 class="panel-title">숙박 인원 수에 따른 요금 정보를 등록하세요.</h3>
							</div>
							
							<div class="panel-body">
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-3">기본 임대 인원</label>
									<div class="col-sm-9">
										<form:input class="form-control inline" style="width: calc(100% - 35px)" type="number" value="${vo.room_basic_member}" path="room_basic_member"/> 명
										<span class="help-block"></span>
									</div>
								</div>
								
							
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-3">추가 인원 금액 적용 방식</label>
									<div class="form-group col-sm-9">
										<c:if test="${vo.room_plus_price_apply eq 1}">
											<div class="radio-inline">
												<input name="room_plus_price_apply" checked="checked" type="radio" value="1"/> <label>1박당 추가 요금 적용</label>
											</div>
											<div class="radio-inline">
												<input name="room_plus_price_apply" type="radio" value="2"/> <label>전체 금액에 더하여 적용</label>
											</div>
										</c:if>
										<c:if test="${vo.room_plus_price_apply eq 2}">
											<div class="radio-inline">
												<input name="radio2" type="radio" value="1"/> <label>1박당 추가 요금 적용</label>
											</div>
											<div class="radio-inline">
												<input name="radio2" checked="checked" type="radio" value="2"/> <label>전체 금액에 더하여 적용</label>
											</div>
										</c:if>
										<span class="help-block"> 게스트들에게 어떤 방식으로 가격을 보여줄지 결정합니다. </span>
									</div>
								</div>
								
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-3">추가 인원 가격</label>
									<div class="col-sm-9">
										<form:input class="form-control inline" style="width: calc(100% - 35px)" type="text" value="${vo.room_plus_price}" path="room_plus_price"/> 원
										<span class="help-block">수용인원 초과 시 추가 인원 당 가격을 입력하세요.</span>
									</div>
								</div>
								
								<div class="panel-body">
									<div class="form-group">
										<div class="pull-right">
											<input class="btn btn-primary btn-block" type="submit" value="저장">
										</div>
									</div>
								</div>
							</div>
						</form:form>
							<div class="panel-heading">
								<h3 class="panel-title">예약금 수령을 위한 입금정보를 입력하세요. 
									<span class="panel-desc"> 프로필정보에 입금정보가 저장되어있지 않습니다. </span>
								</h3>
							</div>

							<div class="panel-body">
								<div class="form-group col-sm-12">
									<label for="bank_name" class="control-label col-sm-3">은행선택</label>
									<div class="col-sm-9">
										<select class="form-control inline" id="bank_name" name="bank_name">
											<option selected="selected"	value="">선택하세요.</option>
											<option value="한국산업은행">한국산업은행</option>
											<option value="기업은행">기업은행</option>
											<option value="국민은행(주택은행)">국민은행(주택은행)</option>
											<option value="외환은행">외환은행</option>
											<option value="수협중앙회">수협중앙회</option>
											<option value="농협중앙회">농협중앙회</option>
											<option value="단위농협">단위농협</option>
											<option value="축협중앙회">축협중앙회</option>
											<option value="우리은행">우리은행</option>
											<option value="신한은행(조흥은행)">신한은행(조흥은행)</option>
											<option value="제일은행">제일은행</option>
											<option value="하나은행(서울은행)">하나은행(서울은행)</option>
											<option value="신한은행">신한은행</option>
											<option value="한국씨티은행(한미은행)">한국씨티은행(한미은행)</option>
											<option value="대구은행">대구은행</option>
											<option value="부산은행">부산은행</option>
											<option value="광주은행">광주은행</option>
											<option value="제주은행">제주은행</option>
											<option value="전북은행">전북은행</option>
											<option value="강원은행">강원은행</option>
											<option value="경남은행">경남은행</option>
											<option value="비씨카드">비씨카드</option>
											<option value="씨티은행">씨티은행</option>
											<option value="홍콩상하이은행">홍콩상하이은행</option>
											<option value="우체국">우체국</option>
											<option value="하나은행">하나은행</option>
											<option value="평화은행">평화은행</option>
											<option value="신세계">신세계</option>
											<option value="신한은행(조흥 통합)">신한은행(조흥 통합)</option>
											<option value="신협">신협</option>
											<option value="새마을금고">새마을금고</option>
										</select>
									</div>
								</div>

								<div class="form-group col-sm-12">
									<label for="bank_num" class="control-label col-sm-3">계좌번호</label>
									<div class="col-sm-9">
										<input class="form-control" name="bank_num" type="number" id="bank_num">
										<p class="help-block">숫자만 입력해주세요.</p>
									</div>
								</div>

								<div class="form-group col-sm-12">
									<label for="bank_depositor" class="control-label col-sm-3">예금주명</label>
									<div class="col-sm-9">
										<input class="form-control" name="bank_depositor" type="text" id="bank_depositor">
									</div>
								</div>
								
								<div class="panel-body">
									<div class="form-group">
										<div class="pull-right">
											<input class="btn btn-primary btn-block" type="submit" value="저장">
										</div>
									</div>
								</div>
							</div>
							
							<div class="panel-heading">
								<h3 class="panel-title">요금 부과 방법을 선택하세요.
									<span class="panel-desc"></span>
								</h3>
							</div>
							
							<div class="panel-body">
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-3">요금 부과 방법 선택</label>
									<div class="form-group col-sm-9">
										<div class="radio-inline">
											<input name="radio2" checked="checked" type="radio"> <label>중/중기 예약 위주 숙소 - 할인/할증 설정</label>
										</div>
										<div class="radio-inline">
											<input name="radio2" type="radio"> <label>단기 예약 위주 숙소 - 주말 가격 설정</label>
										</div>
										<p class="help-block" style="color:#76838f;font-size:14px;">
	                                        <span style="color: red;">할인/할증 설정 : </span>숙박 시기 및 기간별 가격을 따로 적용할 수 있습니다.<br>
	                                        <span style="color: red;">주말 가격 설정 : </span>일주일 미만의 단기 예약 숙소의 경우, 주말 가격을 따로 설정 할 수 있습니다.
                                   		</p>
									</div>
								</div>
							</div>
							
							<div class="panel-heading">
								<h3 class="panel-title">기간별 세부 요금 설정
									<span class="panel-desc"></span>
								</h3>
							</div>
							
						</div> <!-- panel -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script type="text/javascript">
		
	</script>
	<script>
		/* $('.test_div').click(function(){
		var idx = $(this).index('.test_div');
		var val = $('.test_val').eq(idx).val();
		console.log(val);
		
		window.location.href=val;
		})  */
	</script>
</body>
</html>