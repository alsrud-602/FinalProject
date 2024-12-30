<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필내정보</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/auth.js" defer></script>
<style>

main {
  background-color:#121212;
  padding-bottom:400px;
}


.inner {
  margin:0 auto;
  max-width:1500px;
  display:flex;
  padding-left:150px;
}

.sidebar {
  margin-left:150px;
  margin-top:50px;
  width:100%;
}

.sidebar table {
  position:fixed;
  width:150px;
  height:500px;
  border:3px solid #00ff84;
  border-radius:8px;
  color:white;
  padding-top:10px;
  padding-bottom:10px; 
}

.sidebar td {
  padding: 15px 15px;
  text-align:center;
  font-size:22px;
  font-weight:800;
}

.sidebar a {
  display:block;
}


.pagetitle {
  color:white;
  font-size:58px;
  margin-top:40px;
}

.reserve-table {
  width:1000px;
  margin-top:40px;
  border-collapse:collapse;
  color:white;
}

.reserve-table tr {
  border-bottom:1px solid #00ff84;
  border-top:1px solid #00ff84;
}

.reserve-table th {
  font-size:20px;
  font-weight:800;
  height:40px;
}
.reserve-table th:nth-child(1) {
  width:150px;
}

.reserve-table th:nth-child(2) {
  width:450px;
}

.reserve-table th:nth-child(3) {
  width:250px;
}

.reserve-table td {
  height:160px;
  text-align:center;
  font-weight:700;
}

.reserve-table td:nth-child(2) {
  display:flex;
  align-items:center;
}

.reserve-table img {
  height:140px;
}

.span-flex {
  display:flex;
  flex-direction:column;
  padding-left:10px;
  text-align:left;
}

.span-flex span:nth-child(1) {
  font-size:18px;
  font-weight:750;
  margin-bottom:35px;
}

.span-flex span:nth-child(3) {
  font-weight:750;
}

.span-flex2 {
  display:flex;
  flex-direction:column;
  text-align:left;
  gap:12px;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
  <main>
  <div class="inner">
   <div class="container">
	<h2 class="pagetitle">예약 내역</h2>
	<table class="reserve-table">
	 <thead>
	  <tr>
	   <th>예약일자</th>
	   <th>팝업정보</th>
	   <th>예약정보</th>
	   <th>상태</th>
	  </tr>
	 </thead>
	 <tbody>
	  <tr>
	   <td>2024.12.12</td>
	   <td><img src="/images/profile/post.png">
	    <div class="span-flex">
	     <span>2024 춘배 팝업스토어</span>
	     <span>2024.12.12 ~ 2024.12.24</span>
	     <span>연세대학교 대강당</span>
	    </div>
	   </td>
	   <td>
	    <div class="span-flex2">
	     <span>방문일&nbsp;&nbsp;2024.12.18</span>
	     <span>매수&nbsp;&nbsp;1매</span>
	     <span>취소가능&nbsp;&nbsp;2024.12.17까지</span>
	    </div>
	   </td>
	   <td><span>예약완료</span></td>
	  </tr>
	  <tr>
	   <td>2024.12.12</td>
	   <td><img src="/images/profile/post.png">
	    <div class="span-flex">
	     <span>2024 춘배 팝업스토어</span>
	     <span>2024.12.12 ~ 2024.12.24</span>
	     <span>연세대학교 대강당</span>
	    </div>
	   </td>
	   <td>
	    <div class="span-flex2">
	     <span>방문일&nbsp;&nbsp;2024.12.18</span>
	     <span>매수&nbsp;&nbsp;1매</span>
	     <span>취소가능&nbsp;&nbsp;2024.12.17까지</span>
	    </div>
	   </td>
	   <td><span>예약완료</span></td>
	  </tr>
	  <tr>
	   <td>2024.12.12</td>
	   <td><img src="/images/profile/post.png">
	    <div class="span-flex">
	     <span>2024 춘배 팝업스토어</span>
	     <span>2024.12.12 ~ 2024.12.24</span>
	     <span>연세대학교 대강당</span>
	    </div>
	   </td>
	   <td>
	    <div class="span-flex2">
	     <span>방문일&nbsp;&nbsp;2024.12.18</span>
	     <span>매수&nbsp;&nbsp;1매</span>
	     <span>취소가능&nbsp;&nbsp;2024.12.17까지</span>
	    </div>
	   </td>
	   <td><span>예약완료</span></td>
	  </tr>
	 </tbody>
	</table>
   </div>
   <aside>
	 <div class="sidebar">
	  <table>
	   <tbody>
	    <tr><td><a href="/Users/Profile/Home">내 정보</a></td></tr>
	    <tr><td><a href="/Users/Profile/Reservation">예약내역</a></td></tr>
	    <tr><td><a href="/Users/Profile/Bookmark">관심팝업</a></td></tr>
	    <tr><td><a href="">지갑</a></td></tr>
	    <tr><td><a href="/Users/Profile/Suggestion">추천스토어</a></td></tr>
	    <tr><td><a href="/Users/Profile/Myreview">내가 쓴 리뷰</a></td></tr>
	   </tbody>
	  </table>
	 </div>
   </aside>
  </div>
  </main>	
 <%@include file="/WEB-INF/include/footer.jsp" %>
 <script>
 document.addEventListener("DOMContentLoaded", () => {
	    const token = localStorage.getItem("token");
	    const kakaoAccessToken = localStorage.getItem("kakaoAccessToken");

	    if (!token && !kakaoAccessToken) {
	        alert("로그인이 필요합니다.");
	        window.location.href = "/Users/LoginForm"; // 로그인 페이지로 이동
	        return;
	    }

	    // 중복 요청 방지: token과 kakaoAccessToken 중 하나만 처리
	    const isUserToken = !!token;
	    const authToken = isUserToken ? token : kakaoAccessToken;
	    const tokenType = isUserToken ? "UserToken" : "KakaoToken";

	    // 사용자 정보 요청
	    fetch("/Users/user-info", {
	        method: "GET",
	        headers: {
	            "Authorization": "Bearer " + authToken,
	            "Token-Type": tokenType
	        }
	    })
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("사용자 정보를 가져오지 못했습니다.");
	            }
	            return response.text();
	        })
	      .then(html => {
	          const bodyElement = document.querySelector("body");
	          const header = document.querySelector("header");
	          const footer = document.querySelector("footer");
	          
	          // 기존 내용을 삭제하지 않고 main만 업데이트
	          const mainElement = document.querySelector("main");
	          mainElement.innerHTML = html; // main 부분만 갱신
	          
	          bodyElement.appendChild(header); 
	         // body에서 기존 footer 제거
	         if (bodyElement.contains(footer)) { 
	             bodyElement.removeChild(footer);  
	         }
	      })
	        .catch(error => {
	            console.error("Error:", error);
	            alert("사용자 정보를 불러오지 못했습니다.");
	        });
	});

</script>
</body>
</html>
