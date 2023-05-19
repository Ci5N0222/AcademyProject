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
                <h1 class="mb-0">회원정보 상세보기</h1>
            </div>
  
   <section class="content container-fluid" style="width:1300px; height:200px;">
  
         <div class="box" >
            <div class="box-body">
           
               <div class="form-group"style="height:60px;margin-left:420px;margin-top:50px;">
                  <label><h5> 아이디 </h5></label>  <input type="text" name="m_id" id = "m_id" value= "${Management.m_id}" readonly="readonly" 
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;"/>
                    
               </div>
                <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 비밀번호 </h5></label>  <input type="text" name="m_pw" id="m_pw" value="${Management.m_pw}" readonly="readonly"
                   style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:30px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 이  름 </h5></label>  <input type="text" name="m_name" id="m_name" value="${Management.m_name}" readonly="readonly"
                     style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:65px;text-align:center;border:none;"/>
               </div>
                <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 닉네임 </h5></label>  <input type="text" name="m_ename" id="m_ename" value="${Management.m_ename}" readonly="readonly"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 이메일 </h5></label>  <input type="text" name="m_email" id="m_email" value="${Management.m_email}" readonly="readonly"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 전화번호 </h5></label>  <input type="text" name="m_tel" id="m_tel" value="${Management.m_tel}" readonly="readonly"
                     style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:30px;text-align:center;border:none;"/>
               </div>
                  <div class="form-group"style="height:60px;margin-left:420px;">
                  <label><h5> 포인트 </h5></label>  <input type="text" name="m_pt" id="m_pt" value="${Management.m_pt}" readonly="readonly"
                  style="width:300px;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;"/>
               </div>
            </div>
         </div>
         
         <div class="box-footer" style="height:30%;margin-left:535px;">
           <button class="btn btn-primary" style="background-color:##F7D358;color:#FFFFFF;border:none">목록</button>
            <button class="btn btn-warning" style="background-color:#58D3F7;color:#FFFFFF;border:none">수정</button>
            <button class="btn btn-danger" style="background-color:#04B486;color:#FFFFFF;border:none">삭제</button>
            
         </div>
    
            
       </section>
      
<script>

   
$(function(){
    //목록 버튼을 눌렀을 때 처리
    $(".btn-primary").click(function(){
       var id = document.getElementById("m_id").value;
       location.href="adminPageMember";
    });

    
    $(".btn-warning").click(function(){
       
        var id = document.getElementById("m_id").value;
       location.href="adminPageMemberUpdate?m_id=" + id;
    });
    
   $(".btn-danger").click(function(){
      alert("회원정보가 삭제되었습니다");
      var id = document.getElementById("m_id").value;
      location.href="adminPageMemberDelete?m_id="+id;
   });
              //ajax를 통한 댓글 기능 작성하기
})





</script> 



</div>
</div>
</body>
</body>
</html>