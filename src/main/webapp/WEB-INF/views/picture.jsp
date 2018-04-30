<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta charset="UTF-8">
<title>미스터멘션</title>
<link rel="stylesheet" href="resources/css/w3.css" />
<link rel="stylesheet" href="resources/css/picture.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
   <jsp:include page="topbar.jsp"></jsp:include>
   
   <div class="picture-container">
      <div class="picture-nav">
         <a href="profile.do" id="picture-list-1">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 보기</span>
         </a>
         <a href="profileEdit.do" id="picture-list-2">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">프로필 수정</span>
         </a>
         <a href="picture.do" id="picture-list-3">
            <i class="glyphicon glyphicon-picture menu-icon" aria-hidden="true"></i><span class="menu-title">사진 수정</span>
         </a>
         <a href="certification.do" id="picture-list-4">
            <i class="glyphicon glyphicon-share menu-icon" aria-hidden="true"></i><span class="menu-title">인증 현황</span>
         </a>
      </div>
      
      <div class="picture-main">
         <div class="main-header">
			<h3>사진</h3>
			<p>User Photo's</p>
		</div>
		<div class="main-content"style="width:100%;max-width: 900px;">			
			<div class="col-xs-3 col-img" >
				<c:if test="${first == 0 }">
					<img src="resources/imgs/user.png" class="user-picture" />
				</c:if>
				<c:if test="${first != 0 }">
					<img src="show_img.do?code=${first }" class="user-picture profile-img"/>
				</c:if>
			</div>
			
			<div class="col-xs-9 col-main" style="margin:0px auto;">
				<div class="file-box form-control">
					<form enctype="multipart/form-data" method="post"  id="img_form" >
						<label for ="upload" class="btn-file"><span class="glyphicon glyphicon-picture"> </span> 사진 추기하기</label>
						<input type="file" id="upload" name="upload_img" accept=".jpg, .jpeg, .png"/>
					</form>
				</div>
				<div style="height:20px;"></div>

				<div class="file-drop" style="margin:0px auto;" >
					<c:if test="${!empty list }">
						<c:forEach var="i" items="${list}">
							<div class="block-xs-12 block-sm-6 block-md-3 ui-state-default photo" >
								<div style="position:relative;width:100%;">
									<div class="user-picture-list" style="position:relative;height:; ">
										<img src="show_img.do?code=${i.img_code }" class="picture-img" style="width:100%;" />	
									</div>
									<div style="float:right;margin-top:30px;bottom: 15px;height:5px;position:relative;right:5px;display:block">
										<input type="hidden" value="${i.img_code }" class="img_code"/>
										<a href="#"  style="color:red"><span class="glyphicon glyphicon-remove rm_btn"></span></a>
									</div>
								</div>
							</div> 
						</c:forEach>
					</c:if>
					<c:if test="${empty list }"> 
						<div style="color:#aaa;padding:25px 10px;font-size:30px;text-align:center">
						저장된 사진이 없습니다
						</div>
					</c:if>
				</div>
			</div>
		</div>
      </div>
   </div>
   
<div id="popup" class="Pstyle" > 
   <span class=" b-close glyphicon-remove" ></span> 
    <div class="content" style="height:100%;margin-top:5px;margin-bottom:15px;"> 
        <img src="" id="popimg" style="height:100%; width:100%; top:50px;"/> 
    </div>
