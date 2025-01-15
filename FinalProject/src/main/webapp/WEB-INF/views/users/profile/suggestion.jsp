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
  flex-wrap:wrap;
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
  width:fit-content;
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

.categories {
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

.suggestionimg {
  width:150px;
  height:150px;
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
    <c:forEach var="category" items="${categoryList}">
        <p class="categories">${category.category_id}</p>
    </c:forEach>
</div>
	 <div class="liner"></div>
	<div class="suggestions">
	 <c:forEach var="storeList" items="${storeList}">
	 <div class="suggestion">
	  <img class="suggestionimg" src="/image/read?path=${storeList.image_path}">
	  <div class="suggestion-content">
	  <div class="suggestion-header"><span><a href="/Users/Info?store_idx=${storeList.store_idx}">${storeList.title}</a></span>
	  </div>
	  <div class="popup-date">${storeList.start_date} ~<br> ${storeList.end_date}</div>
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
 <script>
//숫자 -> 텍스트 변환 매핑
 function numberToText(categoryId) {
     const categoryMap = {
         10: "패션/뷰티",
         20: "가전/디지털",
         30: "식물",
         40: "키친/리빙",
         50: "완구",
         60: "레저",
         70: "도서/음반",
         80: "반려동물",
         90: "헬스/스포츠",
         100: "연예인",
         110: "아이돌",
         120: "인플루언서",
         130: "캐릭터",
         140: "소품/굿즈",
         150: "전시",
         160: "공공",
         170: "기타",
         180: "브랜드"
     };

     // 매핑된 텍스트를 반환, 없으면 '기타'로 반환
     return categoryMap[categoryId] || '기타';
 }

 // 페이지 로드 후 실행
 $(document).ready(function() {
     // category_id 값을 찾아서 텍스트로 변환
     $('.categories').each(function() {
         var categoryId = $(this).text().trim();  // category_id 값 가져오기
         var categoryText = numberToText(parseInt(categoryId));  // 숫자 -> 텍스트 변환
         $(this).text(categoryText);  // 변환된 텍스트로 업데이트
     });
 });

 </script>
</body>
</html>
