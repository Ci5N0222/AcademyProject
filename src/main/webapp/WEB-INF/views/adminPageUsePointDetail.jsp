<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/plug_in.jsp" %>

<!DOCTYPE html>

<html>

<style>
#box{
    div.fixed { position: fixed; left:20%; right:30% }
}
</style>


<script>


$(function(){
   
})

  //
</script>
<style>
   .box1{
      position:absolute;
      width:160px;
      font-size:16px;
      height:100px;
      right:250px;
      
   }
</style>
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
<body>


<!-- title Start -->
      <div class="container-fluid bg-primary py-5 bg-header" >
      <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
    </div>
      </div>
         
      <div id="box20">
   <div>
   <!-- Main content -->
    <section class="content container">
    
       <div class="container-fluid py-5" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;">
                <h1 class="mb-0">${board.p_num}</h1>
            </div>
         </div>
<!-- title end-->
         <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:600;height:350;margin-left:27%;">  
            <div class="form-group" style="text-align:left;padding-left:55px;">
            <label><h6>신청번호</h6></label>
                     <input type="text" style="height:13%;width:320px;margin-left:30px;border:none;text-align:center;" value="${board.p_num}" readonly><br>            
                  <label><h6>수 신 자</h6></label>
                     <input type="text" style="height:13%;width:320px;margin-left:37px;border:none;text-align:center;margin-top:10px;" value="${board.p_name}" readonly><br>
                     <label><h6>휴대전화</h6></label>
                     <input type="text" style="height:13%;width:320px;margin-left:30px;border:none;text-align:center;margin-top:10px;" value="${board.p_tel}" readonly><br>      
                  <label><h6>상 품 명</h6></label>
                     <input type="text" style="height:13%;width:320px;margin-left:37px;border:none;text-align:center;margin-top:10px;" value="${board.p_cd_name}" readonly><br>   
                  <label><h6>신 청 자</h6></label>
                     <input type="text" style="height:13%;width:320px;margin-left:37px;border:none;text-align:center;margin-top:10px;" value="${board.m_ename}" readonly><br>   
                  <label><h6>처리상태</h6></label>
                     <input type="text" style="height:13%;width:320px;margin-left:30px;border:none;text-align:center;margin-top:10px;" value="${board.p_condition}" readonly><br>
                     <input type ="hidden" id= "p_condition" name = "p_condition" class="form-control">    
         
       
           <div class="box-footer">
           <br><br>
                 <button type=button class="btn btn-secondary" onclick="location.href='adminPageUsePoint'" style="margin-left:30%;">목록</button>                
                 <c:if test="${user.m_ste ==9}">             
                     <button class="btn btn-primary">처리완료</button>
               </c:if>
              </div>             
             </div>  
          </div>
         <br><br>
         </section>       
      </div>
   </div>
     
<script>



   $(function(){
      
     //취소 버튼을 눌렀을 때 처리
     $(".btn-list").click(function(){
        location.href="adminPageUsePoint?p_num=" + ${board.p_num};
      });

     
      //처리 완료 버튼을 눌럿을 때 처리
      $(".btn-primary").click(function(){
         var p_condition = document.getElementById("p_condition").value;
      
        location.href = "usePointSuccess?p_num=" + ${board.p_num};
      });
   })
</script>

</body>
</html>