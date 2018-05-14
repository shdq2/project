<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
	<style>
		/* 모달 창 제대로 띄우기 */
		.modal-backdrop.in {
			z-index: auto;
		}
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
											<form:input class="form-control inline" style="width: calc(100% - 35px)" type="text" value="${vo.room_month}" path="room_month"/> 원
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
						<form:form action="host_price3.do" modelAttribute="vo" method="post">
							<div class="panel-body">
								<div class="form-group col-sm-12">
									<label for="bank_name" class="control-label col-sm-3">은행선택</label>
									<div class="col-sm-9">
										<form:select class="form-control inline" id="bank_name" name="bank_name" path="bank_code">
											<option selected="selected"	value="">선택하세요.</option>
											<c:forEach var="tmp" items="${banklist}">
											
												<option value="${tmp.bank_code}" ${tmp.bank_code == vo.bank_code ? 'selected="selected"':''}>${tmp.bank_name}</option>
												
												<%--
												<c:if test="${vo.bank_name eq tmp.bank_code}">
													<option selected="selected" value="${tmp.bank_code}">${tmp.bank_name}</option>
												</c:if>
												<c:if test="${vo.bank_name eq null}">
													<option value="${tmp.bank_code}">${tmp.bank_name}</option>
												</c:if> --%>
												
											</c:forEach>
										</form:select>
									</div>
								</div>

								<div class="form-group col-sm-12">
									<label for="bank_num" class="control-label col-sm-3">계좌번호</label>
									<div class="col-sm-9">
										<form:input class="form-control" name="bank_num" type="number" id="bank_num" path="bank_num"/>
										<p class="help-block">숫자만 입력해주세요.</p>
									</div>
								</div>

								<div class="form-group col-sm-12">
									<label for="bank_depositor" class="control-label col-sm-3">예금주명</label>
									<div class="col-sm-9">
										<form:input class="form-control" name="bank_depositor" type="text" id="bank_depositor" path="bank_depositor"/>
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
								<h3 class="panel-title">요금 부과 방법을 선택하세요.</h3>
							</div>
							
							<div class="panel-body">
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-3">요금 부과 방법 선택</label>
									<div class="form-group col-sm-9">
										<div class="radio-inline">
											<input name="radio2" id="radio2-1" checked="checked" type="radio"> <span>중/중기 예약 위주 숙소 - 할인/할증 설정</span>
										</div><br/>
										<div class="radio-inline">
											<input name="radio2" id="radio2-2" type="radio"> <span>단기 예약 위주 숙소 - 주말 가격 설정</span>
										</div>
										<p class="help-block" style="color:#76838f;font-size:14px;">
	                                        <span style="color: red;">할인/할증 설정 : </span>숙박 시기 및 기간별 가격을 따로 적용할 수 있습니다.<br>
	                                        <span style="color: red;">주말 가격 설정 : </span>일주일 미만의 단기 예약 숙소의 경우, 주말 가격을 따로 설정 할 수 있습니다.
                                   		</p>
									</div>
								</div>
							</div>
							
							<div id="discount_show">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-9">
										<h3 class="panel-title">숙박 일수별 요금 설정</h3>
										</div>
										<div class="col-md-3">
											<div align="center">
												<input style="margin-top:6px" type="button" class="btn term-button" value="기간 추가"/>
											</div>
										</div>
									</div>
								</div>
								
								<table class="table">
									<thead>
										<tr>
											<td class="text-center">설정기간</td>
											<td class="text-center" style="width:63%">설정내용</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="vo" varStatus="i">
											<tr>
												<c:if test="${vo.busy_month_start eq null && vo.busy_day_start eq null && vo.busy_month_end eq null && vo.busy_day_end eq null}">
													<td align="center" style="vertical-align:middle">
														<a href="#" class="term_fix_button">1월/1일 - 12월/31일</a>
														<a href="#" class="term_fix_del" id="term_fix_del"><i class="glyphicon glyphicon-remove" id="remove_btn"></i></a>
														<input type="text" class="price_code" value="${vo.price_code}" style="display:none"/> 
													</td>
												</c:if>
												<c:if test="${vo.busy_month_start ne null && vo.busy_day_start ne null && vo.busy_month_end ne null && vo.busy_day_end ne null}">
													<td align="center" style="vertical-align:middle">
														<a href="#" class="term_fix_button">${vo.busy_month_start}/${vo.busy_day_start} - ${vo.busy_month_end}/${vo.busy_day_end}</a>
														<a href="#" class="term_fix_del" id="term_fix_del"><i class="glyphicon glyphicon-remove" id="remove_btn"></i></a>
														<input type="text" class="price_code" value="${vo.price_code}" style="display:none"/> 
													</td>
												</c:if>
												
												<td>
													<table class="table">
														<thead>
															<tr>
																<td class="text-center">숙박</td>
																<td class="text-center">1박 금액(원)</td>
																<td class="text-center">삭제</td>
																<!-- <td class="text-center">수정</td> -->
															</tr>
														</thead>
														<tbody>
															<c:forEach var="list" items="${list2}">
																<c:if test="${list ne null}">
																	<c:forEach var="vo1" items="${list}">
																		<c:if test="${vo.price_code eq vo1.price_code}">
																			<input type="text" value="${vo1.rt_code}" id="index_of_rtcode" class="index_of_rtcode" style="display:none"/>
																			<tr>
																				<td class="text-center">${vo1.rt_day} 박 이상 숙박 시</td>
																				<td class="text-center">${vo1.rt_price}</td> 
																				<td class="text-center">
																					<a href="#" class="term_fix_del1" id="term_fix_del1">
																						<i class="glyphicon glyphicon-remove" id="remove_btn1"></i>
																					</a>
																				</td>
																				<!-- <td class="text-center"><i class="glyphicon glyphicon-pencil" id="revise_btn"></i></td> -->
																			</tr>
																		</c:if>
																	</c:forEach>
																</c:if>
															</c:forEach>
															<tr>
																<td colspan="4">
																	<input style="width: 100%" type="button" value="이 기간에 설정 추가" class="btn plus-option" />
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- <div class="panel-body">
									<div class="form-group ">
										<div class="pull-right">
											<input class="btn btn-primary btn-block" type="submit" value="저장">
										</div>
									</div>
								</div> -->
							</div>
							
							<form:form action="host_price4.do" modelAttribute="vo" method="post">
								<div id="weekend_show" style="display: none">
									<div class="panel panel-bordered">
											<div class="panel-heading">
												<h3 class="panel-title">주말 가격 설정 
												<span class="panel-desc">일자별로 가격 변동이 있을 시 평일 가격과 별도로 가격을 설정하세요.</span>
												</h3>
											</div>
											
											<div class="panel-body">
												<div class="form-group">
													<div class="control-label col-sm-3 checkbox checkbox-primary">
														<div style="margin-left:60px">
															<c:if test="${vo.fri_price == 0}">
																<input type="checkbox" id="fri_price" name="fri_price_agree" class="weekend_price"  />
															</c:if> 
															<c:if test="${vo.fri_price != 0}">
																<input type="checkbox" id="fri_price" name="fri_price_agree" class="weekend_price" checked="checked"/>
															</c:if> 
															<label for="fri_price">금요일</label>
														</div>
													</div>
	
													<div class="col-sm-9">
														<c:if test="${vo.fri_price == 0}">
															<form:input path="fri_price" id="fri_price_text" class="form-control inline" style="width: calc(100% - 35px)" disabled="disabled" type="number"/> 원
														</c:if> 
														<c:if test="${vo.fri_price != 0}">
															<form:input path="fri_price" id="fri_price_text" class="form-control inline" style="width: calc(100% - 35px)" type="number"/> 원
														</c:if>
														<span class="help-block" id="month-price" style="font-size: 13px;">금요일 1박 가격을 입력하세요.</span>
													</div>
												</div>
	
												<div class="form-group">
													<div class="col-sm-3 control-label  checkbox checkbox-primary">
														<div style="margin-left:60px">
															<c:if test="${vo.sat_price == 0}">
																<input type="checkbox" id="sat_price" name="sat_price_agree" />
															</c:if> 
															<c:if test="${vo.sat_price != 0}">
																<input type="checkbox" id="sat_price" name="sat_price_agree" checked="checked"/>
															</c:if> 
															<label for="sat_price">토요일</label>
														</div>
													</div>
													<div class="col-sm-9">
														<c:if test="${vo.sat_price == 0}">
															<form:input path="sat_price" id="sat_price_text" class="form-control inline" style="width: calc(100% - 35px)" disabled="disabled" name="price[sat_price]" type="number"/> 원 
														</c:if>
														<c:if test="${vo.sat_price != 0}">
															<form:input path="sat_price" id="sat_price_text" class="form-control inline" style="width: calc(100% - 35px)"  name="price[sat_price]" type="number"/> 원 
														</c:if>
														<span class="help-block" id="month-price" style="font-size: 13px;">토요일 1박 가격을 입력하세요.</span>
													</div>
												</div>
	
												<div class="form-group">
													<div class="control-label col-sm-3  checkbox checkbox-primary">
														<div style="margin-left:60px">
															<c:if test="${vo.sun_price == 0}">
																<input type="checkbox" id="sun_price" name="sun_price_agree" class="weekend_price" />
															</c:if> 
															<c:if test="${vo.sun_price != 0}">
																<input type="checkbox" id="sun_price" name="sun_price_agree" class="weekend_price" checked="checked"/>
															</c:if> 
															<label for="sun_price">일요일</label>
														</div>
													</div>
													<div class="col-sm-9">
														<c:if test="${vo.sun_price == 0}">
															<form:input path="sun_price" id="sun_price_text" class="form-control inline" style="width: calc(100% - 35px)" disabled="disabled" name="price[sun_price]" type="number"/> 원
														</c:if>
														<c:if test="${vo.sun_price != 0}">
															<form:input path="sun_price" id="sun_price_text" class="form-control inline" style="width: calc(100% - 35px)" name="price[sun_price]" type="number"/> 원
														</c:if>
														<span class="help-block" id="month-price" style="font-size: 13px;">일요일 1박 가격을 입력하세요.</span>
													</div>
												</div>
											</div>
									</div>
									<div class="panel-header">
										<h3 class="panel-title">도움말</h3>
									</div>
									<ul class="list-group list-group-full" style="padding-left: 50px">
										<li class="list-group-item" style="padding-bottom: 5px">1. 금, 토, 일요일 중 요금을 별도로 설정하고자 하는 기간에 체크하여 가격을 설정하세요.</li>
										<li class="list-group-item" style="padding-bottom: 5px">2. 주말가격은 기본설정보다 우선하여 적용됩니다.</li>
										<li class="list-group-item" style="padding-bottom: 5px">3. 예약 계산기에서 미리 숙박 가격을 계산해보세요.</li>
									</ul>
									<div class="panel-body">
										<div class="form-group ">
											<div class="pull-right">
												<input class="btn btn-primary btn-block" type="submit" value="저장">
											</div>
										</div>
									</div>
								</div>
							</form:form>
						<div class="panel-body">
							<div class="pull-right">
								<!-- <input type="button" class="btn btn-primary btn-block btn_next_price" id="btn_next_price" style="width:100px" value="다음"/> -->
								<a href="host_price_next.do" class="btn btn-primary btn-block btn_next" style="width:100px">다음</a>
							</div>
						</div>
						</div><!-- panel -->
						</div> <!--=====================================-->
						
					<!-- 요금계산 -->
					<div class="col-md-12 col-lg-10 col-xlg-7">
						<div class="panel">
							<h3 class="p-r-title">
								<span class="panel-desc">기본금액 (특정 기간은 다를 수 있음)</span><br />
								<span class="font-size-30 red-600" style="color: #A50D73; font-size: 30px; font-weight: bolder">
								<span style="font-weight: bold;">₩</span> 
								<fmt:formatNumber value="${vo.room_day}" pattern="#,###" /> <small>(1박)</small>
								</span><br />
								<br /> <small>※ <small style="color: #A50D73; font-size: 16px;">최소 1박</small> 부터 이용 가능한
									숙소
								</small><br /> <small>※ 위 금액은 비수기, 성수기에 따라 금액이 상이할 수 있습니다.</small>
							</h3>

							<div class="p-r-body">
								<div class="col-sm-8" style="display: block; clear: both; margin-bottom: 15px;">
									<label>체크인 / 체크아웃</label> 
									<input type="text" class="form-control daterange" value="체크인 / 체크아웃" />
								</div>


								<div class="col-sm-4" style="display: block;">
									<label>총 숙박인원 <i data-toggle="tooltip"
										data-placement="top"
										class="glyphicon glyphicon-question-sign menu-icon"
										aria-hidden="true" data-tooltip="true"
										title="어른과 아이 모두 포함한 인원 수 입니다."></i></label> <select
										class="form-control" required="required" name="people">
										<c:forEach var="i" begin="1" end="19">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
								</div>

								<div style="clear: both;"></div>

								<div class="col-sm-8" style="display: block; clear: both;">
									<label>아이 동반 여부 <i data-toggle="tooltip"
										data-placement="top"
										class="glyphicon glyphicon-question-sign menu-icon"
										aria-hidden="true" data-tooltip="true"
										title="총 숙박인원 중 아이가 있을 경우 체크해 주세요."></i></label>
								</div>
								<div class="col-sm-4" style="display: block;">
									<div class="click-open"	style="text-align: center; display: block; font-weight: 300; cursor: pointer;">열기 ▼</div>
									<div class="click-close" style="text-align: center; display: none; font-weight: 300; cursor: pointer;">닫기 ▲</div>
								</div>
								<div class="add-child-box" style="display: none;">
									<div class="col-sm-6" style="margin-top: 15px; text-align: center;">
										<label>만 3세 미만</label>
									</div>
									<div class="col-sm-6" style="margin-top: 15px;">
										<select class="form-control" required="required" name="people">
											<c:forEach var="i" begin="0" end="10">
												<c:if test="${i ne 10}">
													<option value="${i}">${i}</option>
												</c:if>
												<c:if test="${i eq 10}">
													<option value="${i}">${i}+</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-6" style="margin-top: 15px; text-align: center;">
										<label>만 8세 미만</label>
									</div>
									<div class="col-sm-6" style="margin-top: 15px;">
										<select class="form-control" required="required" name="people">
											<c:forEach var="i" begin="0" end="10">
												<c:if test="${i ne 10}">
													<option value="${i}">${i}</option>
												</c:if>
												<c:if test="${i eq 10}">
													<option value="${i}">${i}+</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-6"
										style="margin-top: 15px; text-align: center;">
										<label>만 13세 미만</label>
									</div>
									<div class="col-sm-6" style="margin-top: 15px;">
										<select class="form-control" required="required" name="people">
											<c:forEach var="i" begin="0" end="10">
												<c:if test="${i ne 10}">
													<option value="${i}">${i}</option>
												</c:if>
												<c:if test="${i eq 10}">
													<option value="${i}">${i}+</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div class="col-sm-12">
									<button type="submit" id="btn-reservation" class="btn btn-custom" style="width: 100%; margin-top: 15px; margin-bottom: 15px;">예약 조회</button>
								</div>
								<div class="col-sm-12">
									<small>* 예약 신청 후 호스트 수락 시 결제가 가능합니다.</small>
								</div>
								<div class="col-sm-12">
									<small>* 숙박료는 서비스 이용료가 포함된 요금입니다.</small>
								</div>
								<div style="clear: both;"></div>
							</div>


						</div>
					</div>
						
				</div>
				</div>
			</div>
		</div>
	
	<!-------------------------- modal창 ------------------------------>
	<div class="modal fade" id="term-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1>성수기 기간 추가</h1>
					<p>특정기간에 대한 할증 및 할인을 설정하고 싶다면, 해당 기간을 입력하세요.</p>
				</div>
				<form:form action="host_price_modal1.do" modelAttribute="vo" method="post">
					<div class="modal-body"> 
						<div class="form-group">
							<label class="control-label">이 날짜부터</label>
							<div class="from-inline">
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_month_start" path="busy_month_start">
									<c:forEach var="i" end="12" begin="1">
										<option id="modal_month1">${i}월</option>
									</c:forEach>
								</form:select>
								<span style="margin:0 5px">/</span>
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_day_start" path="busy_day_start">
									<c:forEach var="i" end="31" begin="1">
										<option id="modal_day1">${i}일</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">이 날짜까지</label>
							<div class="from-inline">
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_month_end" path="busy_month_end">
									<c:forEach var="i" end="12" begin="1">
										<option id="modal_month2">${i}월</option>
									</c:forEach>
								</form:select>
								<span style="margin:0 5px">/</span>
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_day_end" path="busy_day_end">
									<c:forEach var="i" end="31" begin="1">
										<option id="modal_day2">${i}일</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="checkbox checkbox-primary">
							<input type="checkbox" id="basic_chk"/>
							<label for="basic_chk">기본 설정</label>
						</div>
						<p style="font-size:13px"><font style="color:red">기본설정</font>은 할증/할인 기간에 해당되지 않는 기간에 적용됩니다.</p>
					</div>
					<div class="modal-footer">
						<input style="width:100%" type="submit" class="btn btn-primary" value="추가"/>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="term-fix-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1>할증/할인 기간변경</h1>
					<p>특정기간에 대한 할증 및 할인을 설정하고 싶다면, 해당 기간을 입력하세요.</p>
				</div>
				<form:form action="host_price_modal2.do" modelAttribute="vo" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label">이 날짜부터</label>
							<div class="from-inline">
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_month_start1" path="busy_month_start">
									<c:forEach var="i" end="12" begin="1">
										<option id="modal_month1">${i}월</option>
									</c:forEach>
								</form:select>
								<span style="margin:0 5px">/</span>
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_day_start1" path="busy_day_start">
									<c:forEach var="i" end="31" begin="1">
										<option id="modal_day1">${i}일</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">이 날짜까지</label>
							<div class="from-inline">
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_month_end1" path="busy_month_end">
									<c:forEach var="i" end="12" begin="1">
										<option id="modal_month2">${i}월</option>
									</c:forEach>
								</form:select>
								<span style="margin:0 5px">/</span>
								<form:select class="form-control inline" style="width:calc((100% - 30px)/2)" id="busy_day_end1" path="busy_day_end">
									<c:forEach var="i" end="31" begin="1">
										<option id="modal_day2">${i}일</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
					</div>
					<form:input type="text" id="price_code1" value="a" path="price_code"/>
					<div class="modal-footer">
						<input style="width:100%" type="submit" class="btn btn-primary" value="저장"/>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="plus-option">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1>옵션추가</h1>
					<p id="plus_option_date"></p>
				</div>
				<form:form action="host_price_modal3.do" modelAttribute="vo" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="calendar[min_night]" class="control-label">최소 숙박 일수</label>
							<form:input path="rt_day" class="form-control inline" min="1" style="width: calc(100% - 35px)" type="number" value="20" id="calendar[min_night]"/> 박
						</div>

						<div class="form-group">
							<label for="calendar[max_night]" class="control-label">1박 금액</label>
							<form:input path="rt_price" class="form-control inline" min="2" style="width: calc(100% - 35px)" name="calendar[max_night]" type="number" value="0" id="calendar[max_night]"/> 원
							<p class="help-block">1박당 금액에 적용됩니다.</p>
						</div>
					</div>
					<form:input type="text" id="price_code2" value="a"  path="price_code" style="display:none"/>
					<div class="modal-footer">
						<input style="width:100%" type="submit" class="btn btn-primary" value="저장"/>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<div style="display:none">
		<input type="text" id="confirm_name" value="${cVO.confirm_name}"/>
		<input type="text" id="confirm_basic" value="${cVO.confirm_basic}"/>
		<input type="text" id="confirm_location" value="${cVO.confirm_location}"/>
		<input type="text" id="confirm_amenity" value="${cVO.confirm_amenity}"/>
		<input type="text" id="confirm_img" value="${cVO.confirm_img}"/>
		<input type="text" id="confirm_price" value="${cVO.confirm_price}"/>
		<input type="text" id="confirm_inout" value="${cVO.confirm_inout}"/>
	</div>

	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script src="resources/js/sweetalert.min.js"></script>
	<script src="resources/js/hostside.js"></script>
	<!-- datepicker -->
	<!-- <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script> -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<script type="text/javascript">
		$(function(){
			
			//삭제 버튼
			$('.term_fix_del').click(function(){
				 var idx = $(this).index('.term_fix_del');
				 var pc = $('.price_code').eq(idx).val();
				/* alert(pc); */
				swal({
					title: "삭제",
					text: "정말 삭제하시겠습니까?",
					icon: "warning",
					buttons: true,
					dangerMode: true,
				})
				.then((willDelete) => {
					if(willDelete){
						window.location.href='host_price_del1.do?price_code='+pc
					}
				});
			});
			
			//삭제 버튼1
			$('.term_fix_del1').click(function(){
				 var idx = $(this).index('.term_fix_del1');
				 var rtc = $('.index_of_rtcode').eq(idx).val();
				/* alert(rtc); */
				swal({
					title: "삭제",
					text: "정말 삭제하시겠습니까?",
					icon: "warning",
					buttons: true,
					dangerMode: true,
				})
				.then((willDelete) => {
					if(willDelete){
						window.location.href='host_price_del2.do?rt_code='+rtc
					}
				});
			});
			
			//최초 기간 넣기 (modal1)
			$('.term-button').click(function(){
				$('#term-modal').modal('show');
			});
			
			//기간 수정 (modal2)
			$('.term_fix_button').click(function(){
	             var idx = $(this).index('.term_fix_button');
	             var pc = $('.price_code').eq(idx).val();
	             $('#price_code1').val(pc);
	             /*
	               var arr = new Array(); //js 배열 생성
	               <c:forEach var="vo" items="${list}">
	                  arr.push("${vo.price_code}");
	               </c:forEach> 
	             
	                $('#price_code1').val(arr[idx]);
	              */
	             
	               
                 var a = $(this).text();
				 var b = a.split(' - ');
				 var ba = b[0].split('/');
			     var bb = b[1].split('/');
					
					$('#busy_month_start1').val(ba[0]);
					$('#busy_day_start1').val(ba[1]);
					$('#busy_month_end1').val(bb[0]);
					$('#busy_day_end1').val(bb[1]);
	             
	               $('#term-fix-modal').modal('show');
	            });
			
			//기간에 대한 옵션 (modal3)
			$('.plus-option').click(function(){
				 var idx = $(this).index('.plus-option');
				 var pc = $('.price_code').eq(idx).val();
		             $('#price_code2').val(pc);
				 
		         var a = $('.term_fix_button').eq(idx).text();
				/* alert(a); */
				
				$('#plus_option_date').text(a+' 기간동안에 대한 옵션설정');
				$('#plus-option').modal('show');
			});
			
			
			$('#basic_chk').change(function(){
				if($('#basic_chk').is(':checked')){
					$('#busy_month_start').val('1월').attr('disabled', true);
					$('#busy_day_start').val('1일').attr('disabled', true);
					$('#busy_month_end').val('12월').attr('disabled', true);
					$('#busy_day_end').val('31일').attr('disabled', true);
				}else{
					$('#busy_month_start').val('1월').attr('disabled', false);
					$('#busy_day_start').val('1일').attr('disabled', false);
					$('#busy_month_end').val('1월').attr('disabled', false);
					$('#busy_day_end').val('1일').attr('disabled', false);
				}
			});
			
			$('#radio2-1').click(function(){
				if($('#radio2-1').is(':checked')){
					$('#discount_show').show();
					$('#weekend_show').hide();
				}else{
					$('#discount_show').hide();
					$('#weekend_show').show();
				}
			});
			
			$('#radio2-2').click(function(){
				
				if($('#radio2-2').is(':checked')){
					$('#discount_show').hide();
					$('#weekend_show').show();
				}else{
					$('#discount_show').show();
					$('#weekend_show').hide();
				}
			});
			
			if($('#fri_price_text').val() == 0){
				var a = $('#fri_price_text').val();
				$('#fri_price_text').attr('disabled', true);
			}
			
			if($('#sat_price_text').val() == 0){
				var a = $('#sat_price_text').val();
				$('#sat_price_text').attr('disabled', true);
			}
			
			if($('#sun_price_text').val() == 0){
				var a = $('#sun_price_text').val();
				$('#sun_price_text').attr('disabled', true);
			}
			
			$('#fri_price').click(function(){
				if($('#fri_price').is(':checked')){
					$('#fri_price_text').attr('disabled', false); 
				}else{
					$('#fri_price_text').attr('disabled', true);
					$('#fri_price_text').val(0);
				}
			});
			$('#sat_price').click(function(){
				if($('#sat_price').is(':checked')){
					$('#sat_price_text').attr('disabled', false);
				}else{
					$('#sat_price_text').attr('disabled', true);
					$('#sat_price_text').val(0);
				}
			});
			$('#sun_price').click(function(){
				if($('#sun_price').is(':checked')){
					$('#sun_price_text').attr('disabled', false);
				}else{
					$('#sun_price_text').attr('disabled', true);
					$('#sun_price_text').val(0);
				}
			});
			
			  $('.daterange').daterangepicker({
                 autoApply:true,
                 locale: {
                    'format':'YYYY/MM/DD',
                    'daysOfWeek': [
                          "일",
                          "월",
                          "화",
                          "수",
                          "목",
                          "금",
                          "토"
                      ],
                    'monthNames': [
                          "1월",
                          "2월",
                          "3월",
                          "4월",
                          "5월",
                          "6월",
                          "7월",
                          "8월",
                          "9월",
                          "10월",
                          "11월",
                          "12월"
                      ]
                 },
                 'minDate': new Date()
              }, function(start, end) {
                 console.log('start : ' + start.format('YYYY-MM-DD'));
                 console.log('end : ' + end.format('YYYY-MM-DD'));
              });
			 
			  $('.click-open').click(function() {
			      $('.click-open').css('display', 'none');
			      $('.click-close').css('display', 'block');
			      $('.add-child-box').css('display', 'block');
			   });

			   $('.click-close').click(function() {
			      $('.click-open').css('display', 'block');
			      $('.click-close').css('display', 'none');
			      $('.add-child-box').css('display', 'none');
			   }); 
			 
		});
	</script>
	
</body>
</html>