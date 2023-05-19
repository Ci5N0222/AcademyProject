<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    댓글 목록 <br>
  <table class="table">
   <form>
   <div class="form-group1">
   <c:forEach var="boardreply" items="${list}">
      <tr>
         <td>작성자 : ${boardreply.m_id}    작성일자 : ${boardreply.bd_dt} </td>
      </tr>
      <tr>
         <td><textarea name="comm_con" rows="5" cols="40"
            readonly="readonly" class="form-control1">${boardreply.comm_con}</textarea>
            <input type="hidden" name="comm_num" value="${boardreply.comm_num}" />
            <input type="hidden" name="bd_num" value="${boardreply.bd_bum}" />
         </td>
         <td>
         	<a href="replyupdate?comm_num=${boardreply.comm_num}">댓글수정</a>   
			<a href="replyDelete?comm_num=${boardreply.comm_num}&bd_num=${boardreply.bd_num}">댓글삭제</a>
		</td>
         <button class="btn btn-defalut">댓글수정</button>
         
         
         <script>
         $(function(){
            //댓글수정 버튼을 눌렀을 때 처리
            $(".btn-defalut").click(function(){
               location.href="replyupdate?comm_num=" + ${boardreply.comm_num}; 
            });
         })      
         </script>
         
         </td>
      </tr>
   </c:forEach>
   </table>
   </div>
         

</form>   
    </section>