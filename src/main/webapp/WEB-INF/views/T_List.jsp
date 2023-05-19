<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>

<!DOCTYPE html>
<html>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
a1 { display: inline-block;
    width:40%;height:5%;
           /* 위 | 오 | 밑 | 왼 */
    margin: 3% 3% 35% 6%;
}

a2 { display: inline-block;
    width:40%;height:5%;
           /* 위 | 오 | 밑 | 왼 */
    margin: 2% 3% 35% 6%;

}
</style>

<script>

   $(document).ready(function(){
      console.log('tour list ready');
      tourList();
   });
      
// 활동
function start1(){
   $('input[name=codeId]').attr("value", "2");
   tourList();
}
//비활동
function start2(){
   $('input[name=codeId]').attr("value", "3");
   tourList();
}


//활동 - 라이딩
function next1(){
   $('input[name=codeId]').attr("value", "21");
   tourList();
}
// 활동 - 협동
function next2(){
   $('input[name=codeId]').attr("value", "22");
   tourList();
}
// 활동 - 테마파크
function next3(){
   $('input[name=codeId]').attr("value", "23");
   tourList();
}
// 활동 - 익사이팅
function next4(){
   $('input[name=codeId]').attr("value", "24");
   tourList();
}


// 비활동 - 문화관람
function next5(){
   $('input[name=codeId]').attr("value", "31");
   tourList();
}
// 비활동 - 체험
function next6(){
   $('input[name=codeId]').attr("value", "32");
   tourList();
}
// 비활동 - 자연힐링
function next7(){
   $('input[name=codeId]').attr("value", "33");
   tourList();
}
// 비활동 - 도시힐링
function next8(){
   $('input[name=codeId]').attr("value", "34");
   tourList();
}


//활동 - 라이딩 - 승마
function next9(){
   $('input[name=codeId]').attr("value", "211");
   tourList();
}
// 활동 - 라이딩 - 4륜 바이크
function next10(){
   $('input[name=codeId]').attr("value", "212");
   tourList();
}
// 활동 - 협동 - 서바이벌
function next11(){
   $('input[name=codeId]').attr("value", "221");
   tourList();
}
// 활동 - 협동 - 탈출
function next12(){
   $('input[name=codeId]').attr("value", "222");
   tourList();
}

// 활동 - 테마파크 - 어린이 
function next13(){
   $('input[name=codeId]').attr("value", "231");
   tourList();
}
// 활동 - 테마파크 - 어른
function next14(){
   $('input[name=codeId]').attr("value", "232");
   tourList();
}
// 활동 - 익사이팅 - 패러글라이딩
function next15(){
   $('input[name=codeId]').attr("value", "241");
   tourList();
}
// 활동 - 익사이팅 - 짚라인
function next16(){
   $('input[name=codeId]').attr("value", "242");
   tourList();
}

// 비활동 - 문화관람 - 박물관
function next17(){
   $('input[name=codeId]').attr("value", "311");
   tourList();
}
// 비활동 - 문화관람 - 국내문화
function next18(){
   $('input[name=codeId]').attr("value", "312");
   tourList();
}
// 비활동 - 체험 - 원데이체험
function next19(){
   $('input[name=codeId]').attr("value", "321");
   tourList();
}
// 비활동 - 체험 - 체험마을
function next20(){
   $('input[name=codeId]').attr("value", "322");
   tourList();
}

