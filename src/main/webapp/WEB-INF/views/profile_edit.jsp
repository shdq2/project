<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/profile_edit.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	
	<div class="profile-container">
		<div class="profile-nav">
			<a href="profile.do" id="profile-list-1">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 보기</span>
			</a>
			<a href="profileEdit.do" id="profile-list-2">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 수정</span>
			</a>
			<a href="profile/picture/edit.do" id="profile-list-3">
				<i class="glyphicon glyphicon-picture menu-icon" aria-hidden="true"></i><span class="menu-title">사진 수정</span>
			</a>
			<a href="profile/certification.do" id="profile-list-4">
				<i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">인증 현황</span>
			</a>
		</div>
		
		<div class="profile-main">
			<div class="main-header">
				<h3>프로필 수정</h3>
				<p>Edit profile</p>
			</div>
			<div class="main-content">
				<h3>필수 항목</h3>
				
				<form:form action="profile_edit.do" method="post" modelAttribute="vo">
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>가입일시</label>
					</div>
					<!-- 
						<div class="col-sm-9">
							<p class="joindate">${vo.custom_joindate}</p>
						</div>
					-->
					<div class="col-sm-9">
						<p class="joindate">2018년 03월 09일 15시57분</p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>이름</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<input type="text" class="form-control" placeholder="이름을 입력하세요." value="${vo.custom_name}" />
						-->
						<input type="text" class="form-control" placeholder="이름을 입력하세요." value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>성별</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control">
							<option value="1">남성</option>
							<option value="2">여성</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>이메일</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<input type="text" class="form-control" placeholder="이메일 주소를 입력하세요." value="${vo.custom_id}" />
						-->
						<input type="text" class="form-control" placeholder="이메일 주소를 입력하세요." />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>휴대전화</label>
					</div>
					<div class="col-sm-9">
						<a href="#" class="add-cellphone"><i class="glyphicon glyphicon-plus menu-icon"></i>전화번호 추가하기</a>
						<div id="cellphone-panel" class="panel panel-default" style="border-color: #ccc; width: 100%; height: auto;">
							<div id="cellphone" class="panel-body">
								<label><i class="glyphicon glyphicon-phone menu-icon"></i> 휴대전화 인증</label><br/>
								<label>국가를 선택하세요</label><br />
								<select class="form-control">
									<option>Republic of Korea</option>
								</select><br />
								<label>전화번호 추가</label>
								<input type="text" class="form-control" placeholder="" /><br />
								<a href="#" class="btn btn-default" style="width: 100%; background: #A50D73; color: white; border: 1px solid #A50D73">인증문자 보내기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>자기소개</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<textarea rows="10" class="form-control">${vo.custom_introduce}</textarea>
						-->
						<textarea rows="10" class="form-control"></textarea>	
					</div>
				</div>
				
				<div style="width: 100%; padding: 20px 0px 20px 0px"></div>
				
				<h3>예약금 수령 입금정보</h3>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>은행선택</label>
					</div>
					<div class="col-sm-9">
						<select class="form-control">
							<option value="한국산업은행">한국산업은행</option>
							<option value="기업은행">기업은행</option>
							<option value="국민은행(주택은행)">국민은행(주택은행)</option>
							<option value="외환은행">외환은행</option>
							<option value="수협중앙회">수협중앙회</option>
							<option value="농협중앙회">농협중앙회</option>
							<option value="단위농협">단위농협</option>
							<option value="축협중앙회">축협중앙회</option>
							<option value="우리은행">우리은행</option>
							<option value="신한은행(조흔은행)">신한은행(조흥은행)</option>
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
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>계좌번호</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<input type="text" class="form-control" placeholder="" value="${vo.custom_cash}" />
						-->
						<input type="text" class="form-control" placeholder="" />
						<label style="color: #a2a2a2; font-weight: normal; font-size: small; margin-top: 12px; margin-bottom: 0px;">숫자만 입력해주세요.</label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>예금주명</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<input type="text" class="form-control" placeholder="" value="${vo.custom_depositor}" />
						-->
						<input type="text" class="form-control" placeholder="" />
					</div>
				</div>
				
				<div style="width: 100%; padding: 20px 0px 20px 0px"></div>
				
				<h3>선택항목</h3>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>나이</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<input type="text" class="form-control" placeholder="나이를 입력하세요." value="${vo.custom_age}" />
						-->
						<input type="text" class="form-control" placeholder="나이를 입력하세요." />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<label>직업</label>
					</div>
					<div class="col-sm-9">
						<!-- 
							<input type="text" class="form-control" placeholder="직업을 입력하세요." value="${vo.custom_job}" />
						-->
						<input type="text" class="form-control" placeholder="직업을 입력하세요." />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3 form-label">
						<!-- 
							<input type="text" class="form-control" placeholder="홈페이지를 입력하세요." value="${vo.custom_homepage}" />
						-->
						<label>홈페이지</label>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="홈페이지를 입력하세요." />
					</div>
				</div>
				<div style="width: 100%; display: inline-block; margin-top: 10px;">
					<button type="submit" id="btn-save" class="btn btn-primary">저장하기</button>
				</div>
				</form:form>
				
				<div style="clear: both; padding-bottom: 40px;"></div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/topbar.js"></script>
<script type="text/javascript" src="resources/js/profile_edit.js"></script>
<script>
	$(function() {
		
	});
</script>
</body>
</html>