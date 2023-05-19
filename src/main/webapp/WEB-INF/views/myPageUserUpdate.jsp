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

<script type="text/javascript">


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
         alert("닉네임은 3자리 이상으로 만들어주세요.");
         
      } else {
         $.ajax({
            url : "${pageContext.request.contextPath}/board/checkEname",
            type : "post",
            dataType : "json",
            data : paramData,
            success : function(result){
               if(result >= 1){
                  enamecheck1.type = "hidden";
                  alert("중복된 닉네임입니다.");
                  return false;
               } else if(result == 0){
                  $('input[name=enamecheckNum]').attr('value','3');
                  enamecheck1.type = "text";
                  alert("사용 가능한 닉네임입니다");
                  return true;
               }
               return false;
            }
            
            
         });
         
      }
      
   });
   
      // 비밀번호 키업
      $('#m_pw').keyup(function(){
         $('font[name=passcheck]').text('');
         if($('#m_pw').val() != $('#password2').val()){
            $('font[name=passcheck]').text('');
            $('font[name=passcheck]').html('비밀번호 틀림');
            $('font[name=passcheck]').attr('color', 'red');
         } else {
            $('font[name=passcheck]').text('');
            $('font[name=passcheck]').html('비밀번호 확인');
            $('font[name=passcheck]').attr('color', 'green');
         }
      });   
      $('#password2').keyup(function(){
         if($('#m_pw').val() != $('#password2').val()){
            $('font[name=passcheck]').text('');
            $('font[name=passcheck]').html('비밀번호 틀림');
            $('font[name=passcheck]').attr('color', 'red');
         } else {
            $('font[name=passcheck]').text('');
            $('font[name=passcheck]').html('비밀번호 확인');
            $('font[name=passcheck]').attr('color', 'green');
         }   
      });
      
   })


  //유효성 검사
  function validate(){
     var exptextTel = /^01[016789]+/;
     var exptextEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   
     
     var password1 = document.getElementById("m_pw").value;
     var password2 = document.getElementById("password2").value;  
     var tel = document.getElementById("m_tel").value;
     var email = document.getElementById("m_email").value;
     var enamecheckNum = document.getElementById("enamecheckNum").value; 

     if(password1 != password2){
        alert("비밀번호 오류1");
        document.getElementById("m_pw").focus();
        return false;
        passcheck.type="text";

     }
     
     if(password1 == ""){
        alert("비밀번호 오류2");
        document.getElementById("m_pw").focus();
        return false;
     }
     
     if(enamecheckNum != 3) {
        alert("닉네임 중복 확인을 해주세요.");
        return false;
     }
     
     if(tel.length < 14 && tel.length >11){
        if(exptextTel.test(tel)==false){
           alert("전화번호 오류");
           document.getElementById("tel2").focus();
           return false;
        }     
     } else if (tel.length > 14 || tel.length < 11){
        alert("전화번호 오류");
        return false;
     }
     

     // 2-7 이메일 형식 체크
     if(exptextEmail.test(email)==false){
        alert("이메일 오류");
        document.getElementById("email").focus();
        return false;
     }
     
     if (confirm("회원정보 수정을 완료하시겠습니까?") == true){
         alert("회원정보 수정이 완료되었습니다.");
         return true;
        } else {
         alert("회원정보 수정이 취소되었습니다.");
         return false;
        }   
     
        return true;
      
      
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
    
    <div class="container-fluid py-5" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회원정보변경</h1>
            </div>
  <form role="form" method="post" action="${contextPath}/board/myPageUserUpdate" onsubmit="return validate();">
    <section class="content container-fluid" style="width:800px; height:1000px;">
         <div class="box" >
            <div>
               <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:750;height:750;padding-top:30px;padding-left:130px;padding-bottom:70px;">
                        
               <div class="form-group"style="height:30%">
                  <label><h5> 아 이 디 </h5></label>  <input type="text" name="m_id" id = "m_id"
                   value= "${user.m_id}" style="width:32%;height:35px;color:black;background-color:#E6E6E6;margin-left:100px;text-align:center;border:none;" readonly="readonly" />   
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 비밀번호 </h5></label>  <input type="password" name="m_pw" id="m_pw"
                   value="${user.m_pw}" onclick="pass_click();" style="width:32%;height:35px;background-color:#FFFFFF;margin-left:90px;text-align:center;border:none;"/>
               </div>
               <div class="form-group"style="height:30%">
                  <label><h5> 비밀번호 확인 </h5></label>  <input type="password" name="password2" id="password2"
                     value="${user.m_pw}" onclick="pass_click();" style="width:32%;height:35px;background-color:#FFFFFF;margin-left:45px;text-align:center;border:none;"/>
                     <font name="passcheck" size="2"></font>
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 이   름 </h5></label>  <input type="text" name="m_name" id="m_name"
                    value="${user.m_name}" onclick="name_click();" style="width:32%;height:35px;background-color:#FFFFFF;margin-left:125px;text-align:center;border:none;" readonly="readonly"/>
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 닉 네 임 </h5></label>  <input type="text" name="m_ename" id="m_ename"
                    value="${user.m_ename}" style="width:32%;height:35px;color:black;background-color:#FFFFFF;margin-left:100px;text-align:center;border:none;"/>
                    <button type="button" class="btn btn-enamecheck" style="background-color:#81BEF7;color:#FFFFFF;">중복확인</button>
                    <input type='hidden' id='enamecheck1' name='enamecheck1' class="form-control" value="중복확인이 완료되었습니다." style="color:green; width:200px;height:28px;border:none;font-size:0.8em;text-align:center;margin-left:174px;margin-bottom:10px;" >
                    <input type='hidden' id='enamecheckNum' name='enamecheckNum' value='1'>
                    <input type="hidden" name="ename" id="ename" value="${user.m_ename}" >
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 이 메 일 </h5></label>  <input type="text" name="m_email" id="m_email"
                    value="${user.m_email}" style="width:32%;height:35px;color:black;background-color:#FFFFFF;margin-left:100px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 전화번호 </h5></label>                
                     <input type="text" name="m_tel" id="m_tel"
                    value="${user.m_tel}" style="width:32%;height:35px;color:black;background-color:#FFFFFF;margin-left:90px;text-align:center;border:none;"/>
                    <label style="color:red;font-size:0.7em;margin-left:175px;margin-top:5px;" >* 전화번호 (-)을 포함하여 13자리를 입력하세요</label>
               </div>
                  <div class="form-group"style="height:30%">
                  <br><label><h5>광고수신 약관 동의(선택)</h5></label><br>
               <textarea id="adv" name="adv" rows="5" style="width:500px;border:none;font-size:0.8em;" readonly>
* 홍보 및 마케팅에 관한 동의 *
- 해당 사이트에 "개인정보 보호법"에 따라 동의를 얻어 아래와 같이 서비스의 홍보및 마케팅을 위한 개인정보를 수집,이용합니다.
- 수집 목적 : 웹 매거진 발송(월 1회)/SMS를 통한 이벤트 참여 기회 제공
- 수집 항목(보유기간) : 이메일(수집일로부터 1년)/ 휴대전화번호(수집일로부터 6개월)
*귀하의 개인정보 수집,이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 내용 관련 서비스를 받을 수 없습니다.</textarea>         
               <br><input type="radio" id="m_adv_yn1" name="m_adv_yn" value="1">동의　
               <input type="radio" id="m_adv_yn" name="m_adv_yn" value="2" checked="checked">거부
               </div>
            </div>
         </div>
         
            <div class="box-footer" style="height:30%">
                 <button type="submit" class="btn btn-primary" style="margin-top:10px;margin-left:290px;">수정완료</button>                
               <button class="btn btn-cancle" onclick="location.href='myPage'" style="margin-top:10px;margin-left:20px;">취소</button>     
            </div>
            </div>            
          </section>
   </form>
   </div>
</div>
</body>
</body>
</html>