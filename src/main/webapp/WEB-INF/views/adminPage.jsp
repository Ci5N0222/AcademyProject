<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>


<!DOCTYPE html>
<html lang="en">

<script>


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
    <div class="container-fluid py-10">
        <div class="container py-5"> 
            <div class="section-title text-left position-relative pb-2 mb-3" style="max-width: 1000px;">             
             <h5 class="fw-bold text-primary text-uppercase">             
            <img src="${contextPath}/resources/bootstrap/img/Profile.png?v=1">
               　[관리자] ${user.m_ename}님, 환영합니다.
               <div class="container" id="badge">
            </div>           
               </h5>                               
               </div>
                                          
    <!-- Service end -->

    <!-- Contact Start -->
  <form action="adminPage" method="Post" >

    </div></div>
    
    <!-- Contact End -->

   <!-- Team Start -->
    <div class="container" >
        <div class="container py-2" style="margin-bottom:8%;">            
            <div class="row g-10">
                <div class="col-lg-2">
                    <div class="team-item bg-light rounded overflow-hidden" style="width:135%">
                        <div class="team-img position-relative overflow-hidden">
                            <i class="bi-card-list fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding-left:25%;"></i>                         
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/adminPageMember"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">회원관리</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                     </div>
                    </div>
                </div>
                <div class="col-lg-2" style="margin-left:4%;">
                    <div class="team-item bg-light rounded overflow-hidden" style="width:135%">
                        <div class="team-img position-relative overflow-hidden">
                           <i class="bi bi-question fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding-left:7%;margin-left:50px;"></i>                  
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/adminPageQuestion"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">문의 대기</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                        </div>
                    </div>
                </div>               
                 <div class="col-lg-2" style="margin-left:4%;">
                    <div class="team-item bg-light rounded overflow-hidden" style="width:135%">
                        <div class="team-img position-relative overflow-hidden">
                           <i class="bi bi-check2-square fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding-left:7%;margin-left:50px;"></i>                  
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/adminPageQuestionSuccess"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary"> 문의 처리 완료</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                        </div>
                    </div>
                </div>                               
                <div class="col-lg-2" style="margin-left:4%;">
                    <div class="team-item bg-light rounded overflow-hidden" style="width:135%">
                        <div class="team-img position-relative overflow-hidden">
                         <i class="bi bi-exclamation fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding-left:7%;margin-left:50px;"></i>                  
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/adminPageUsePoint"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>
                        <div class="text-center py-4">
                            <h4 class="text-primary">포인트 처리 대기</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                       </div>
                    </div>
                </div>
                
                <div class="col-lg-2" style="margin-left:4%;">
                    <div class="team-item bg-light rounded overflow-hidden" style="width:135%">
                        <div class="team-img position-relative overflow-hidden">
                           <i class="bi bi-list-check fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding-left:7%;margin-left:50px;"></i>                  
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/adminPageUsePointSuccess"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary"> 포인트 처리 내역</h4>
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


    <!-- Template Javascript -->
    <script src="${contextPath}/resources/bootstrap/js/main.js"></script>
</body>

</html> 
<%@ include file="include/footer.jsp"%>