<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
</head>
<style>
body{
  background-color:#121212;
  color:white;
  font-family:'Pretendard';
}
/*---------------------------------------*/
/*검색창*/
.search-container {
    position: relative;
    width: 100%;
    max-width: 1250px; /* 최대 너비 */
    margin: 0 auto; /* 중앙 정렬 */
    margin-top: 50px; /* 아래로 내릴 만큼 값 증가 */
}

.search-input {
    width: 100%;
    padding: 20px 50px; /* 패딩 */
    border: 2px solid #00ff84; /* 테두리 색상 */
    border-radius: 15px; /* 둥근 모서리 */
    background-color: #121212; /* 배경색 */
    color: white; /* 글자색 */
}

.search-input::placeholder {
    color: #00ff84; /* 플레이스홀더 색상 */
}

.search-button {
    position: absolute;
    right: 15px; /* 오른쪽 여백 조정 */
    top: 50%;
    transform: translateY(-50%);
    background: transparent; /* 투명 배경 */
    border: none; /* 테두리 없음 */
    cursor: pointer; /* 포인터 커서 */
}

.search-button img {
    width: 35px; /* 아이콘 크기 */
    height: 35px; /* 아이콘 크기 */
}
.ongoingfilter {
    position: relative; /* 요소를 고정 */
    top: 10px; /* 기존의 70px에서 200px 올리기 위해 -130px으로 설정 */
    left: calc(50% - 825px); /* 왼쪽으로 이동 */
    transform: translateX(0); /* 중앙 정렬 보정 제거 */
    width: 1000px;
    height: 100px;
    margin-top: 10px; /* 위쪽 여백을 줄임 */
}
/*----------------------------------------------*/
/*필터링*/
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
/*-------------------------------------------------*/
/* */
table tr:first-child td {
    background-color: #2D2D2D;
    color: white;
    font-size: 32px;
    font-family: 'Pretendard';
    padding: 20px 0 20px 10px; /* 위아래 패딩 추가 */
}
table {
   width : 1250px;
   height : 400px;
}
table tr:last-child td{
   padding: 30px 0;
    font-family: 'Pretendard';
   
}

.title{
    font-size: 36px;
}

.info {
    font-size: 16px;
    }
    

/*--------------------------------------------------*/
.card {
    display: flex; /* 플렉스 박스 사용 */
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
}

.card img {
    max-width: 100%; /* 이미지 크기 조정 */
    height: auto; /* 비율 유지 */
     border-radius: 10px
}
</style>
<%@include file="/WEB-INF/include/header.jsp" %>
<body>
<div >
	<div class="search-container">
        <input type="text" class="search-input">
        <button class="search-button" type="submit">
            <img class="imgsearch" src="/images/main/search.png" alt="검색">
        </button>
    </div>
    
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
	  
 <div style="display:flex; flex-direction: column; justify-content: center; align-items: center;  margin-top:100px; "class="table-container";">
    <table>
        <tr>
            <td colspan="2">진행중</td>
        </tr>
        <tr>
            <td>
                <div class="card">
                    <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                    <div class="title">내 이름</div>
                    <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
                </div>
            </td>
            <td>
                <div class="card">
                    <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                    <div class="title">내 이름</div>
                    <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
                </div>
            </td>
        </tr>
    </table>

  
 
    <table>
        <tr>
            <td colspan="2">종료</td>
        </tr>
        <tr>
            <td>
                <div class="card">
                    <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                    <div class="title">내 이름</div>
                    <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
                </div>
            </td>
            <td>
                <div class="card">
                    <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                    <div class="title">내 이름</div>
                    <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
                </div>
            </td>
        </tr>
    </table>

  
    <table>
        <tr>
            <td colspan="2">오픈예정</td>
        </tr>
        <tr>
            <td>
                <div class="card">
                    <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                    <div class="title">내 이름</div>
                    <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
                </div>
            </td>
            <td>
                <div class="card">
                    <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                    <div class="title">내 이름</div>
                    <div class="info">서울 서초구 강남대로 429 영남빌 1-26<br>기간: 2024.11.16 - 2024.12.25</div>
                </div>
            </td>
        </tr>
    </table>
 </div>
 </div>
</body>
<%@include file="/WEB-INF/include/footer.jsp" %>
</html>