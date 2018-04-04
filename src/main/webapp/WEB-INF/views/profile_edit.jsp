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
      <form:form action="profileEdit.do" method="post" modelAttribute="cvo" id="form">
      <div class="profile-main">
         <div class="main-header">
            <h3>프로필 수정</h3>
            <p>Edit profile</p>
         </div>
         <div class="main-content">
            <h3>필수 항목</h3>
            
            <form:form action="profile_edit.do" method="post" modelAttribute="cvo">
            <div class="form-group"  >
               <div class="col-sm-3 form-label">
                  <label>가입일시</label>
               </div>
               <!-- 
                  <div class="col-sm-9">
                     <p class="joindate">${vo.custom_joindate}</p>
                  </div>
               -->
               <div class="col-sm-9">
                  <p class="joindate">${cvo.custom_date }</p>
               </div>
            </div>
            <div class="form-group" style="height:40px;" >
               <div class="col-sm-3 form-label">
                  <label>이름</label>
               </div>
               <div class="col-sm-9" >
                  <form:input type="text" class="form-control" placeholder="이름을 입력하세요." path="custom_name" />
                  <label style="display:none;color:red;" id="name_chk"></label>
               </div>
            </div>
            <div class="form-group">
               <div class="col-sm-3 form-label">
                  <label>성별</label>
               </div>
               <div class="col-sm-9">
                  <form:select class="form-control" path="custom_gender">
                     <option value="1" <c:if test="${cvo.custom_gender == 1 }"> selected</c:if>>남성</option>
                     <option value="2" <c:if test="${cvo.custom_gender == 2 }"> selected</c:if>>여성</option>
                  </form:select>
               </div>
            </div>
            <div class="form-group" >
               <div class="col-sm-3 form-label">
                  <label>이메일</label>
               </div>
               <div class="col-sm-9">
                  <!-- 
                     <input type="text" class="form-control" placeholder="이메일 주소를 입력하세요." value="${vo.custom_id}" />
                  -->
                  <form:input type="text" class="form-control" placeholder="이메일 주소를 입력하세요." path="custom_id" id="custom_id"/>
                  <label style="display=none;color:red;" id="id_chk"></label>
                  <form:input type="hidden" path="origin_id" />
               </div>
            </div>
            <div class="form-group">
               <div class="col-sm-3 form-label">
                  <label>휴대전화</label>
               </div>
               <div class="col-sm-9">
               <div id="phone_div">
               
                  <c:if test="${cvo.custom_phone == null || cvo.custom_phone =='' }">
                  <a href="#" class="add-cellphone"><i class="glyphicon glyphicon-plus menu-icon"></i>전화번호 추가하기</a>
                  <div id="cellphone-panel" class="panel panel-default" style="border-color: #ccc; width: 100%; height: auto;">
                      <%-- <div id="cellphone" class="panel-body">
                        <label><i class="glyphicon glyphicon-phone menu-icon"></i> 휴대전화 인증</label><br/>
                        <label>국가를 선택하세요</label><br />
                        <select class="form-control">
                           <option>Republic of Korea</option>
                        </select><br />
                        <label>전화번호 추가</label>
                        <form:input type="text" class="form-control" placeholder="" path="custom_phone"/><br />
                        <a href="#" class="btn btn-default" style="width: 100%; background: #A50D73; color: white; border: 1px solid #A50D73" id="btn_send">인증문자 보내기</a>
                     </div>  --%>
                  </div>
                  </c:if>
                  <c:if test="${cvo.custom_phone != null && cvo.custom_phone !='' }">
                  
                     <div class="form-inline input-group">
                        <form:input type="text" class="form-control"  path="custom_phone" readonly="true" style="width:100%"/>
                        <input type="text" value="인증되었습니다" class="form-control" style="width:70%"/>
                        <input type="button" class="form-control" value="삭제" style="width:30%;margin:0px;" id="delete_phone"/>
                     </div>
                  
                  </c:if>
               </div>
               <div style="display:none" id="phone">
                  <div class="form-inline input-group">
                     <form:input type="text" class="form-control"  path="custom_phone" readonly="true" style="width:100%" id="phone_val"/>
                     <input type="text" value="인증되었습니다" class="form-control" style="width:70%"/>
                     <input type="button" class="form-control" value="삭제" style="width:30%;margin:0px;" id="delete_phone"/>
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
                  <form:textarea style="resize: none;" rows="10" class="form-control" path="custom_introduce"></form:textarea>   
               </div>
            </div>
            
            <div style="width: 100%; padding: 20px 0px 20px 0px"></div>
            
            <h3>예약금 수령 입금정보</h3>
            <div class="form-group">
               <div class="col-sm-3 form-label">
                  <label>은행선택</label>
               </div>
               <div class="col-sm-9">
                  <form:select class="form-control" path="bank_code" id="bank_list">
                     <c:forEach var="i" items="${bank }">
                        <option value="${i.bank_code}" <c:if test="${i.bank_code == cvo.bank_code}">selected</c:if>>${i.bank_name}</option>                     
                     </c:forEach>
                  </form:select>
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
                  <form:input type="text" class="form-control" placeholder="" path="custom_cash"/>
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
                  <form:input type="text" class="form-control" placeholder="" path="custom_bank_host"/>
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
                  <form:input type="text" class="form-control" placeholder="나이를 입력하세요." path="custom_age"/>
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
                  <form:input type="text" class="form-control" placeholder="직업을 입력하세요." path="custom_job"/>
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
                  <form:input type="text" class="form-control" placeholder="홈페이지를 입력하세요." path="custom_homepage"/>
               </div>
            </div>
            <div style="width: 100%; display: inline-block; margin-top: 10px;">
               <button type="button" id="btn-save" class="btn btn-primary">저장하기</button>
            </div>
            </form:form>
            
            <div style="clear: both; padding-bottom: 40px;"></div>
         </div>
      </div>
      </form:form>
   </div>

