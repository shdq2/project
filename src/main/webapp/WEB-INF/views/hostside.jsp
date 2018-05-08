<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>

	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/host.css">
	<link rel="stylesheet" href="resources/css/font-awesome1.css">

		<div class="host-side">
			<p style="text-align:center; margin-bottom:30px" >숙소설정</p>
			<!-- <div style="width:100%;border:1px solid;cursor: pointer;height:50px;vertical-align: middle;" class="test_div">
				<input type="hidden" value="/project/host.do" class="test_val" />
				<span>설명</span>
			</div>
			<div style="width:100%;border:1px solid;cursor: pointer;" class="test_div">
				<input type="hidden" value="/project/host.do" class="test_val" />
				<span>설명</span>
			</div> -->
			<a href="/project/host_name.do" >
				<span class="pull-left">설명</span>
				<span class="pull-right" id="name_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_basic.do">
				<span class="pull-left">기본설정</span>
				<span class="pull-right" id="basic_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_location.do">
				<span class="pull-left">위치</span>
				<span class="pull-right" id="location_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_amenity.do">
				<span class="pull-left">편의시설</span>
				<span class="pull-right" id="amenity_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_imgs.do">
				<span class="pull-left">사진</span>
				<span class="pull-right" id="img_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_price.do">
				<span class="pull-left">예약/요금 설정</span>
				<span class="pull-right" id="price_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_inout.do">
				<span class="pull-left">입/퇴실시간</span>
				<span class="pull-right" id="inout_icon" style="color:#D8D8D8"><i class="fa fa-check-circle"></i></span>
			</a>
			<a href="/project/host_calendar.do">
				<span class="pull-left"><i class="glyphicon glyphicon-calendar"></i></span>  
				<span class="pull-left1">달력 관리</span>
			</a>
			<a href="/project/host_create.do">
				<span class="pull-left"><i class="glyphicon glyphicon-plus"></i></span> 
				<span class="pull-left1">새로운 숙소 등록</span>
			</a>
			<a href="/project/host_list.do">
				<span class="pull-left"><i class="glyphicon glyphicon-th-list"></i></span>
				<span class="pull-left1">  숙소목록</span>
			</a>
		</div>