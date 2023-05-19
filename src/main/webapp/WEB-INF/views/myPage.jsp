<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>



<!DOCTYPE html>
<html lang="en">

<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>


   function validate(){
	    var date = document.getElementById("m_dt").value;
		var ptdate = document.getElementById("m_pt_dt").value;
		if(date != ptdate || ptdate == null){
			alert("출석확인 5p 적립되었습니다.");
			return true;
		} else {
			alert("이미 출석체크를 하셨습니다.");
			return false;
		}
   }



</script>

<body>
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>

    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 100, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->
     
    <!-- Service Start -->
    <div class="container-fluid py">
        <div class="container py-3"> 
            <div class="section-title text-left position-relative pb-2 mb-3" style="max-width: 1000px;">             
             <h5 class="fw-bold text-primary text-uppercase">             
            <img src="${contextPath}/resources/bootstrap/img/Profile.png?v=1">
               　${user.m_ename}님, 환영합니다.
               <button type="button" class="btm_image" ><i class="bi bi-bell"></i></button>    
               <div class="container" id="badge">
              <a class="entypo-bell"></a>
            </div>           
               </h5>                               
               </div>
                  <button class="button button--wapasha button--round-s" style="color: #fff; background:#008CBA; font-size:1.3em; border-radius:0.5em; padding:5px 20px;" onclick="location.href='myPageUserInfo'">회원정보변경</button>
                 <button class="button button--wapasha button--round-s" style="color: #fff; background:#008CBA; font-size:1.3em; border-radius:0.5em; padding:4px 40px;" onclick="location.href='myPageUserDelete'">회원탈퇴</button>         
    <!-- Service end -->

    <!-- Contact Start -->
   <form action="myPage" method="Post" onsubmit="return validate();" >
    <div class="container-fluid py-1">
        <div class="container py-5">           
            <div class="row g-4 mb-5">
                <div class="col-lg-5">
                    <div class="d-flex align-items-center">
                        <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 25px; height: 20px;">
                        </div>
                        <div class="ps-1">
                            <h5 class="mb-2" style="margin-left:17%;">현재 나의 포인트</h5>
                            <h4 class="text-primary mb-0">
                            <input type="number" name="m_pt" id="m_pt" value="${user.m_pt}" class="text-primary mb-0" style="width: 120px; border:none; text-align:right;" readonly>
                            point</h4>
                            <input type="hidden" id="m_pt_dt" name="m_pt_dt" value="${user.m_pt_dt}">
                            <input type="hidden" id="m_dt" name="m_dt" value="${user.m_dt}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
    </div>
    
    <!-- Contact End -->

   <!-- Team Start -->
   
   
    <div class="container">
        <div class="container py-1" style="margin-left:30px;margin-bottom:150px;">            
            <div class="row g-3">
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <i class="bi bi-calendar2-check fa-2x position-relative pb-2 mb-1" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left:55px;"></i>                         
                            <div class="team-social">
                                  <input type="submit" class="btn btn-lg btn-primary btn-lg-square rounded" value="√" style="background-color:transparent;border:none;">
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">출 석</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                             <i class="bi-card-list fa-2x position-relative pb-2 mb-1" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left:55px;"></i>                           
                            <div class="team-social">
                               <input type="hidden" id="m_id" name="m_id" value="${user.m_id}">
                                <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/myPageListMy"><i class="bi bi-check"></i></a>
                                <a class="product pag"></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">내 게시글</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                     </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <i class="bi bi-question fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left:50px;"></i>          
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/myPageQuestion"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">나의 문의</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                        </div>
                    </div>
                </div>
               
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                             <i class="bi bi-wallet fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left:50px;"></i>                          
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/myPageUsePoint"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>
                        <div class="text-center py-4">
                            <h4 class="text-primary">포인트 전환</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div> 
                       </div>
                    </div>
                </div>        
            </div>
        </div>
    </div>
   </form>
    <!-- Team End -->


 

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/wow/wow.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/counterup/counterup.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/bootstrap/js/main.js"></script>
</body>

</html> 
<%@ include file="include/footer.jsp"%>