<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />


<style>
   body{
   background-color: #121212 !important;
    color: white !important;
   }
   .container {
    display: grid;
    grid-template-columns: repeat(3, 400px); /* 3개씩 나열 */
    gap: 15px; /* 간격을 줄임 */
    padding: 15px; /* 패딩 조정 */
    justify-items: center; /* 카드 가운데 정렬 */
    justify-content: center; /* 컨테이너 내에서 카드들을 가운데 정렬 */
}


  .card {
    background-color: #121212; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 15px; /* 패딩 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: white;
    width: 100%; /* 카드 폭을 컨테이너에 맞춤 */
    max-width: 535px; /* 최대 너비 설정 */
  }

  .card img {
    width: 100%; /* 카드 크기에 맞춤 */
    max-width: 500px; /* 최대 너비를 400px로 설정 */
    height: auto; /* 비율 유지 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
}

  .title {
    font-size: 36px; /* 제목 크기 */
    margin: 10px 0; /* 여백 */
    color: white;
    font-family:'Pretendard';
  }

  .info {
    font-size: 16px; /* 정보 크기 */
    color: white; /* 정보 색상 */
    
    }
   .mainfilter {    
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius: 10px;
    font-family:'Pretendard';
    font-size:20px;
    border: 2px solid #00ff84;
    margin-left:21%; 
    padding-left:20px;
    padding-right:20px;   
    }
    
  .regionfilter{
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    font-size:20px;
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 13px;
    }
    
    #calendarInput{
    background: #121212;
    color: white;
    border: none;
    border-radius: 10px;
    font-family:'Pretendard';
    font-size:20px;
    text-align: center;
    border: 2px solid #00ff84;
    display: inline-block;
    padding-top : 11px;
    padding-bottom : 11px;
    }
    
    .h2text{
    max-width: 300px;
    position: relative;
    width: 100%;
    margin: 0 auto;
    font-family:'Pretendard';
    font-size:40px;
    
    }
    .ongoingfilter {
    position: relative; /* 요소를 고정 */
    top: 70px; /* 원하는 위치에 맞게 조정 */
    left: calc(50% - 825px); /* 왼쪽으로 100px 이동 (1000px의 절반 만큼) */
    transform: translateX(0); /* 중앙 정렬 보정 제거 */
    width: 1000px;
    height: 100px;
}
</style>
</head>
<%@include file="/WEB-INF/include/header.jsp" %>
<body>
<div>
 <div>
	<h2 class="h2text">오픈 예정</h2>
	  <div class="ongoingfilter">
	    <input type="date"class="mainfilter" id="datepickerButton" >
	    <select class="regionfilter">
	      <option>지역</option>
	      <option>서울</option>
	      <option>부산</option>
	      <option>대구</option>
	      <option>대전</option>
	      <option>울산</option>
	      <option>광주</option>
	      <option>인천</option>
	      <option>제주도</option>
	    </select>
	    <select class="regionfilter">
	      <option>연령대</option>
	      <option>10대</option>
	      <option>20대</option>
	      <option>30대</option>
	      <option>40대</option>
	      <option>50대</option>
	    </select>
	  </div>
   </div>
</div>

<div class="container">
    <div class="card">
      <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div>
    <div class="card">
      <img src="/images/main/popup2.png" alt="/images/main/popup2.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div>
    <div class="card">
      <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div>
    <!-- 추가 카드 -->
    <div class="card">
      <img src="/images/main/popup2.png" alt="/images/main/popup2.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div>
    <div class="card">
      <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div>
    <div class="card">
      <img src="/images/main/popup2.png" alt="/images/main/popup2.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div><div class="card">
      <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div><div class="card">
      <img src="/images/main/popup2.png" alt="/images/main/popup2.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div><div class="card">
      <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
      <div class="title">내 이름</div>
      <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
    </div>
  </div>
</body>
<%@include file="/WEB-INF/include/footer.jsp" %>
</html>