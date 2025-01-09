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
  <form action="/Business/Management/Info/Update" onsubmit="return validTest();">
  <input type="hidden" name="company_idx" value="${company.company_idx}">
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
           <td><input id="pw1" class="sub_input" type="password" readonly="readonly" value="1234"></td>
        </tr>
        <tr>
           <td>비밀번호확인</td>
           <td><input id="pw2" class="sub_input" type="password" placeholder="비밀번호를 입력하시오" required></td>
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
           <td><input  name ="email" class="sub_input_m" type="email" placeholder="이메일을 입력하세요" required value="${company.email}"></td>
        </tr>
        <tr>
           <td>전화번호</td>
           <td><input  name ="phone" class="sub_input_m" type="tel" placeholder="전화번호를 입력하세요" required value="${company.phone}"></td>
        </tr>
  </table>
 </div>
 </div>
 
 
 
 </div>
 
 <div class="cover_layout">
 <input class="btn2" type="submit" value="수정" >
  </div>
  </form>
  </main>
  
   <aside>
    <div id="side_title"><p>관리메뉴</p></div>
    <div id="side_layout">
    <a href="/Business/Management/Main/List?company_idx=${company.company_idx}"><div class="side_menu">스토어 관리</div></a>
    <a href="/Business/Management/Request/List?company_idx=${company.company_idx}"><div class="side_menu">요청 관리</div></a>
    <a href="/Business/Management/Info?company_idx=${company.company_idx}"><div class="side_menu">회원정보 관리</div></a>
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
 
 function validTest(){
 const pw1El = document.querySelector('#pw1');
 const pw2El = document.querySelector('#pw2');
 
 console.log(pw1El.value);
 console.log(pw2El.value);
 if( pw1El.value  !== pw2El.value ) {
	 alert('기존비밀번호랑 비밀번호가 일치하지 않습니다')
	 pw2El.focus();
	 return false;
   }
 alert('회원정보가 정상적으로 수정되었습니다 관리 메인페이지로 돌아갑니다')
 return true; 
 }
 </script>
</html>






