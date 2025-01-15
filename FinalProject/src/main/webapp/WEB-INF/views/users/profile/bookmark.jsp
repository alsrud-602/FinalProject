<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  width:1200px;
  margin-top:15px;
}

.bookmarks {
  margin-top: 40px;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  width: 100%;
}

.bookmark {
  width: 560px;
  display: flex;
  margin-bottom: 20px;
}

.bookmark-content {
  display: flex;
  flex-direction: column;
  height: 100%;
  width: 100%;
  color: white;
}

.bookmark-filter {
  color:white;
  font-size:38px;
  margin-top:40px;
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

.bookmark-img {
  width:200px;
  height:210px;
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
	 <c:forEach items="${BookmarkList}" var="bookmark">
                        <div class="bookmark">
                            <img class="bookmark-img" src="/image/read?path=${bookmark.image_path}">
                            <div class="bookmark-content">
                                <div class="bookmark-header">
                                    <span><a href="/Users/Info?store_idx=${bookmark.store_idx}">${bookmark.title}</a></span>
                                    <div><img src="/images/profile/hearticon.png"></div>
                                </div>
                                <div class="bookmark-date">${bookmark.start_date} ~ ${bookmark.end_date}</div>
                            </div>
                        </div>
                    </c:forEach>
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
 <script src="/js/authuser.js" defer></script> 
</body>
</html>
