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
   
    <form action=""> 
   <h2 class="content_title">요청 팝업스토어</h2>
  <div class="content_body">
  <div class="content_header">
  <p>2024.12.14 ~ 2014.12.30</p>
  </div>
  <p class="content_store">메시X스텐리 1942 콜라보 팝업스토어</p>
  <div class ="content_bottom">
  <p>사전예약&nbsp;&nbsp;|&nbsp;&nbsp;잡화&nbsp;&nbsp;|&nbsp;&nbsp;스포츠</p>
  </div>
   </div>

    <h2 class="content_title">요청 내용</h2>
  <div class="content_body">
 <div class="content_field">
 <p>요청분야</p>
 <p>팝업삭제</p>
 </div>
 <hr>
 <div class="content_cover">
 <p>요청 상세내용</p>
 <div class="cover_layout">
 <textarea rows="" cols="" readonly="readonly">상세 내용을 입력하시오</textarea>
 </div>
 <hr>
 <div class="content_response">
 <p>담당자 답변</p> 
 <div id="response_detail">
 이것저것 해서 승인되었습니다 감사합니다:)
 너무 너무너무
 너무 너무너므
 감사합니다 자주 이용하세요
</div>
 </div>

   </div>
</div>
  
  </form>
  </main>
 </div>	
 <script>
function goBack() {
    window.history.back();  // 이전 페이지로 돌아가기
}
</script>
</body>
</html>






