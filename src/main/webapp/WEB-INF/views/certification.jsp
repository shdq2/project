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
<link rel="stylesheet" href="resources/css/certification.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
   <jsp:include page="topbar.jsp"></jsp:include>
   
   <div class="certification-container">
      <div class="certification-nav">
         <a href="profile.do" id="certification-list-1">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 보기</span>
         </a>
         <a href="profileEdit.do" id="certification-list-2">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 수정</span>
         </a>
         <a href="picture.do" id="certification-list-3">
            <i class="glyphicon glyphicon-picture menu-icon" aria-hidden="true"></i><span class="menu-title">사진 수정</span>
         </a>
         <a href="certification.do" id="certification-list-4">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">인증 현황</span>
         </a>
      </div>
      
      <div class="certification-main">
      	<div class="main-header">
			<h3>인증현황</h3>
			<p>User Certification</p>
		</div>
        <div class="certification-box" style="max-width:900px;width:100%;height:400px;background-color:#f1f4f5;padding:30px">
        	<div class="panel">
        		<div class="panel-heading">
        			<h3 class="panel-title">
        				이메일주소
        			</h3>
        		</div>
        		<div class="panel-body"> 
        			<p>${cvo.custom_id }으로 전송한 메시지의 링크를 클릭하여 이메일 주소를 인증해 주세요</p>
        			<p>이메일을 받지 못하셨나요? 스팸 폴더를 확인해보세요</p>
        			<p>이메일 변경은 <a href="profileEdit.do">여기</a>를 클릭하세요</p>
        		</div>
        	</div>
        	<br />
        	<div class="panel">
        		<div class="panel-heading">
        			<h3 class="panel-title">
        				전화번호
        			</h3>
        		</div>
        		<c:if test="${cvo.custom_phone == null || cvo.custom_phone=='' }">
	        		<div class="panel-body">
	        			<a href="profileEdit.do">프로필 수정</a>에서 전화번호를 인증하세요
	        		</div>
        		</c:if>
        		<c:if test="${cvo.custom_phone != null && cvo.custom_phone != '' }">
        		<div class="panel-body" style="color:#46be8a;background-color:rgba(231,250,242,.8);">
	        			${cvo.custom_phone } 인증완료.
	        		</div>
        		</c:if>
        	</div>
        </div>
      </div>
   </div>
   
   <script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.js"></script>
   <script type="text/javascript" src="resources/js/topbar.js"></script>
   <script type="text/javascript" src="resources/js/certification.js"></script>
   
   <script>
      $(function() {
         
      });
   </script>
</body>
</html>