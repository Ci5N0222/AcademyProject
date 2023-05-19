<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="include/head.jsp" %>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    
<style>
	#wrap{
		margin:auto;
		text-aling:center;
	}
	
	#box1{
		vertical-align:middle;
		display:inline-block;
		margin-left:80px;
	}
	#box2{
   		width:22%;
   		height:52px;
   		float:left;
	}
	#box3{
	   width:22px;
	   height:52px;
	   float:right;
	   display:inline-block;
	}	
</style>

    <!-- Navbar & Carousel Start -->
    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
            <div style="margin:12px">
      <a href="${contextPath}/" class="navbar-brand p-0">
           <img src="${contextPath}/resources/bootstrap/img/susulogow.png" width="230x" height="100px" alt="Image">
        </a>
        </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarCollapse" >
            	<div id="wrap">
            		<div id="box1">
		                <div class="navbar-nav ms-auto py-0">
		                    <a href="${contextPath}/" class="nav-item nav-link" style="font-size:1.5em;">홈</a>
          		 			<a href="${contextPath}/board/T_List" class="nav-item nav-link" style="font-size:1.5em;">선택여행지</a>
           					<a href="${contextPath}/board/T_ListAll" class="nav-item nav-link" style="font-size:1.5em;">전체여행지</a>
           					<a href="${contextPath}/board/point" class="nav-item nav-link" style="font-size:1.5em;">포인트전환</a>
           					<a href="${contextPath}/board/list" class="nav-item nav-link" style="font-size:1.5em;">게시판</a>
		            	</div>
		            </div>
            	</div>
          <div id="box2">
           <div style="text-align:right; margin-bottom:10px;">
         	<h4>
         		<c:if test="${user==null }">
              		<a href="${contextPath}/board/login" style="font-size:0.7em;">로그인</a></li>
              		<a > | </a>
              		<a href="${contextPath}/board/join"style="font-size:0.7em;">회원가입</a>
           		</c:if>
           
		         <c:if test="${user!=null }">
		            <label><h6 style="color:#2EFEF7;">${user.m_ename}님, 환영합니다.</h6></label>
		            <c:if test="${user.m_ste ==9}">
		            <label><h5 style="color:#6E6E6E;"> | </h5></label>              
		               <a href="${contextPath}/board/adminPage" style="font-size:0.7em;padding-right:5px;">관리자페이지</a>          
		            </c:if>          
		            <c:if test="${user.m_ste !=9}"> 
		            <label><h5 style="color:#6E6E6E;"> | </h5></label>            
		            <a href="${contextPath}/board/myPage" style="font-size:0.7em;">마이페이지</a>
		            </c:if>                    
		         </c:if>
		      </h4>
			</div>
				<div id="box3" style="text-align:right;height:30px;width:73px;"> 
		         		<c:if test="${user==null }">
		           		</c:if>		       
		         		<c:if test="${user!=null }">           
		            	<a href="${contextPath}/board/logOut" style="font-size:1.0em;padding-right:5px;">로그아웃</a>   
		         		</c:if>		
		   		</div>
      	 </div>
    	</nav>

        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="${contextPath}/resources/bootstrap/img/gyeongbokgung.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-top" style="padding-top:360px;">
                        <div class="p-3" style="max-width:900px;">
                            <h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome To Go Travel</h5>
                            <h1 class="display-1 text-white mb-md-4 animated zoomIn">#골라골라#여행지#지금#어디갈래?</h1>
                            <a href="${contextPath}/board/T_List" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">START</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${contextPath}/resources/bootstrap/img/seoul_city2.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome To Go Travel</h5>
                            <h1 class="display-1 text-white mb-md-4 animated zoomIn">#음..#어디보자#여행지#일단봐볼까?</h1>
                            <a href="${contextPath}/board/T_ListAll" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">START</a>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Navbar & Carousel End -->


    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
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
 
    <!-- Footer Start --><!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/counterup/counterup.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/bootstrap/js/main.js"></script>
</body>

</html>