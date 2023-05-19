<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">


<body> 
	<div class="container-fluid bg-primary py-5 bg-header" >
		   <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
	</div>


    <!-- Team Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                <h5 class="fw-bold text-primary text-uppercase"></h5>
                <h1 class="mb-0">상품리스트</h1>
            </div>
            <div class="row g-5">
                <div class="col-lg-4" >
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="${contextPath}/resources/bootstrap/img/product1.png" alt="">                            
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/product1"><i class="bi bi-arrow-right"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>
                        </div>
                        <a href="${contextPath}/board/product1">
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
                            <img class="img-fluid w-100" src="${contextPath}/resources/bootstrap/img/product2.png" alt="img">
                            <div class="team-social">
                                 <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/product2"><i class="bi bi-arrow-right"></i></a>              
                                <a class="product pag" href=""></a>
                            </div>
                        </div>
                        <a href="${contextPath}/board/product2">
                        <div class="text-center py-4">
                            <h4 class="text-primary">스타벅스 아메리카노 교환권</h4>
                            <p class="text-uppercase m-0">500p</p>
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
                                <a class="product pag" href=""></a>
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
   

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>

</html>
<%@ include file="include/footer.jsp" %>