// 비활동 - 자연힐링 - 공원 
function next21(){
   $('input[name=codeId]').attr("value", "331");
   tourList();
}
// 비활동 - 자연힐링 - 캠핑 
function next22(){
   $('input[name=codeId]').attr("value", "332");
   tourList();
}
// 비활동 - 도시힐링 - 랜드마크
function next23(){
   $('input[name=codeId]').attr("value", "341");
   tourList();
}
// 비활동 - 도시힐링 - 유람선
function next24(){
   $('input[name=codeId]').attr("value", "342");
   tourList();
}

   // ajax 투어 리스트 목록 불러오기 -> board/T_List (sp_pgr_cd1,2,3)
   function tourList(){
         const url = "${pageContext.request.contextPath}/board/tourList";
         var codeId = document.getElementById("codeId").value;
      var paramData = {
         "codeId" : codeId
      };   
      $.ajax({
           url:"${pageContext.request.contextPath}/board/tourList",
           data:paramData,
           dataType:'json',
           type:'POST',
           success: function(result){
            var htmls = "";    // 문서 꾸미기
            console.log(result);      
            if(result == 1){
               htmls += '<a1 href="javascript:void(0)" onclick="start1()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img40.png" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="start2()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img41.png" alt="img"></a1>';
            } else if (result == 2){
               htmls += '<a2 href="javascript:void(0)" onclick="next1()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img1.jpg" alt="img"></a2>';
               htmls += '<a2 href="javascript:void(0)" onclick="next2()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img2.jpg" alt="img"></a2>';
               htmls += '<a2 href="javascript:void(0)" onclick="next3()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img3.jpg" alt="img"></a2>';
               htmls += '<a2 href="javascript:void(0)" onclick="next4()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img4.jpg" alt="img"></a2>';
            } else if (result == 3){
               htmls += '<a2 href="javascript:void(0)" onclick="next5()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img5.jpg" alt="img"></a2>';
               htmls += '<a2 href="javascript:void(0)" onclick="next6()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img6.jpg" alt="img"></a2>';
               htmls += '<a2 href="javascript:void(0)" onclick="next7()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img7.jpg" alt="img"></a2>';
               htmls += '<a2 href="javascript:void(0)" onclick="next8()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k1-img8.jpg" alt="img"></a2>';
            } else if (result == 21){
               htmls += '<a1 href="javascript:void(0)" onclick="next9()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img12.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next10()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img13.jpg" alt="img"></a1>';
            } else if (result == 22){
               htmls += '<a1 href="javascript:void(0)" onclick="next11()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img16.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next12()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img17.jpg" alt="img"></a1>';
            } else if (result == 23){
               htmls += '<a1 href="javascript:void(0)" onclick="next13()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img18.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next14()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img19.jpg" alt="img"></a1>';
            } else if (result == 24){
               htmls += '<a1 href="javascript:void(0)" onclick="next15()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img20.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next16()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img21.jpg" alt="img"></a1>';
            } else if (result == 31){
               htmls += '<a1 href="javascript:void(0)" onclick="next17()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img1.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next18()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img2.jpg" alt="img"></a1>';
            } else if (result == 32){
               htmls += '<a1 href="javascript:void(0)" onclick="next19()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img3.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next20()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img4.jpg" alt="img"></a1>';
            } else if (result == 33){
               htmls += '<a1 href="javascript:void(0)" onclick="next21()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img5.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next22()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img6.jpg" alt="img"></a1>';
            } else if (result == 34){
               htmls += '<a1 href="javascript:void(0)" onclick="next23()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img7.jpg" alt="img"></a1>';
               htmls += '<a1 href="javascript:void(0)" onclick="next24()" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/n-img8.jpg" alt="img"></a1>';
            } else if (result == 211){
               htmls += '<a1 href="http://www.misari-riding.co.kr/" title = "미사리 승마공원" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img1.jpg" alt="img"></a1>';
               htmls += '<a1 href="http://유니콘승마클럽.com" title = "유니콘 승마클럽" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img2.jpg" alt="img"></a1>';
            } else if (result == 212){
               htmls += '<a1 href="http://www.cypvalley.com/" title = "양평칠읍산벨리 ATV체험장" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img3.jpg" alt="img"></a1>';
               htmls += '<a1 href="http://tomatopark.modoo.at/" title = "토마토 레저파크" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img4.jpg" alt="img"></a1>';
            } else if (result == 221){
               htmls += '<a1 href="https://www.instagram.com/laserarena_hongdae.crew/" title ="레이저 아레나" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img5.jpg" alt="img"></a1>';
               htmls += '<a1 href="https://ggshooting.or.kr/" title ="경기도 사격테마파크" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img6.jpg" alt="img"></a1>';
            } else if (result == 222){
               htmls += '<a1 href="https://www.smob.co.kr/branch" title ="스포츠안성점" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img7.jpg" alt="img"></a1>';
               htmls += '<a1 href="http://fuzzyline.co.kr" title ="HIDE AND SEEK 홍대점" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img8.jpg" alt="img"></a1>';
            } else if (result == 231){
               htmls += '<a1 href="https://www.sisul.or.kr/open_content/childrenpark/" title ="서울 어린이 대공원" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img9.jpg" alt="img"></a1>';
               htmls += '<a1 href="http://baedagol.com/" title ="배다골 테마파크" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img10.jpg" alt="img"></a1>';
            } else if (result == 232){
               htmls += '<a1 href="https://adventure.lotteworld.com/kor/main/index.do" title ="롯데월드" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img11.jpg" alt="img"></a1>';
               htmls += '<a1 href="https://www.everland.com/web/intro.html?r=https://pcmap.place.naver.com/place/11574457/home?entry=pll&from=map&fromPanelNum=1&ts=1678776582510" title ="에버랜드" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img12.jpg" alt="img"></a1>';
            } else if (result == 241){
               htmls += '<a1 href="http://www.nanosky.co.kr/" title ="서울페러글라이딩" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img13.jpg" alt="img"></a1>';
               htmls += '<a1 href="https://blog.naver.com/yonginparagliding" title ="용인 페러글라이딩" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img14.jpg" alt="img"></a1>';
            } else if (result == 242){
               htmls += '<a1 href="https://smartstore.naver.com/tourboss/products/6510493112" title ="용인 짚라인" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img15.jpg" alt="img"></a1>';
               htmls += '<a1 href="http://www.skylinezipwire.co.kr/" title ="스카이라인 짚와이어" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img16.jpg" alt="img"></a1>';
            } else if (result == 311){
               htmls += '<a1 title ="서대문형무소 역사관" href="https://sphh.sscmc.or.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img17.jpg" alt="img"></a1>';
               htmls += '<a1 title ="옥토끼 우주센터" href="http://www.oktokki.com/main" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img18.jpg" alt="img"></a1>';
            } else if (result == 312){
               htmls += '<a1 title ="경복궁" href="http://www.royalpalace.go.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img19.jpg" alt="img"></a1>';
               htmls += '<a1 title ="북촌 한옥마을" href="https://hanok.seoul.go.kr/front/index.do" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img20.jpg" alt="img"></a1>';
            } else if (result == 321){
               htmls += '<a1 title ="파주 치즈스쿨체험관" href="http://www.cheeseschool.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img21.jpg" alt="img"></a1>';
               htmls += '<a1 title ="헤이리 도자기 체험마을" href="https://www.ceramicschool.co.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img22.jpg" alt="img"></a1>';
            } else if (result == 322){
               htmls += '<a1 title ="한국 민속촌" href="https://www.koreanfolk.co.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img23.jpg" alt="img"></a1>';
               htmls += '<a1 title ="차이나 타운" href="http://ic-chinatown.co.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img24.jpg" alt="img"></a1>';
            } else if (result == 331){
               htmls += '<a1 title ="허브 아일랜드" href="http://www.herbisland.co.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img25.jpg" alt="img"></a1>';
               htmls += '<a1 title ="화담숲" href="https://www.hwadamsup.com/relay/main/main.do" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img26.jpg" alt="img"></a1>';
            } else if (result == 332){
               htmls += '<a1 title ="양평 수목원캠핑장" href="http://ypcamping.com/main/index.html" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img27.jpg" alt="img"></a1>';
               htmls += '<a1 title ="인천대공원 캠핑장" href="https://tickets.interpark.com/goods/21000325" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img28.jpg" alt="img"></a1>';
            } else if (result == 341){
               htmls += '<a1 title ="남산타워" href="https://www.seoultower.co.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img29.jpg" alt="img"></a1>';
               htmls += '<a1 title ="청와대" href="http://reserve.opencheongwadae.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img30.jpg" alt="img"></a1>';
            } else if (result == 342){
               htmls += '<a1 title ="여의도 이크루즈" href="https://blog.naver.com/ecruise00" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img31.jpg" alt="img"></a1>';
               htmls += '<a1 title ="현대 유람선" href="http://www.aracruise.co.kr/" style="padding-right:5px"><img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/m-img32.jpg" alt="img"></a1>';
            }
            else{
            }            
            $("#tourList").html(htmls);
         },
         erorr : function(){
         }
      })   
   }
</script>

<body>
<!-- title Start (헤더 영역) -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div> 
   
<!-- Service Start -->
    <div class="container-fluid py-9">
        <div class="container py-8">
        
            <!-- title -->
            <br><br>
            <div class="section-title text-center position-relative pb-4 mb-5 mx-auto" style="max-width: 1400px;">
                <h6 class="fw-bold text-primary text-uppercase">#내가 원하는 여행지 골라보기</h6>
                <h1 class="mb-0">당신이 원하는 여행 스타일은 무엇인가요?</h1>
            </div>  
            
          <!-- contents start -->   
          <div id="tourList"></div>
            <form type="post">
               <input type="hidden" id="codeId" name="codeId" value="1">   
          </form>
      </div>           
   </div>
</body>
</html>
<%@include file="include/footer.jsp" %>   