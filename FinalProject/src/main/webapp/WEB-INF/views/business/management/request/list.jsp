<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common-company.css" />
<link rel="stylesheet"  href="/css/company_m.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>

</style>
</head>
<body>
<%@include file="/WEB-INF/include/header_company.jsp" %>
<div class="container">
  <main>
   <div class="title">
   <p>수정으로 변경 불가한 사항을 관리자에게 문의하세요</p>
   <p>팝업스토어 요청 관리</p>
   </div>
   <div class="content">
   
   <h2 class="content_title">관리자 요청 내역</h2>
   <div class="content_body">
   
   <c:forEach var="r" items="${rList}" varStatus="status">
  <div class="content_header">
  <p>${r.start_date} ~ ${r.end_date}</p>
  <div>
  <c:choose>
  <c:when test="${not empty r.response}">
    처리완료
  </c:when>
  <c:otherwise>
   진행중
  </c:otherwise>
  </c:choose>
 
  </div>
  </div>
  <p class="content_store"><a href="/Business/Management/Request/View?request_idx=${r.request_idx}">${r.title}</a></p>
  <div class ="content_bottom">
  <p>요청분야&nbsp;&nbsp;|&nbsp;&nbsp;${r.field}</p>
  </div>


  
 <c:if test="${!status.last}">
   <hr>
   </c:if>
  </c:forEach>
   </div>
   </div>
 

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

</script>
 <script src="/js/authcompany.js" defer></script> 
</body>
 
</html>






