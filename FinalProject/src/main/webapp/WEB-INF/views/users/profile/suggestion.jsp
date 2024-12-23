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

.subtitle {
  color:white;
  font-size:38px;
  margin-top:20px;
}

.subtitle2 {
  color:white;
  font-size:38px;
  margin-top:60px;
}

.suggestions {
  margin-top:40px;
  display:flex;
  gap:20px;
}

.suggestion {
  width:540px;
  display:flex;
}

.suggestion-content {
  display:flex;
  flex-direction:column;
  height:100%;
  width:100%;
  color:white;
}

.suggestion-header {
  width:100%;
  color:white;
  font-size:25px;
  font-weight:750;
  padding-left:15px;
  display:flex;
  justify-content:space-between;
}


/* bookmark 팝업 날짜(위치css 수정 필요할수도..)*/
.popup-date {
  width:100%;
  height:100%;
  padding-left:210px;
  padding-top:100px;
}

.category {
  display:flex;
  gap:15px;
  margin-top:25px;
  flex-wrap:wrap;
  max-width:1000px;
}

.categories {
  display:flex;
  color:#9f9f9f;
  border:1px solid rgba(159, 159, 159, 0.5);
  width:fit-content;
  font-size:30px;
  border-radius:7px;
  height:44px;
  align-items:center;
  justify-content:center;
  font-weight:800;
  padding:0 15px;
}

.categories:nth-child(1) {
  background-color:#00ff84;
  color:black;
}

.categories:nth-child(2) {
  background-color:#00ff84;
  color:black;
}

.categories:nth-child(3) {
  background-color:#00ff84;
  color:black;
}

.tag {
  background-color:#00ff84;
  color:black;
  border-radius:8px;
  width:80px;
  font-size:20px;
  height:100%;
  display:flex;
  justify-content:center;
  align-items:center;
}



</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
  <main>
  <div class="inner">
   <div class="container">
	<h2 class="pagetitle">추천 팝업</h2>
	<h3 class="subtitle"># 관심 카테고리별 추천 팝업 리스트</h3>
	<div class="category">
	 <p class="categories">브랜드</p><p class="categories">패션/뷰티</p><p class="categories">식품</p>
	</div>
	 <div class="liner"></div>
	<div class="suggestions">
	 <div class="suggestion">
	  <img src="/images/profile/bookmarkpost.png">
	  <div class="suggestion-content">
	  <div class="suggestion-header"><span>다이노탱 코코컵 팝업스토어</span>
	   <div><p class="tag">브랜드</p></div>
	  </div>
	  <div class="popup-date">2024.12.12 ~ 2024.12.24</div>
	  </div>
	 </div>
	 <div class="suggestion">
	  <img src="/images/profile/bookmarkpost.png">
	  <div class="suggestion-content">
	  <div class="suggestion-header"><span>다이노탱 코코컵 팝업스토어</span>
	   <div><p class="tag">반려동물</p></div>
	  </div>
	  <div class="popup-date">2024.12.12 ~ 2024.12.24</div>
	  </div>
	 </div>
	</div>
	<h3 class="subtitle2"># 관심 카테고리별 추천 팝업 리스트</h3>
	<div class="category">
	 <p class="categories">가까운</p><p class="categories">새로나온</p><p class="categories">인기있는</p>
	</div>
	<div class="liner"></div>
	<div class="suggestions">
	 <div class="suggestion">
	  <img src="/images/profile/bookmarkpost.png">
	  <div class="suggestion-content">
	  <div class="suggestion-header"><span>다이노탱 코코컵 팝업스토어</span>
	   <div><p class="tag">가까운</p></div>
	  </div>
	  <div class="popup-date">2024.12.12 ~ 2024.12.24</div>
	  </div>
	 </div>
	</div>
   </div>
   <aside>
	 <div class="sidebar">
	  <table>
	   <tbody>
	    <tr><td><a href="">내 정보</a></td></tr>
	    <tr><td><a href="">예약내역</a></td></tr>
	    <tr><td><a href="">관심팝업</a></td></tr>
	    <tr><td><a href="">지갑</a></td></tr>
	    <tr><td><a href="">추천스토어</a></td></tr>
	    <tr><td><a href="">내가 쓴 리뷰</a></td></tr>
	   </tbody>
	  </table>
	 </div>
   </aside>
  </div>
  </main>	
 <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
