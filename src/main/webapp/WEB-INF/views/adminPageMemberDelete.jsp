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

<script>



function validate(){
   
     $(".btn-delete").click(function(){
        
        var id = document.getElementById("m_id").value;
           var pw = document.getElementById("m_pw").value;

           var userdelete = $('input[name=user_delete]:checked').val();
           if(userdelete == 2) {
              alert("필수 동의를 확인하세요.");
              return false;
           } else {
              
              alert("회원 탈퇴가 완료되었습니다.")
              return true;
           }
            
            
    });

}

</script> 
<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    <div class="container-fluid py-5" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회 원 탈 퇴</h1>
            </div>
   </div>
<!-- title end-->

   <section class="content container-fluid" style="width:600px; height:100px;padding-left:50px;">
   <form role="form" name="f" method="post" onsubmit="return validate();">
         <div class="box" >
                 <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:500;height:400;padding-top:50px;padding-left:80px;padding-bottom:40px;">
                        
               <div class="form-group"style="height:30%">
                  <label><h5> 아 이 디 </h5></label>  <input type="text" name="m_id" id = "m_id"
                   value= "${Management.m_id}" style="width:50%;height:35px;color:black;background-color:#E6E6E6;margin-left:50px;text-align:center;border:none;margin-bottom:10px;" readonly="readonly" />
                    
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 비밀번호 </h5></label>  <input type="password" name="m_pw" id="m_pw"
                   value="" style="width:50%;height:35px;background-color:#FFFFFF;margin-left:40px;text-align:center;border:none;"/>
               </div>
               <!-- 광고 수신 여부에 대한 약관(선택) --><br>
            <div>
               <label><h6>탈퇴동의사항(필수)*</h6></label>
               <textarea id="chk" name="chk" rows="7" style="width:355px;border:none;font-size:0.66em;padding-left:10px;" readonly>
√ 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.
√ 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
√ 탈퇴시 기존 작상한 게시물은 삭제되지 않으므로 삭제가 원하시면 반드시 탈퇴 전 게시글을 먼저 삭제해주시기 바랍니다.
√ 탈퇴된 정보는 법률에  따라 특정기간 동안 보관이 될 수 있습니다.
* 탈퇴하실 회원은 위 확인사항에 거부시 탈퇴가 불가능합니다.</textarea>
               <br><input type="radio" id="user_delete" name="user_delete" value="1" style="margin-left:10px;margin-top:13px">동의　
               <input type="radio" id="user_delete" name="user_delete" value="2" checked="checked">거부
            </div><br>
            </div>
         
         <div class="box-footer" style="margin-top:10px;margin-left:190px;">
            <button type="button" class="btn btn-primary" onclick="location.href='adminPage'">취소</button>
            <button type="submit" class="btn btn-delete">탈퇴</button>
         </div>
         </div>
      </form>            
    </section>
      
</html>