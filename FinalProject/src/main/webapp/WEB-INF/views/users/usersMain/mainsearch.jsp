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
    .agefilter{
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
    position: relative;
    }
    .nodata{
      font-size: 40px;
      padding : 30px;
      width: 600px;
      margin-left: 500px;
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
/*--------------------------------------*/
 .slide-wrapper {
     position: relative;
     width: 1470px;
     margin: 0 auto;
     height: 350px;
     overflow: hidden;
     }
        
  .slides {
     position: absolute;
     left: 0; top: 0;
     width: 2610px;
     transition: left 0.5s ease-out;
   }
        
   .slides li:not(:last-child) {
     float: left;
     margin-right: 10px;
   }
        
   .controls {
     text-align: center;
     margin-top: 50px;
   }
        
   .controls span {
      background: #333;
      color: #fff;
      padding: 10px 20px;
      margin: 0 10px;
      cursor: pointer;
   } 
   
   .slides img {
    width: 350px; /* 너비 400px */
    height: auto; /* 비율 유지 */
    border-radius: 10px;
}
   
   

  .carousel1 h2 {
    display: inline-block;
    margin-right: 10px; /* 제목과 버튼 사이의 간격 조절 */
}

    
.maintext {
    max-width: 1000px; /* 최대 너비 설정 */
    width: 100%; /* 너비를 100%로 설정 */
    margin: 0 auto; /* 수평 중앙 정렬 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.maintitle {
    font-size: 38px; /* 폰트 크기 */
    font-family: 'Pretendard';
    padding: 30px;
    background: #2D2D2D;
    width: 1000px; /* 너비를 자동으로 설정 */
    margin: 70px auto 40px auto; /* 수직 여백, 수평 중앙 정렬 */
}

.slides-href{
	position: relative; /* 위치 설정 */
	
}
.slides-title,
.slides-info {
    position: absolute; /* 절대 위치 설정 */
    bottom: 10px; 
    left: 10px;
    background-color: rgba(0, 0, 0, 0.3);
    color: white;
    padding: 5px;
    border-radius: 5px; 
}
.slides-title{
  bottom : 75px;
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
	      <option value="">지역</option>
	      <option value="서울">서울</option>
	      <option value="부산">부산</option>
	      <option value="대구">대구</option>
	      <option value="대전">대전</option>
	      <option value="울산">울산</option>
	      <option value="광주">광주</option>
	      <option value="인천">인천</option>
	      <option value="제주도">제주도</option>
	    </select>
	    <select class="agefilter">
	      <option value="">연령대</option>
	      <option value="10대">10대</option>
	      <option value="20대">20대</option>
	      <option value="30대">30대</option>
	      <option value="40대">40대</option>
	      <option value="50대">50대</option>
	    </select>
	  </div>
	  
 <div style="display:flex; flex-direction: column; justify-content: center; align-items: center;  margin-top:100px; "class="table-container";">
 
    <div class="carousel1">
    <div class ="maintext">
        <h2 class="maintitle">진행중</h2>
    </div>
    <div class="slide-wrapper">
        <ul class="slides">
            <c:if test="${not empty ongoingsearchlist}">
                <c:forEach var="ongoing" items="${ongoingsearchlist}">
                    <li>
                        <div class="slides-href">
                            <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
                            <div class="slides-title">${ongoing.title}</div>
                            <div class="slides-info">주소:${ongoing.address}<br>기간: ${ongoing.start_date} ~ ${ongoing.end_date}</div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty ongoingsearchlist}">
                <li>
                    <div class="slides-href">
                        <div class="nodata">데이터가 없습니다.</div>
                    </div>
                </li>
            </c:if>
        </ul>
    </div>
    
</div>


  
    <div class="carousel1">
		<div class ="maintext">
		<h2 class="maintitle">오픈예정</h2>
		</div>
		    <div class="slide-wrapper">
		        <ul class="slides">
		        <c:if test="${not empty opendsearchlist}">
			          <c:forEach var="opend" items="${opendsearchlist}">
			            <li>
			              <div class="slides-href">
			              <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
					      <div class="slides-title">${opend.title}</div>
					      <div class="slides-info">주소:${opend.address}<br>기간: ${opend.start_date} ~ ${opend.end_date}</div>
					      </div>
			           </li>
			          </c:forEach>
		         </c:if>
		         <c:if test="${empty opendsearchlist}">
	                <li>
	                    <div class="slides-href">
	                        <div class="nodata">데이터가 없습니다.</div>
	                    </div>
	                </li>
                </c:if>
		        </ul>
		    </div>
	    
	</div>
	
	<div class="carousel1">
		<div class ="maintext">
		<h2 class="maintitle">종료</h2>
		</div>
		    <div class="slide-wrapper">
		        <ul class="slides">
		        <c:if test="${not empty closesearchlist}">
			          <c:forEach var="close" items="${closesearchlist}">
			            <li>
			              <div class="slides-href">
			              <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
					      <div class="slides-title">${close.title}</div>
					      <div class="slides-info">주소:${close.address}<br>기간: ${close.start_date} ~ ${close.end_date}</div>
					      </div>
			           </li>
			          </c:forEach>
		          </c:if>
		          <c:if test="${empty closesearchlist}">
	                <li>
	                    <div class="slides-href">
	                        <div class="nodata">데이터가 없습니다.</div>
	                    </div>
	                </li>
	              </c:if>
		          
		        </ul>
		    </div>
	    
	</div>
	
 </div>
 </div>
</body>
<%@include file="/WEB-INF/include/footer.jsp" %>
<script>
//지역,연령대 필터링
$(function() {
    $('.regionfilter, .agefilter,.mainfilter').on('change', function() {
        let region = $('.regionfilter').val();
        let age = $('.agefilter').val();
        let date = $('.mainfilter').val();

        $.ajax({
            url: '/Users/Regionfilter',
            type: 'GET',
            data: { region: region, age: age,date:date }
        })
        .done(function(data) {
            console.log(data); // 응답 확인
            alert('성공');
            $('.container').html(""); // 기존 내용 비우기
            let html = "";

            // filterlist가 존재하고 배열인지 확인
            if (data.filterlist && Array.isArray(data.filterlist)) {
            	if (data.filterlist.length > 0) {
	                data.filterlist.forEach(function(a) {
	                    html += "<div class='card'>" +
	                                "<img src='/images/main/popup1.png' alt='/images/main/popup1.png'>" +
	                                "<div class='title'>" + a.title + "</div>" +
	                                "<div class='info'>주소: " + a.address + "<br>기간: " + a.start_date + " ~ " + a.end_date + "</div>" +
	                             "</div>";
                });
            } else {
                html = "<div>데이터가 없습니다.</div>"; // 데이터가 없을 때 메시지
            }
           }

            $('.container').append(html); // 생성된 HTML 추가
        })
        .fail(function(err) {
            console.log(err);
            alert('오류 : ' + err.responseText);
        });
    });
});
</script>

</html>