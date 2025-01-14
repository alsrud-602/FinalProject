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
<link rel="stylesheet"  href="/css/common.css" />
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
   <p>입점현황부터 여러 팝업스토어를 한번에 관리하세요</p>
   <p>팝업스토어 관리</p>
   

   </div>
   <div class="content">
   <h2 class="content_title">운영 팝업스토어</h2>
   <div class="content_body">
   <c:forEach var="so" items="${soList}"   varStatus="status">
  <div class="content_header">
  <p>${so.start_date} ~ ${so.end_date}</p><div id="content_red">${so.label}</div>
  </div>
  <p class="content_store">${so.title}</p>
  <div class ="content_bottom">
  <p>${so.rstatus}
    <c:choose>
    <c:when test="${ not empty so.category_name}">
|&nbsp;${so.category_name}
    </c:when>
    <c:otherwise>
     &nbsp;|&nbsp;&nbsp;카테고리 미지정
    </c:otherwise>
    </c:choose>  
  
  </p><a href="/Business/Operation/View">운영페이지 > </a>
  </div> 
  <br>
     <c:if test="${!status.last}">
    <hr>
  </c:if>
  </c:forEach>  
   </div>
   
   <h2 class="content_title">스토어 내역</h2>
   <div class="content_body">
   
  <c:forEach var="sh" items="${shList}" varStatus="status"> 
  <div class="content_header">
    <p>${sh.start_date} ~ ${sh.end_date}</p>
    <div>
      <c:choose>
		<c:when test="${sh.status == '승인'}">
		 ${sh.label}
		 </c:when>
		 <c:otherwise>
		 ${sh.status}
		 </c:otherwise>
		</c:choose>
    </div>
  </div>
  <p class="content_store">${sh.title}</p>
  <div class ="content_bottom">
    <p>${sh.rstatus}
    <c:choose>
    <c:when test="${ not empty sh.category_name}">
    |&nbsp;${sh.category_name}
    </c:when>
    <c:otherwise>
    |&nbsp;&nbsp;카테고리 미지정
    </c:otherwise>
    </c:choose>  
    </p>
  </div>
  <div class="content_detail">
    <div class="detail_ing">
        <c:choose>
            <c:when test="${sh.status == '서류완료'}">
                <div class="ing_active">작성완료</div>
                <div class="ing-box"></div>
                <div class="ing_basic">입점심사중</div>
                <div class="ing-box"></div>
                <div class="ing_basic">결과</div>
            </c:when>
            <c:when test="${sh.status == '심사중'}">
                <div class="ing_basic">작성완료</div>
                <div class="ing-box"></div>
                <div class="ing_active">입점심사중</div>
                <div class="ing-box"></div>
                <div class="ing_basic">결과</div>
            </c:when>
            <c:when test="${sh.status == '승인'}">
                <div class="ing_basic">작성완료</div>
                <div class="ing-box"></div>
                <div class="ing_basic">입점심사중</div>
                <div class="ing-box"></div>
                <div class="ing_active">승인</div>
            </c:when>
            <c:when test="${sh.status == '불가'}">
                <div class="ing_basic">작성완료</div>
                <div class="ing-box"></div>
                 <div class="ing_basic">입점심사중</div>
                 <div class="ing-box"></div>
                <div class="ing_active">불가</div>
            </c:when>
            <c:otherwise>
                <div class="ing_basic">상태 없음</div>
            </c:otherwise>
        </c:choose>
  </div>  
  <div class="detail_btn">
  <c:if test="${sh.label == '예정' || sh.status == '불가'}">
     <a class="btn1" href="/Business/Management/Main/UpdateForm?store_idx=${sh.store_idx}">수정</a>
  </c:if>
  <a class="btn1" href="/Business/Management/Request/WriteForm?store_idx=${sh.store_idx}">관리자 요청</a>
  </div>
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
</body>
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
</html>






