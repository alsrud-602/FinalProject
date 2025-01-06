<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet"  href="/css/company_m.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>

</style>
</head>
<body>
<%@include file="/WEB-INF/include/header_company.jsp" %>
<div class="container">
  <img id="icon_back" src="/images/icon/back2.png" alt="뒤로가기" onclick="goBack()">
  <main>
    <div class="title">
   <p>수정으로 변경 불가한 사항을 관리자에게 문의하세요</p>
   <p>팝업스토어 관리자요청</p>
   </div>
   
   <div class="content_body content_guide">
   <p>관리자요청기능이란?</p>
   <p>수정으로 변경이 불가한 팝업삭제, 팝업명 변경,승인결과 변경 등 관리자에게 원하는 요청이 있을때 남길 수 있는기능 입니다.
</p>
   </div>
   
    <form action="/Business/Management/Request/Write" method="POST"> 
   <h2 class="content_title">요청 팝업스토어</h2>
  <div class="content_body">
  <div class="content_header">
  <p>${store.start_date} ~ ${store.end_date}</p>
  </div>
  <p class="content_store">${store.title}</p>
  <div class ="content_bottom">
  <p>${store.rstatus}
      <c:choose>
    <c:when test="${ not empty store.category_name}">
    |&nbsp;${store.category_name}
    </c:when>
    <c:otherwise>
     &nbsp;|&nbsp;&nbsp;카테고리 미지정
    </c:otherwise>
    </c:choose>  
  
  </p>
  </div>
   </div>

    <h2 class="content_title">요청 내용</h2>
  <div class="content_body">
 <div class="content_field">
 <p>요청분야</p>
 <select name ="field">
 <option>요청분야</option>
 <option>팝업삭제</option>
 <option>팝업명 변경</option>
 <option>팝업정보 수정</option>
 <option>승인결과 변경</option>
 <option>기타 </option>
 </select>
 </div>
 <hr>
 <div class="content_cover">
 <p>요청 상세내용</p>
 <div class="cover_layout">
 <textarea name ="content" rows="" cols="" placeholder="상세내용을 입력하세요"></textarea>
 </div>
 </div>

   </div>
 <div class="cover_layout">
 <input type="hidden" name="store_idx" value="${store.store_idx}">
 <input class="btn2" type="submit" value="등록">
  </div>
  
  </form>
  </main>
  
   <aside>
    <div id="side_title"><p>관리메뉴</p></div>
    <div id="side_layout">
    <a href="/Business/Management/Main/List?company_idx=${company_idx}"><div class="side_menu">스토어 관리</div></a>
    <a href="/Business/Management/Request/List?company_idx=${company_idx}"><div class="side_menu">요청 관리</div></a>
    <a href="/Business/Management/Info?company_idx=${company_idx}"><div class="side_menu">회원정보 관리</div></a>
    </div>
  </aside>
 </div>
 <%@include file="/WEB-INF/include/footer_company.jsp" %>		
 <script>
 const container = document.querySelector('.container');
 const mainTag = document.querySelector('main');
 const mainHeight = mainTag.offsetHeight;
 const viewportHeight = window.innerHeight - 204;
 console.log(viewportHeight);

 // 조건에 따라 container의 높이를 설정
 container.style.height = `\${Math.max(mainHeight, viewportHeight)}px`;
function goBack() {
    window.history.back();  // 이전 페이지로 돌아가기
}
</script>
 <script src="/js/authcompany.js" defer></script> 
</body>
</html>






