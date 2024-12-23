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

.myinfo {
  margin-top:40px;
  padding-left:40px;
}

.infotitle {
  color:#a2a2a2;
  font-size:32px;
  font-weight:900;
}

.infocontent {
  color:white;
  font-size:40px;
  font-weight:800;
  margin-top:10px;
}

.liner {
  align-self: stretch;
  height: 0px;
  border: 1px #a2a2a2 solid;
  width:1000px;
  margin-top:15px;
}

.category {
  display:flex;
  gap:15px;
  margin-top:40px;
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

.categories:nth-child(7) {
  background-color:#00ff84;
  color:black;
}

.categories:nth-child(12) {
  background-color:#00ff84;
  color:black;
}

.btn {
  display:flex;
  justify-content:center;
  gap:10px;
  margin-top:300px;
}

.btn-update {
  width:110px;
  height:55px;
  border:1px solid white;
  border-radius:8px;
  font-size:20px;
  background-color:white;
  color:black;
  font-weight:800;
  
}

.btn-quit {
  width:110px;
  height:55px;
  border:1px solid #ff5656;
  border-radius:8px;
  font-size:20px;
  background-color:#ff5656;
  color:black;
  font-weight:800;
  
}

.btn-block {
  width:100%;
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
	<h2 class="pagetitle">내 정보</h2>
	<div class="myinfo">
	 <h3 class="infotitle">이름</h3>
	 <p class="infocontent">진유찬</p>
	 <div class="liner"></div>
	</div>
	<div class="myinfo">
	 <h3 class="infotitle">닉네임</h3>
	 <p class="infocontent">뒤뚱뒤뚱치타</p>
	 <div class="liner"></div>
	</div>
	<div class="myinfo">
	 <h3 class="infotitle">계정정보</h3>
	 <p class="infocontent">jinc4168@gmail.com</p>
	 <div class="liner"></div>
	</div>
	<div class="myinfo">
	 <h3 class="infotitle">연락처</h3>
	 <p class="infocontent">010-1234-1234</p>
	 <div class="liner"></div>
	</div>
	<h2 class="pagetitle"># 관심 카테고리</h2>
	<div class="category">
	 <p class="categories"><a href="" class="block">브랜드</a></p><p class="categories">패션/뷰티</p><p class="categories">식품</p>
	 <p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p>
	 <p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p>
	 <p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p>
	 <p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p><p class="categories">패션/뷰티</p>
	</div>
	<div class="btn">
	 <div class="btn-update"><a href="" class="btn-block">수정</a></div>
	 <div class="btn-quit"><a href="" class="btn-block">회원탈퇴</a></div>
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
