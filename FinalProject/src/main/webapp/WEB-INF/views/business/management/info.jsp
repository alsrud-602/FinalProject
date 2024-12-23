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
.sub_input{
width: 200px;        
height: 43px;         
border: 1px solid #9A9A9A;
box-sizing: border-box; 
font-size: 16px; 
padding-left: 10px;
}
.sub_input_m{
width: 300px;        
height: 43px;         
border: 1px solid #9A9A9A;
box-sizing: border-box; 
font-size: 16px; 
padding-left: 10px;

}


</style>
</head>
<body>
<%@include file="/WEB-INF/include/header_company.jsp" %>
<div class="container">
  <main>
  <form action="">
   <div class="title">
   <p>회원정보를 확인하고 최신 정보로 수정하세요</p>
   <p>회원정보 관리</p>
   </div>
   
   <div class="content">  
   <h2 class="content_title">회원정보 수정</h2>
 
   <div class="content_body">
    <div class="sub_title">기본정보</div>
    <div class="sub_content">
  <table class="sub_table">
        <tr>
           <td>기업명</td>
           <td>스텐리</td>
        </tr>
        <tr>
           <td>아이디</td>
           <td>스텐리</td>
        </tr>
        <tr>
           <td>기존 비밀번호</td>
           <td><input class="sub_input" type="password" readonly="readonly" value="1234"></td>
        </tr>
        <tr>
           <td>비밀번호확인</td>
           <td><input class="sub_input" type="password" placeholder="비밀번호를 입력하시오" required></td>
        </tr>
  </table>
 </div>
 </div>
 
   <div class="content_body">
    <div class="sub_title">세부 정보</div>
    <div class="sub_content">
  <table class="sub_table">
        <tr>
           <td>사업자코드</td>
           <td>3425256-123512</td>
        </tr>
        <tr>
           <td>이메일</td>
           <td><input  class="sub_input_m" type="email" placeholder="이메일을 입력하세요" required></td>
        </tr>
        <tr>
           <td>전화번호</td>
           <td><input class="sub_input_m" type="tel" placeholder="전화번호를 입력하세요" required ></td>
        </tr>
  </table>
 </div>
 </div>
 
 
 
 </div>
 
 <div class="cover_layout">
 <input class="btn2" type="submit" value="수정">
  </div>
  </form>
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
</body>
 
</html>






