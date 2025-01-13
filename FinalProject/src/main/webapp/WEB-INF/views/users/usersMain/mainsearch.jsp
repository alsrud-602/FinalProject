<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet"  href="/css/mainsearch-pagination.css" />
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

.no-data{
   font-size: 40px;
   padding : 30px;
   width : 500px;
   margin-left: 280px;
}
.no-data p{
 text-align: center;
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
   .container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3개씩 나열 */
    gap: 30px; /* 간격 조정 */
    padding: 30px;
    justify-items: center; /* 카드 가운데 정렬 */
    max-width: 1100px;
  }

  .card {
    background-color: #121212; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 15px; /* 패딩 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: white;
    width: 100%; /* 카드 폭을 컨테이너에 맞춤 */
    max-width: 400px; /* 최대 너비 설정 */
    max-height: 450px; /* 최대 너비 설정 */
  }

  .card img {
    width: 100%; /* 카드 크기에 맞춤 */
    max-width: 300px; /* 최대 너비를 400px로 설정 */
    max-height: 300px; /* 최대 너비 설정 */
    height: auto; /* 비율 유지 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
}

  .title {
    font-size: 36px; /* 제목 크기 */
    margin: 10px 0; /* 여백 */
    color: white;
    font-family:'Pretendard';
    background: #121212;
  }

  .info {
    font-size: 16px; /* 정보 크기 */
    color: white; /* 정보 색상 */

    
    }
/*--------------------------------------*/
 .slide-wrapper {
     position: relative;
     width: 1470px;
     margin: 0 auto;
     height: 440px;
     overflow: hidden;
     }
        
  .slides {
     position: absolute;
     left: 0; top: 0;
     width: 1000px;
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

.slides-title
{
    bottom: 10px;
    font-size : 30px; 
    left: 10px;
    color: white;
    padding: 5px;
    border-radius: 5px;
    background: #121212; 
    max-width: 350px;
    max-height: 55px;
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    text-align: center;
}

.slides-info {
    bottom: 10px; 
    left: 10px;
    color: white;
    padding: 5px;
    border-radius: 5px;
    background: #121212; 
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    text-align: center;
}
</style>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
 <main>
	<div>
		<div class="search-container">
	        <input type="text" class="search-input">
	        <button class="search-button" type="submit">
	            <img class="imgsearch" src="/images/main/search.png" alt="검색">
	        </button>
	    </div>
	    
	    
		  
	 <div style="display:flex; flex-direction: column; justify-content: center; align-items: center;  margin-top:100px; "class="table-container";">
	 
<div class="searchcontainer">
	    <div class="carousel1">
		    <div class="maintext">
		        <h2 class="maintitle">진행중</h2>
		    </div>
		    <div class="container">
		        <c:if test="${empty ongoingsearchlist}">
		            <div class="no-data"><p>진행중인 팝업이 없습니다.</p></div>
		        </c:if>
		        <c:forEach var="ongoing" items="${ongoingsearchlist}">
		            <a href="/Users/Info?store_idx=${ongoing.store_idx}">
		                <div class="card">
		                    <img src="/image/read?path=${ongoing.image_path}" alt="Store Image">
		                    <div class="title">${ongoing.title}</div>
		                    <div class="info">주소:${ongoing.address}<br>기간: ${ongoing.start_date} ~ ${ongoing.end_date}</div>
		                </div>
		            </a>
		        </c:forEach>
		    </div>
		</div>
		
		<div class="carousel1">
		    <div class="maintext">
		        <h2 class="maintitle">오픈예정</h2>
		    </div>
		    <div class="container">
		        <c:if test="${empty opendsearchlist}">
		            <div class="no-data"><p>오픈예정인 없습니다.</p></div>
		        </c:if>
		        <c:forEach var="opend" items="${opendsearchlist}">
		            <a href="/Users/Info?store_idx=${opend.store_idx}">
		                <div class="card">
		                    <img src="/image/read?path=${opend.image_path}" alt="Store Image">
		                    <div class="title">${opend.title}</div>
		                    <div class="info">주소:${opend.address}<br>기간: ${opend.start_date} ~ ${opend.end_date}</div>
		                </div>
		            </a>
		        </c:forEach>
		    </div>
		</div>
		
		<div class="carousel1">
		    <div class="maintext">
		        <h2 class="maintitle">종료</h2>
		    </div>
		    <div class="container">
		        <c:if test="${empty closesearchlist}">
		            <div class="no-data"><p>데이터가 없습니다.</p></div>
		        </c:if>
		        <c:forEach var="close" items="${closesearchlist}">
		            <a href="/Users/Info?store_idx=${close.store_idx}">
		                <div class="card">
		                    <img src="/image/read?path=${close.image_path}" alt="Store Image">
		                    <div class="title">${close.title}</div>
		                    <div class="info">주소:${close.address}<br>기간: ${close.start_date} ~ ${close.end_date}</div>
		                </div>
		            </a>
		        </c:forEach>
		    </div>
		</div>
</div>	
		
		<%@include file="/WEB-INF/include/mainsearch-pagination.jsp" %>
	 </div>
  </main>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
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
	                    html += "<a href='/Users/Info?store_idx=" + a.store_idx + "'>" +
	                    	    "<div class='card'>" +
	                                "<img src='/images/main/popup1.png' alt='/images/main/popup1.png'>" +
	                                "<div class='title'>" + a.title + "</div>" +
	                                "<div class='info'>주소: " + a.address + "<br>기간: " + a.start_date + " ~ " + a.end_date + "</div>" +
	                             "</div>"+
	                             "</a>";
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
<script>
//검색창 클릭했을때 
$(function (){
    // 클릭 이벤트
    $('.imgsearch').on('click', function(e) {
        e.preventDefault(); // 기본 동작 방지 (버튼 클릭 시 페이지 이동 방지)
        performSearch();
    });

    // 엔터 키 입력 이벤트
    $('.search-input').on('keydown', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault(); // 기본 동작 방지 (엔터 키에 의한 폼 제출 방지)
            performSearch();
        }
    });

    // 검색 수행 함수
    function performSearch() {
        let search = $('.search-input').val().trim(); // 입력값의 앞뒤 공백 제거

        // 입력값이 비어있지 않을 경우에만 AJAX 요청 수행
        if (search) {
            $.ajax({
                url: '/Users/Mainsearch',
                type: 'GET',
                data: { search: search }
            })
            .done(function(data) {
                // AJAX 요청 후 페이지 이동
                window.location.href = '/Users/Mainsearch?page=1&search=' + encodeURIComponent(search);
            })
            .fail(function(err) {
                alert('오류 : ' + err.responseText);
            });
        } else {
            alert("검색어를 입력해주세요."); // 빈 입력값에 대한 안내 메시지
        }
    }
});
</script>

</html>