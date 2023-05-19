<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>



<!DOCTYPE html>
<html >

<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>

   function validation(){
	   
		var exptextTel = /^01[016789]+/;
	    var tel1 = document.getElementById("tel1").value;
	    var tel2 = document.getElementById("tel2").value;
	    var tel3 = document.getElementById("tel3").value;

		p_tel.value = tel1 + "-" + tel2 + "-" + tel3;
		var tel = document.getElementById("p_tel").value;

	    var point1 = document.getElementById("point1").value;
	    var point2 = document.getElementById("point2").value;
	    var pt = document.getElementById("m_pt").value;
	    var name = document.getElementById("p_name").value;
		var p_info_yn = document.getElementById("p_info_yn").value;
		var p_adv_yn = document.getElementById("p_adv_yn").value;

      // 전화번호
       if(tel.length < 14 && tel.length >11){
           if(exptextTel.test(tel)==false){
              alert("전화번호를 확인하세요.");
              document.getElementById("p_tel").focus();
              return false;
           } 
       } else{
    	   alert("전화번호를 확인하세요.");
    	   return false;
       }
      
      // 보유 포인트
       if(point1 < 1000){
           alert("포인트가 부족합니다.");
           return false;
        } else {
           pt = point1 - 1000;
           m_pt.value = pt;
        } 

       // 이름
        if(name == ""){
           alert("이름을 확인하세요.");
           return false;
        }

       // 첫번째 체크박스가 체크되어 있는경우
       if($("#p_info_yn").is(":checked")){
           //alert("첫번째 통과");        
       } else { // 첫번째 체크박스가 체크 되어있지 않은 있는경우
           alert("체크 항목을 확인해주세요.");
           return false;
       }  
       
       // 두번째 체크박스가 체크되어 있는경우
       if($("#p_adv_yn").is(":checked")){
           //alert("두번째 통과");
       } else { // 두번째 체크박스가 체크 되어있지 않은 있는경우
           alert("체크 항목을 확인해주세요.");
           return false;
       }

       alert("포인트 전환이 완료되었습니다.");
       return true;                

   }
    
 </script>
    
 <body>
 
    <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    
    <!-- Quote Start -->
   <form role="form" name="point check" method="post" onsubmit="return validation();">
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-5">
                    <div class="section-title position-relative pb-3 mb-5">
                        <h5 class="fw-bold text-primary text-uppercase">[포인트 전환]</h5>
                        <h1 class="mb-0">스타벅스 아메리카노 교환권</h1>
                        <h4 class="mb-0">500p 사용</h4>                   
                         </div>
                            <img class="img-fluid w-100" src="${contextPath}/resources/bootstrap/img/product2.png" alt="" style="width:500px; height:500px;">                                        
                </div>
                <div class="col-lg-6">
                    <div class="bg-primary rounded h-100 d-flex align-items-center p-5">                    

                            <div class="row g-3">
                            <div>
                        <input type="hidden" id="p_cd" name="p_cd" value="p2" style="width:22%;"readonly>
                        <input type="hidden" id="p_condition" name="p_condition" value="1" style="width:22%;"readonly>
                        <input type="hidden" id="m_ename" name="m_ename" value="${user.m_ename}" style="width:22%;"readonly>
                        <input type="hidden" id="p_cd_name" name="p_cd_name" value="스타벅스 아메리카노 교환권 500p" style="width:22%;"readonly>                       
                      </div>
                            <div>
                             <label style="color:black">◎ 보유 포인트　  :　</label>
                        <input type="text" id="point1" name="point1" value="${user.m_pt}" style="width:22%;color:black;margin-left:30px;text-align:right;border:none;"readonly>
                      </div>
                      <div>
                             <label style="color:black">◎ 사용 포인트　  :　</label>
                        <input type="text" id="point2" name="point2" style="width:22%;color:red;margin-left:30px;text-align:right;background-color:#CEECF5;border:none;" value="-500p" readonly>
                      </div>
                      <div>
                              <label style="color:black">◎ 차감후 포인트 : </label>
                        <input type="text" id="m_pt" name="m_pt" value="0" style="width:22%;color:black;margin-left:45px;text-align:right;border:none;">
                        
                      </div>               
                     
                                <div class="col-xl-12">
                                    <label style="color:black">◎ 이  름            　:　</label>
                              <input type="text" id="p_name" name="p_name" value="" style="width:22%;color:black;margin-left:75px;text-align:right;border:none;" minlength="2" >
                              <input type="hidden" id="m_id" name="m_id" value="${user.m_id}">
                              <input type="hidden" id="m_pw" name="m_pw" value="${user.m_pw}">
                                </div>
                                
                                <div class="col-12">
                      
                           <div class="box-group">
                              <label style="color:black;border:none;">◎ 핸드폰번호　:　</label>
                              <select id='tel1' name='tel1' style="width:70px; height:32;margin-left:36px;border:none;">
                                 <option value="010">010</option>
                                 <option value="011">011</option>
                                 <option value="016">016</option>
                                 <option value="017">017</option>
                                 <option value="019">019</option>
                              </select> - 
                              <input type='text' id='tel2' name='tel2' minlength="3" maxlength="4" style="width:70px; height:28;border:none;"> - 
                              <input type='text' id='tel3' name='tel3' minlength="4" maxlength="4" style="width:70px; height:28;border:none;">
                              <input type='hidden' id='p_tel' name='p_tel'>
                           </div>
                           </div>
                                <div class="col-12">
                                    <textarea class="form-control bg-light border-0" rows="9" readonly>※필수확인※
