<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<jsp:include page="admin_menu.jsp"></jsp:include>
				<div class="col-md-9">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #095f59;">
							<h3 class="panel-title">Website Overview</h3>
						</div>
						<div class="panel-body">
							<div class="col-md-3">
								<div class="well dash-box">
								<table style="width:100%">
									<tr>
									<td style="width:30%"><h1>
										<c:if test="${ret < 0 }">
											<label style="color:red">${ret}</label>
										</c:if>
										<c:if test="${ret == 0 }">${ret }</c:if></h1>
									</td>
									<td style="width:30%">
										<h2>
											<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
											${sessionScope._ucount }
										</h2>
										<h4>User</h4>
									</td>
										<td style="width:30%"><h1>
											<c:if test="${ret > 0 }">
												<label style="color:green">+ ${ret}</label>
											</c:if>
											<c:if test="${ret == 0 }">${ret }</c:if></h1>
										</td>
									</tr>									
								</table>
									
								</div>
							</div>
							<div class="col-md-3">
								<div class="well dash-box">
									<h2>
										<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
										25
									</h2>
									<h4>Pages</h4>
								</div>
							</div>
							<div class="col-md-3">
								<div class="well dash-box">
									<h2>
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>126
									</h2>
									<h4>Posts</h4>
								</div>
							</div>
							<div class="col-md-3">
								<div class="well dash-box">
									<h2>
										<span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
										2129
									</h2>
									<h4>Visitores</h4>
								</div>
							</div>
						</div>
					</div>
					<!--Latest User-->
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #095f59;">
							<h3 class="panel-title">Latest Users</h3>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-hover">
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Joined</th>
								</tr>

								<c:forEach var="i" items="${clist }" end="3">
									<tr>
										<td>${i.custom_name }</td>
										<td>${i.custom_id }</td>
										<td>${i.custom_date }</td>
									</tr>
								</c:forEach>
							</table>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>


	<footer id="footer">
		<p>
			Copyright : Madhav Prasad<br>2017
		</p>
	</footer>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			$('.main').addClass("active");
		})
	</script>
</body>
</html>
