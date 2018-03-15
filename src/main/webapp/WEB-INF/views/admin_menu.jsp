<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="admin_css.jsp"></jsp:include>

<title>관리자 메뉴</title>

</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">TechnoGeeK</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="menu_check"><a href="index.html">Dashboard</a></li>
					<li class="menu_check"><a href="pages.html">Pages</a></li>
					<li class="menu_check"><a href="wish.do">Wish</a></li>
					<li class="menu_check"><a href="admin_member.do">Users</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.html">Welcome, Madhav</a></li>
					<li><a href="login.html">Logout</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>


	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<h1>
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						Dashboard <small>Manage Your Site</small>
					</h1>
				</div>
				<div class="col-md-2">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							Create Content <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Add Pages</a></li>
							<li><a href="#">Add wish</a></li>
							<li><a href="#">Add Users</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	</section>


	<section id="main">
		<div style="margin-left:10px;margin-right:10px;">
			<div class="row">
				<div class="col-md-3">
					<div class="list-group">
						<a href="admin.do" class="list-group-item  main"><span
							class="glyphicon glyphicon-cog" aria-hidden="true"></span> 메인 <span
							class="badge">12</span> </a> <a href="pages.html"
							class="list-group-item room_menu"><span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
							숙소관리<span class="badge">25</span></a> <a href="wish.do"
							class="list-group-item post_menu"><span
							class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							Wish<span class="badge">126</span></a> <a href="admin_member.do"
							class="list-group-item custom_menu"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span> 회원관리<span
							class="badge">${sessionScope._ucount }</span></a>
					</div>
				</div>