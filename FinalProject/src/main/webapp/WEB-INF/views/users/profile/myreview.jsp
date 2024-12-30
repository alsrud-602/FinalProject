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

.container {
  width:1150px;
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

.sub-head {
  color:white;
  font-size:18px;
  font-weight:750;
}

.myreview {
  border-top:1px solid #00ff84;
  border-bottom:1px solid #00ff84;
  border-collapse:collapse;
  height:240px;
  display:flex;
  }

.sub-header {
  display:flex;
  justify-content:space-between;
  padding-left:15px;
  padding-right:15px;
  height:40px;
  align-items:center;
}

.sorting {
  display:flex;
  color:white;
  gap:10px;
}

.sorting span {
  border:1px solid #00ff84;
  border-radius:10px;
  display:flex;
  justify-content:center;
  align-items:center;
  padding:10px 20px 10px 20px;
  width:fit-content;
}

.review-img {
  height:inherit;
  display:flex;
  align-items:center;
}

.review-updown {
  display:flex;
  flex-direction:column;
  width:905px;
  justify-content:space-between;
  padding-left:15px;
  padding-top:15px;
  padding-bottom:15px;
}

.review-above {
  display:flex;
  color:white;
  justify-content:space-between;
  align-items:center;
  width:inherit;
}

.popup-name {
  font-size:48px;
  font-weight:800;
  color:white;
}

.review-point {
  font-size:24px;
  font-weight:600;
  color:#00ff84;
  display:flex;
  align-items:center;
  gap:10px;
}

.review-under {
  display:flex;
  align-items:center;
  justify-content:space-between;
  padding-bottom:15px;
  width:inherit;
}

.review-react {
  color:white;
  display:flex;
  gap:65px;
  align-items:center;
}

#review-date {
  color:#767676;
  font-size:25px;
  font-weight:750;
  display:flex;
  align-items:center;
  gap:10px;
}

#review-view {
  color:white;
  font-size:25px;
  font-weight:750;
  display:flex;
  align-items:center;
  gap:10px;
}

#review-like {
  color:white;
  font-size:25px;
  font-weight:750;  
  display:flex;
  align-items:center;
  gap:10px;
}

#popup-date {
  color:white;
  font-size:25px;
  font-weight:750;
  display:flex;
  align-items:center;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
  <main>
  <div class="inner">
   <div class="container">
	<h2 class="pagetitle">내가 쓴 리뷰</h2>
	<div class="sub-header">
	 <span class="sub-head">전체리뷰 3</span>
	 <div class="sorting">
	  <span>좋아요순</span>
	  <span>평점순</span>
	  <span>최신순</span>
	 </div>
	</div>
	<div class="myreview">
	  <div class="review-img">
	  <img src="/images/profile/myreviewpost.png">
	  </div>
	  <div class="review-updown">
	   <div class="review-above">
	    <div class="popup-name">다이노탱 코코컵 팝업스토어</div>
	    <div class="review-point">평점<img src="/images/profile/starsicon.png"></div>
	   </div>
	   <div class="review-under">
	    <div class="review-react">
	     <div id="review-date"><img src="/images/profile/calendaricon.png">2024.12.13</div>
	     <div id="review-view"><img src="/images/profile/eyesicon.png">34</div>
	     <div id="review-like"><img src="/images/profile/likeicon.png">34</div>
	    </div>
	    <div id="popup-date">2024.12.12 ~ 2024.12.24</div>
	   </div>
	  </div>
	 </div>
	 <div class="myreview">
	  <div class="review-img">
	  <img src="/images/profile/myreviewpost.png">
	  </div>
	  <div class="review-updown">
	   <div class="review-above">
	    <div class="popup-name">다이노탱 코코컵 팝업스토어</div>
	    <div class="review-point">평점<img src="/images/profile/starsicon.png"></div>
	   </div>
	   <div class="review-under">
	    <div class="review-react">
	     <div id="review-date"><img src="/images/profile/calendaricon.png">2024.12.13</div>
	     <div id="review-view"><img src="/images/profile/eyesicon.png">34</div>
	     <div id="review-like"><img src="/images/profile/likeicon.png">34</div>
	    </div>
	    <div id="popup-date">2024.12.12 ~ 2024.12.24</div>
	   </div>
	  </div>
	 </div>
    <div class="myreview">
	  <div class="review-img">
	  <img src="/images/profile/myreviewpost.png">
	  </div>
	  <div class="review-updown">
	   <div class="review-above">
	    <div class="popup-name">다이노탱 코코컵 팝업스토어</div>
	    <div class="review-point">평점<img src="/images/profile/starsicon.png"></div>
	   </div>
	   <div class="review-under">
	    <div class="review-react">
	     <div id="review-date"><img src="/images/profile/calendaricon.png">2024.12.13</div>
	     <div id="review-view"><img src="/images/profile/eyesicon.png">34</div>
	     <div id="review-like"><img src="/images/profile/likeicon.png">34</div>
	    </div>
	    <div id="popup-date">2024.12.12 ~ 2024.12.24</div>
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