</div> 

   <script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery-ui.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.js"></script>
   <script type="text/javascript" src="resources/js/topbar.js"></script>
   <script type="text/javascript" src="resources/js/picture.js"></script>
   <script type="text/javascript" src="resources/js/jquery.bpopup.min.js"></script>
   <script>
	$(function() {
		$('.photo').click(function(){
			var idx = $(this).index('.photo');
			  popimg.src = ('show_img.do?code='+$('.img_code').eq(idx).val()); 
		        $("#popup").bPopup(); 

		})
		$('.photo').each(function(idx){
			
		})
		$('.file-drop').sortable({
			update:function(){
				var list2 = "";
				$('.photo').each(function(idx){					
					list2 += $('.img_code').eq(idx).val()+"/";
					
				})
				
				 $.get('Json_sortable.do?val2='+list2,function(data){
					 var time = new Date().getTime();										 
					 $('.col-img').empty();
					 $('.col-img').append(
						'<img src="show_img.do?time='+time+'&code='+data[0].img_code+'" class="user-picture profile-img"/>'	 
					 );					 	 
					 
					w_resize();
				});
				 
			}
		});
		$( ".file-drop" ).disableSelection();
		$(document).on('change','#upload',function(){ 
			$('#img_form').ajaxSubmit({
				url: 'Json_upload_img.do',
				dataType: 'json',				
				processData:false,
				contentType:false,
				success: function(data) {				
				$('.file-drop').empty();
				if(data.length == 1){
					 $('.col-img').empty();
					 $('.col-img').append(
							'<img src="show_img.do?code='+data[0].img_code+'" class="user-picture profile-img"/>'	 
					 );
				}
					for(var i = 0; i<data.length;i++){
						console.log('추가 : ' + data[i].img_code);
        		   		$('.file-drop').append(
        		   				'<div class="block-xs-12 block-sm-6 block-md-3 ui-state-default photo" >'+
								'<div style="position:relative;width:100%;">'+
									'<div class="user-picture-list" style="position:relative;height:; ">'+
										'<img src="show_img.do?code='+data[i].img_code+'" class="picture-img" style="width:100%;" />'+	
									'</div>'+
									'<div style="float:right;margin-top:30px;bottom: 15px;height:5px;position:relative;right:5px;display:block">'+
										'<input type="hidden" value="'+data[i].img_code+'" class="img_code"/>'+
										'<a href="#"  style="color:red"><span class="glyphicon glyphicon-remove rm_btn"></span></a>'+
									'</div>'+
								'</div>'+
							'</div>'
        		   		);
					}
				
	        		w_resize();
	
				}   
				,error: function(request,status,error) {        		    
				alert("code:"+request.status+"n"+"message:"+request.responseText+"n"+"error:"+error);
				} 
			});
        })
        $(document).on('click','.rm_btn',function(){
        	var idx = $(this).index('.rm_btn');
        	var img_code = $('.img_code').eq(idx).val();
        	
        	$.get('Json_delete_profile.do?code='+img_code,function(data){
        		$('.file-drop').empty();
        		if(data.length == 0){
        			$('.col-img').empty();
					 $('.col-img').append(
							'<img src="resources/imgs/user.png" class="user-picture profile-img"/>'	 
					 );
        			$('.file-drop').append(
        				'<div style="color:#aaa;padding:25px 10px;font-size:30px;text-align:center">'+
    					'저장된 사진이 없습니다'+
    					'</div>	'
        			);        			
        		}else{
        			$('.col-img').empty();
					 $('.col-img').append(
							'<img src="show_img.do?code='+data[0].img_code+'" class="user-picture profile-img"/>'	 
					 );
        			for(var i = 0; i<data.length;i++){
        				
        		   		$('.file-drop').append(
        		   			'<div class="block-xs-12 block-sm-6 block-md-3 ui-state-default photo" >'+
								'<div style="position:relative;width:100%;">'+
									'<div class="user-picture-list" style="position:relative;height:; ">'+
										'<img src="show_img.do?code='+data[i].img_code+'" class="picture-img" style="width:100%;" />'+
									'</div>'+
									'<div style="float:right;margin-top:30px;bottom: 15px;height:5px;position:relative;right:5px;display:block">'+
										'<input type="hidden" value="'+data[i].img_code+'" class="img_code"/>'+
										'<a href="#"  style="color:red"><span class="glyphicon glyphicon-remove rm_btn"></span></a>'+
									'</div>'+
								'</div>'+
							'</div>'
        		   		);
    				}	
        			
        		}
        		w_resize();
				
        	})
		})
      });
   </script>
</body>
</html>