● 교환한 기프트콘은 입력한 핸드폰 번호로 전송됩니다.
● 본인이 잘못 입력한 핸드폰번호는 해당 사이트가 책임지지 않습니다. 
● 유효기간 : 발급일로부터 90일
● 본 상품의 유효기간은 문자를 통해 확인 부탁 드립니다. 
● 등록 후 사용가능 기간 : 등록일로부터 5년
● 구매 후 교환권을 기프트콘으로 전환한 이후에는 취소가 불가합니다.
※ 포인트 전환 후에는 환불은 불가 합니다.
                                    </textarea>
                                </div>
                                <div class="col-12">
                                   <input type="checkbox" id="p_info_yn" name='p_info_yn' value='0' onclick="checkbox_click()">(필수) 해당 필수확인 내용을 확인하였습니다.</>
                                                                     
                                </div>
                                <div class="col-12">
                                   <input type="checkbox" id="p_adv_yn" name='p_adv_yn' value='0' onclick="checkbox_click()">(필수) 이름과 휴대전화 번호를 확인하였습니다.</>
                                </div>                                       
                                <div class="box-footer">                                
                                    <button type="submit" class="btn btn-dark w-100 py-2"> 포인트 전환 신청하기</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   </form>
    <!-- Quote End -->

   <!-- Team Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="section-title position-relative pb-3 mb-5" style="max-width: 600px;">
                        <h5 class="fw-bold text-primary text-uppercase">다른상품 교환하러 가기</h5>
            </div>
            <div class="row g-6">
                <div class="col-lg-4">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="${contextPath}/resources/bootstrap/img/product1.png" alt="img">
                            <div class="team-social">
                               <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/product1"><i class="bi bi-arrow-right"></i></a>           
                            </div>
                        </div>
                        <a href="${contextPath}/board/product2">
                        <div class="text-center py-4">
                            <h4 class="text-primary">신세계상품권 모바일 교환권</h4>
                            <p class="text-uppercase m-0">1,000p</p>
                        </div>
                        </a>
                    </div>
                </div>
 
                <div class="col-lg-4">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="${contextPath}/resources/bootstrap/img/product3.png" alt="">
                            <div class="team-social">
                                <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/product3"><i class="bi bi-arrow-right"></i></a>                         
                            </div>
                        </div>
                        <a href="${contextPath}/board/product3" class="nav-item nav-link">
                        <div class="text-center py-3">
                            <h4 class="text-primary">GS25 편의점 모바일 교환권</h4>
                            <p class="text-uppercase m-0">1,000p</p>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Template Javascript -->
    <script src="${contextPath}/resources/bootstrap/js/main.js"></script>

</body>

</html>
<%@ include file="include/footer.jsp" %>