<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
  <div class="content_header">
  <p>2024.12.14 ~ 2014.12.30</p><div>진행중</div>
  </div>
  <p class="content_store"><a href="/Review/Rview">메시X스텐리 1942 콜라보 팝업스토어</a></p>
  <div class ="content_bottom">
  <p>요청분야&nbsp;&nbsp;|&nbsp;&nbsp;기타</p>
  </div>


  
  <hr>
     <div class="content_header">
  <p>2024.12.14 ~ 2014.12.30</p><div>처리완료</div>
  </div>
  <p class="content_store"><a href="/Review/Rview">메시X스텐리 1942 콜라보 팝업스토어</a></p>
  <div class ="content_bottom">
  <p>요청분야&nbsp;&nbsp;|&nbsp;&nbsp;입점거부</p>
  </div>

  <hr>
     <div class="content_header">
  <p>2024.12.14 ~ 2014.12.30</p><div>진행중</div>
  </div>
  <p class="content_store"><a href="/Review/Rview">메시X스텐리 1942 콜라보 팝업스토어</a></p>
  <div class ="content_bottom">
  <p>요청분야&nbsp;&nbsp;|&nbsp;&nbsp;팝업정보수정</p>
  </div>
  
   
   </div>
   </div>
 

  </main>
  
    <aside>
    <div id="side_title"><p>관리메뉴</p></div>
    <div id="side_layout">
    <a href="/Review/Rview"><div class="side_menu">스토어 관리</div></a>
    <a href="/Review/Rview"><div class="side_menu">요청 관리</div></a>
    <a href=""><div class="side_menu">회원정보 관리</div></a>
    </div>
  </aside>
  
</div>	
<%@include file="/WEB-INF/include/footer_company.jsp" %>


</body>
 
</html>






