
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/plug_in.jsp" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>

<script>

$(function(){
	
	//닉네임 중복확인 버튼
	$(".btn-enamecheck").click(function(){
	   var ename = document.getElementById("m_ename").value;
	   var enameCheck = document.getElementById("ename").value;
	   var paramData = {
	         "m_ename" : ename
	   }
	   if(ename == enameCheck){
	      $('input[name=enamecheckNum]').attr('value','3');
	      enamecheck1.type = "text";
	      alert("사용 가능한 닉네임입니다");
	   } else if(ename.length < 2 || ename.length > 12 ){
	      alert("닉네임은 3자리 이상으로 만들어주세요.")
	   } else {
	      $.ajax({
	         url : "${pageContext.request.contextPath}/board/checkEname",
	         type : "post",
	         dataType : "json",
	         data : paramData,
	         success : function(result){
	            if(result == 1){
	               enamecheck1.type = "hidden";
	               alert("중복된 닉네임입니다.")
	            } else if(result == 0){
	               $('input[name=enamecheckNum]').attr('value','3');
	               enamecheck1.type = "text";
	               alert("사용 가능한 닉네임입니다");
	            }
	         }
	         
	         
	      });
	      
	   }
	});
})


function validation(){
	
	var ename = document.getElementById("enamecheckNum").value;
	
	if(ename != 3){
		alert("닉네임 중복확인을 해주세요.")
		return false;
	}
	
}


</script>



<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->      
 
 <body class="hold-transition skin-blue sidebar-mini">

<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>

<div class="wrapper" >

    <!-- Main content -->
    
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회원정보 수정</h1>
            </div>
  <form role="form" method="post" onsubmit="return validation();" >
   <section class="content container-fluid" style="width:1300px; height:200px;">
         <div class="box" >
        
            <div class="box-body">
               <div class="form-group"style="height:60px;margin-left:420px;margin-top:50px;">
                  <label><h5> 아이디 </h5></label>  <input type="text" name="m_id1" id = "m_id1" value= "${Management.m_id}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;"/>
               </div>
                <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 비밀번호 </h5></label>  <input type="text" name="m_pw" id="m_pw" value="${Management.m_pw}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:30px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 이    름 </h5></label>  <input type="text" name="m_name" id="m_name" value="${Management.m_name}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:65px;text-align:center;border:none;"/>
               </div>
                <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 닉네임 </h5></label>  
                  <input type="text" name="m_ename" id="m_ename" value="${Management.m_ename}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;"/>
                  <input type="hidden" name="ename" id="ename" value="${Management.m_ename}"/>
                  <button type="button" class="btn btn-enamecheck" style="background-color:#81BEF7;color:#FFFFFF;">중복확인</button>
                  <input type='hidden' id='enamecheck1' name='enamecheck1' class="form-control" value="중복확인이 완료되었습니다." style="color:green; width:200px;height:28px;border:none;font-size:0.8em;text-align:center;margin-left:174px;margin-bottom:10px;" >
                    <input type='hidden' id='enamecheckNum' name='enamecheckNum' value='1'>
                   
               </div>
                   <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 이메일 </h5></label>  <input type="text" name="m_email" id="m_email" value="${Management.m_email}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:48px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 전화번호 </h5></label>  <input type="text" name="m_tel" id="m_tel" value="${Management.m_tel}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:28px;text-align:center;border:none;"/>
               </div>
                  <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 포인트 </h5></label>  <input type="text" name="m_pt" id="m_pt" value="${Management.m_pt}"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:48px;text-align:center;border:none;"/>
               </div>
               
		</div>
            </div>
         
      
         <div class="box-footer" style="height:30%;margin-left:600px;">
           <button type="submit" class="btn btn-primary">수정완료</button>
         
         </div>
   
       </section>
		</form>
<script>



</script>


</div>
</div>
</body>
</body>
</html>