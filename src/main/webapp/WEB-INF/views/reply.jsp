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
<div class="wrapper">


    <!-- Main content -->
    <section class="content container-fluid">
    	<div class="box-header with-border">
			<c:if test="${user==null }">
			<a href="${contextPath}/board/login"> <h3 class="box-title">로그인</h3></a>
			</c:if>
			<c:if test="${user!=null }">
			${user.name }님 환영합니다. <br />
			<a href="${contextPath}/board/logOut"> <h3 class="box-title">로그아웃</h3></a>
			</c:if>
		</div>
		<div class="box-header">
			<h3 class="box-title">댓글쓰기</h3>
		</div>
	
		<form role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<label>작성자</label> 
					<input type="text" id="m_ename" name='m_ename' value="${user.m_ename}" class="form-control" placeholder="입력하세요">
					<input type="text" id="m_id" name='m_id' value="${user.m_id}" class="form-control" placeholder="입력하세요">
				</div>
				<div class="form-group">
					<textarea class="form-control" name="COMM_CON" rows="3"
						placeholder="댓글을 입력하세요"></textarea>
				</div>
			</div>
			<input type="hidden" name="bd_num"/>
			<input type="hidden" name="comm_num"/>
			<input type="text" name="redate" class="form-control"
					 readonly="readonly" value="${boardReply.comm_dt}">
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">작성완료</button>
			</div>
		</form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->
<%@ include file = "include/plug_in.jsp" %>
</body>
</html>