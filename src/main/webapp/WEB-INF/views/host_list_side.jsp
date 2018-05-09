<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>

	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/host.css">

		<div class="host-side">
			<p style="text-align:center; font-size:20px; border-bottom: 1px solid #f2f2f2; height:50px" >숙소 상태</p>
			<a href="#">
				<span class="pull-left" style="color:#A50D73!important; margin-right:20px" ><i class="glyphicon glyphicon-play"></i></span>  
				<span class="pull-left1">미완성</span>
			</a>
			<a href="#">
				<span class="pull-left" style="color:#f2a654!important; margin-right:20px" ><i class="glyphicon glyphicon-play"></i></span>
				<span class="pull-left1">차단</span>
			</a>
			<a href="#">
				<span class="pull-left" style="color:#46be8a!important; margin-right:20px" ><i class="glyphicon glyphicon-play"></i></span>
				<span class="pull-left1">등록완료</span>
			</a>
			<br><br>
			<a href="/project/host_create.do">
				<span class="pull-left"><i class="glyphicon glyphicon-plus"></i></span> 
				<span class="pull-left1">새로운 숙소 등록</span>
			</a>
		</div>