<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/topbar.js"></script>
<script type="text/javascript" src="resources/js/profile_edit.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
<script>
   function validateEmail(email) {
      var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{1})?)$/i;
      return re.test(email);
   }
   $(function() {
      var id = '${cvo.custom_id}';
      var origin_id = '${cvo.custom_id}';
      //json 파일 불러오기
      /* var bankjson = "resources/json/bank.json";
      $.get(bankjson, function(data){
         $.each(data, function(I, item){
            if(bank == item.name){
               $('#bank_list').append(
                  '<option value="'+item.code+'" selected>'+item.name+'</option>'      
               );               
            }else{
               $('#bank_list').append(
                  '<option value="'+item.code+'">'+item.name+'</option>'      
               );
            }
            
         });

      }); */
      $(document).on('click','#delete_phone',function(){
         
         $.get('Json_delete_phone.do',function(data){
            $('#phone_div').empty();
            $('#cellphone-panel').empty();
            $('#phone').empty();
            $('#phone_div').append(
               '<a href="#" class="add-cellphone"><i class="glyphicon glyphicon-plus menu-icon"></i>전화번호 추가하기</a>'+
                  '<div id="cellphone-panel" class="panel panel-default" style="border-color: #ccc; width: 100%; height: auto;">'+
                  
                   '</div>'      
            );
         },'json');
      }) 
      $(document).on('click','.add-cellphone',function(){
         console.log("test");
         $('#cellphone-panel').empty();
         console.log("test1");
         $('#cellphone-panel').append(
            '<div id="cellphone" class="panel-body" style="border-color: #ccc; width: 100%; height: auto;">'+
               '<label><i class="glyphicon glyphicon-phone menu-icon"></i> 휴대전화 인증</label><br/>'+
               '<label>국가를 선택하세요</label><br />'+
               '<select class="form-control">'+
                  '<option>Republic of Korea</option>'+
               '</select><br />'+
               '<label>전화번호 추가</label>'+
               '<input type="text" class="form-control" placeholder="" id="custom_phone"/><br />'+
               '<a href="#" class="btn btn-default" id="btn_send" style="width: 100%; background: #A50D73; color: white; border: 1px solid #A50D73">인증문자 보내기</a>'+
            '</div>'
         );
         console.log("test3");
      });
      
      $(document).on('click','#btn_send',function(){
         $('#phone_val').val($('#custom_phone').val());
         $('#phone').css("display","block");
         $('#phone_div').empty();
      });
      $('#custom_name').keyup(function(){
         if($('#custom_name').val()!=""){
            $('#custom_name').css("border-color","");
            $('#name_chk').css("display","none");
            
         }
      });
      $('#custom_id').keyup(function(){
         if($('#custom_id').val()!=""){
            $('#custom_id').css("border-color","");
            $('#id_chk').css("display","none");
            
         }
      });
      $('#btn-save').click(function(){
         var custom_id=$('#custom_id').val();
         if(custom_id == origin_id){
            if($('#custom_name').val() == ""){
               $('#custom_name').css("border-color","red");
               $('#custom_name').focus();
               $('#name_chk').text("항목이 비어있습니다");
               $('#name_chk').css("display","block");
            }else{
               $('#form').submit();
            }
         }else{            
            if($('#custom_name').val() == ""){
               $('#custom_name').css("border-color","red");
               $('#custom_name').focus();
               $('#name_chk').text("항목이 비어있습니다");
               $('#name_chk').css("display","block");
            }
            if($('#custom_id').val()==""){
               $('#custom_id').css("border-color","red");
               $('#custom_id').focus();
               $('#id_chk').text("항목이 비어있습니다");
               $('#id_chk').css("display","block");
            }else{
               if(!validateEmail(custom_id)){
                  $('#id_chk').text("올바른 이메일 형식이 아닙니다");
                  $('#id_chk').css("display","block");
                  $('#custom_id').css("border-color","red");
                  $('#custom_id').focus();
               }
               else{
                  $.get('Json_id_check.do?custom_id='+custom_id,function(data){
                     if(!data){
                        $('#id_chk').text("사용중인 이메일 입니다.");
                        $('#id_chk').css("display","block");
                        $('#custom_id').css("border-color","red");
                        $('#custom_id').focus();                        
                     }else{
                        if($('#custom_name').val() != ""){
                           $('#form').submit();
                        }
                     }
                  })   
               }
               
            }
                     
         
         }
      })
      
   });
</script>
</body>
</html>