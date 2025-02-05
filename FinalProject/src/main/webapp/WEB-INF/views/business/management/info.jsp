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
  <form id="myForm" action="/Business/Management/Info/Update" onsubmit="validTest(event);">
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
           <td>${company.name}</td>
        </tr>
        <tr>
           <td>아이디</td>
           <td>${company.id}</td>
        </tr>
        <tr>
           <td>비밀번호확인</td>
           <td><input id="pw2" class="sub_input" type="password" placeholder="비밀번호를 입력하시오" ></td>
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
  const companyIdx = document.querySelector('input[name="company_idx"]').value;
  console.log("company_idx 값: ", companyIdx);
  const company_idx = '${company.company_idx}';

  console.log('company_idx : ' + company_idx);
  
 const container = document.querySelector('.container');
 const mainTag = document.querySelector('main');
 const mainHeight = mainTag.offsetHeight;
 const viewportHeight = window.innerHeight - 204;
 console.log(viewportHeight);

 // 조건에 따라 container의 높이를 설정
 container.style.height = `\${Math.max(mainHeight, viewportHeight)}px`;

 //-----------------------------------
 
async function validTest(event) {
    // 폼 제출 기본 동작 막기
    event.preventDefault();

    const pwconfigElement = document.getElementById('pw2').value;

    try {
        const response = await fetch(`/Mobile/Password/Config`, {
            method: 'POST', // HTTP 메서드
            headers: {
                'Content-Type': 'application/json' // 전송할 데이터의 형식
            },
            body: JSON.stringify({
                company_idx: company_idx,
                password: pwconfigElement
            }) // JSON 형식으로 데이터 전송
        });

        const result = await response.json(); // 응답을 JSON으로 변환

        if (result) {
            alert("수정되었습니다");
            document.querySelector('#myForm').submit(); // 폼 수동 제출
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    } catch (error) {
        console.error('Error:', error);
        alert("서버 요청 중 오류가 발생했습니다.");
    }
}
 

 </script>
  <script src="/js/authcompany.js" defer></script> 
</html>






