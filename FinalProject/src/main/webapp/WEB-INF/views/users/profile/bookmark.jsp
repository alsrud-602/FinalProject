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


.liner {
  align-self: stretch;
  height: 0px;
  border: 1px #a2a2a2 solid;
  width:1100px;
  margin-top:15px;
}

.bookmark-filter {
  color:white;
  font-size:38px;
  margin-top:40px;
}
.bookmarks {
  margin-top:40px;
  display:flex;
  gap:20px;
}

.bookmark {
  width:540px;
  display:flex;
}

.bookmark-content {
  display:flex;
  flex-direction:column;
  height:100%;
  width:100%;
  color:white;
}

.bookmark-header {
  width:100%;
  color:white;
  font-size:25px;
  font-weight:750;
  padding-left:15px;
  display:flex;
  justify-content:space-between;
}


/* bookmark 팝업 날짜(위치css 수정 필요할수도..)*/
.bookmark-date {
  width:100%;
  height:100%;
  padding-left:210px;
  padding-top:100px;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
  <main>
  <div class="inner">
   <div class="container">
	<h2 class="pagetitle">관심 팝업</h2>
	 <div class="liner"></div>
	<h3 class="bookmark-filter"><a href="">전체<img src="/images/profile/caretdown.png"></a></h3>
	<div class="bookmarks">
	 <div class="bookmark">
	  <img src="/images/profile/bookmarkpost.png">
	  <div class="bookmark-content">
	  <div class="bookmark-header"><span>다이노탱 코코컵 팝업스토어</span>
	   <div><img src="/images/profile/hearticon.png"></div>
	  </div>
	  <div class="bookmark-date">2024.12.12 ~ 2024.12.24</div>
	  </div>
	 </div>
	 <div class="bookmark">
	  <img src="/images/profile/bookmarkpost.png">
	  <div class="bookmark-content">
	  <div class="bookmark-header"><span>다이노탱 코코컵 팝업스토어</span>
	   <div><img src="/images/profile/hearticon.png"></div>
	  </div>
	  <div class="bookmark-date">2024.12.12 ~ 2024.12.24</div>
	  </div>
	 </div>
	</div>
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
