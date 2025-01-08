<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POPCORN에서 팝업스토어 현황을 알아보세요!</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link rel="stylesheet"  href="/css/admin-common.css" />
<link rel="stylesheet"  href="/css/main-pagination.css" />
<!-- Swiper CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>

  body {
    background-color: #121212 !important;
    color: white;
    width: 1400px;
  }
 

  li { list-style: none; 
  }
  h2 {text-align : center;
      padding-top : 50px;
      }
  a  {text-align : center;
      color: #00ff84;
  }

  /*--------------------------------------------------------------*/
  /*검색창*/
.search-container {
    position: relative;
    width: 1330px;
    margin: 0 auto 50px auto; /* 중앙 정렬 */
}

.search-input {
    width: 100%;
    height: 200px;
    padding: 15px 50px 15px 20px; /* 패딩 */
    border: 2px solid #00ff84; /* 테두리 색상 */
    border-radius: 15px; /* 둥근 모서리 */
    background-color: #121212; /* 배경색 */
    color: white; /* 글자색 */
    font-size: 80px;
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
    width: 120px; /* 아이콘 크기 */
    height: auto; /* 아이콘 크기 */
}
  /*--------------------------------------------------------------*/
/* 랭킹,오픈예정 캐러셀(이미지 슬라이드)*/
  .slide-wrapper {
     overflow: hidden;
     width: 100%;
     }
        
  .swiper-wrapper slides {
    left: 0;
    margin: 0;
    display: flex!important;
   transition: transform 0.3s ease; /* 부드러운 이동 효과 */
   list-style: none;
   }
   li.swiper-slide{
       width: 900px; /* 너비 400px */
    height: auto; /* 비율 유지 */
    border-radius: 10px;
   }
       
   .controls {
     text-align: center;
     margin-top: 50px;
     font-size: 65px;
   }
        
   .controls span {
      background: #333;
      color: #fff;
      cursor: pointer;
   } 
   
   .slides img {
    width: 900px; /* 너비 400px */
    height: auto; /* 비율 유지 */
    border-radius: 10px;
}
   
   .carousel1 {
    width: 100%;
    margin: 0 auto;
    overflow: hidden;
}
   

  .carousel1 h2 {
    display: inline-block;
    margin-right: 10px; /* 제목과 버튼 사이의 간격 조절 */
}

.maintext {
    position: relative;
    width: 100%;
    display: flex; /* 플렉스 박스 사용 */
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    margin-bottom: 10px;
}

.maintitle {
    font-size: 90px; /* 폰트 크기 */
    font-family: 'Pretendard';
    margin-left: 300px; /* view-all과의 간격 조정 */
}

.view-all {
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    color: #00ff84;
    font-size: 45px; /* 폰트 크기 */
    padding-top: 40px;
    padding-left: 10px;
}
.swiper-slide{
  width: 900px;
  height: 100%;
}
.slides-href{
  width: 900px;
  height: 100%;
}
.slides-title
{
    bottom: 10px;
    font-size : 70px; 
    left: 10px;
    color: white;
    padding: 5px;
    border-radius: 5px;
    background: #121212; 
    max-width: 900px;
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
}

.slides-info {
    bottom: 10px; 
    left: 10px;
    color: white;
    padding: 20px;
    border-radius: 5px;
    background: #121212; 
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    font-size:60px;
}

/*------------------------------------------------------------------*/
  /*진행중 팝업*/
   .container {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 2개씩 나열 */
        grid-row-gap: 0; /* 행 간 여백 제거 */
    grid-column-gap: 160px; /* 열 간 여백 설정 */
}

.container a {
        transform: translateX(-47%);
}

  .card {
      width: 100%; /* 카드 폭을 컨테이너에 맞춤 */
    max-width: 500px; /* 최대 너비 설정 */
    background-color: #121212; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 15px; /* 패딩 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: white;
    display: flex; /* Flexbox 활성화 */
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
}

.card img {
    width: 650px; /* 최대 너비를 300px로 설정 */
    height: auto; /* 비율 유지 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
}

  .title {
    font-size: 70px; /* 제목 크기 */
    margin: 10px 0; /* 여백 */
    color: white;
    font-family:'Pretendard';
    background: #121212;
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    max-width: 650px;
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
  }

  .info {
    font-size: 65px; /* 정보 크기 */
    color: white; /* 정보 색상 */
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    max-width: 650px;
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    }
  .mainfilter {    
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius: 10px;
    font-family:'Pretendard';
    border: 2px solid #00ff84;
    margin-left:21%; 
    padding-left:20px;
    padding-right:20px;  
    position: relative; 
    }
    
  .regionfilter{
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 13px;
    position: relative;
    }
    .agefilter{
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 13px;
    position: relative;
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
    
    .resetbutton{
      background: #121212;
      color:white;
      padding: 10px;
      border: none;
      border: 2px solid #00ff84;
      border-radius: 10px;
      margin-left: 10px;
      width: 100%;
    }
    
    .nodata{
      font-size: 40px;
      padding : 30px;
      width: 600px;
      margin-left: 500px;
    }
    
    
    
 
  /*--------------------------------------------------------------*/
  /*부트스트랩 캐러셀(이미지 슬라이드)*/
   
.carousel-item img {
    width: auto;  /* 너비 100% */
    height: 1400px; /* 높이 100% */
    object-fit: contain; /* 비율 유지하며 크기 조정 */
}
  .carousel-inner {
    position: relative;
  }
  .carousel-item {
    text-align: center; /* 텍스트 중앙 정렬 */
  }
  .carousel-caption {
    position: absolute; /* 캡션 위치 조정 */
    bottom: 20px; /* 아래 여백 */
    left: 50%; /* 중앙 정렬 */
    transform: translateX(-50%); /* 중앙 정렬 보정 */
  }
  .carousel-control-prev {
    left: -7% !important; /* 왼쪽 여백 조정 */}

   .carousel-control-next {
    right: -7% !important; /* 오른쪽 여백 조정 */}
   .carousel {
    margin: 20px auto; /* 중앙 정렬 */
    width: 55%; /* 너비 설정 */
  }
  
.ongoingfilter {
    position: relative; /* 요소를 고정 */
    top: 70px; /* 원하는 위치에 맞게 조정 */
    left: calc(50% - 1050px); /* 왼쪽으로 100px 이동 (1000px의 절반 만큼) */
    transform: translateX(0); /* 중앙 정렬 보정 제거 */
    font-size: 65px;
    display: flex; /* 슬라이드들을 가로로 나열 */
    height: auto;
    width: 1700px;
    margin-bottom: 100px; /* 아래쪽 여백 추가 */
}
.ongoingfilter > select > option{
    font-size: 65px;
}
@media (max-width: 780px) {
  body {
    font-size: 16px; /* 기본 폰트 크기 증가 */
  }
}
.main-pagination{
font-size:60px;
display: flex;
}
.main-pagination a{
display: flex;
margin-right: 50px;
color: white;
}

</style>
</head>
<body>
 <main>
	<div>
	   <div class="search-container">
	        <input type="text" class="search-input">
	        <button class="search-button" type="submit">
	            <img class="imgsearch" src="/images/main/search.png" alt="검색">
	        </button>
	    </div>
		<div id="carouselExampleIndicators" class="carousel-slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/images/main/main-banner4.png" class="d-block w-100" alt="/images/main/main-banner4.png">
		    </div>
		    <div class="carousel-item">
		      <img src="/images/main/main-banner3.png" class="d-block w-100" alt="/images/main/main-banner3.png">
		    </div>
		    <div class="carousel-item">
		      <img src="/images/main/main-banner5.png" class="d-block w-100" alt="/images/main/main-banner5.png">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>

			<div class="carousel1">
				<div class="maintext">
					<h2 class="maintitle">랭킹</h2>
					<a href="/Mobile/Users/Rankdetail" class="view-all">전체보기 ☞</a>
				</div>
				<!-- Swiper Container -->
				<div class="swiper slide-wrapper">
					<ul class="swiper-wrapper slides">
						<c:forEach var="rank" items="${ranklist}">
							<li class="swiper-slide"><a
								href="/Mobile/Users/Info?store_idx=${rank.store_idx}">
									<div class="slides-href">
                        <img src="/image/read?path=${rank.image_path}" alt="Store Image" >
                        <div class="slides-title">${rank.title}</div>
                        <div class="slides-info">주소: ${rank.address}</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>


			<div class="carousel1">
				<div class="maintext">
					<h2 class="maintitle">오픈예정</h2>
					<a href="/Mobile/Users/Opendetail" class="view-all">전체보기 ☞</a>
				</div>
				<div class="swiper slide-wrapper">
					<ul class="swiper-wrapper slides">
						<c:forEach var="opend" items="${opendpopuplist}">
							<li class="swiper-slide">
							<a href="/Mobile/Users/Info?store_idx=${opend.store_idx}">
									<div class="slides-href">
                          <img src="/image/read?path=${opend.image_path}" alt="Store Image" >
                        <div class="slides-title">${opend.title}</div>
                        <div class="slides-info">주소:${opend.address}</div>
									</div>
							</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="carousel1">
		  <div class ="maintext">
		  <h2 class="maintitle">진행중</h2>
		  <a href="/Mobile/Users/Ongoingdetail"class="view-all">전체보기 ☞</a>
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
		    <button type="reset" onclick='window.location.reload()' class="resetbutton">※초기화</button>
		  </div>
		  
		  <div class="container">
		   <c:forEach var="popup" items="${popuplist}">
		   <a href="/Mobile/Users/Info?store_idx=${popup.store_idx}">	   
			    <div class="card">
				      <img src="/images/main/popup1.png" alt="/images/main/popup1.png">
				      <div class="title">${popup.title}</div>
				      <div class="info">${popup.address}<br>${popup.start_date} ~ ${popup.end_date}</div>
			    </div>
		    </a>
		    </c:forEach>
		  </div>
		  <%@include file="/WEB-INF/include/main-pagination.jsp" %>
		  
		</div>
	</div>
  </main>

</body>
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


//지역,연령대,날짜 필터링
$(function() {
    $('.regionfilter, .agefilter, .mainfilter').on('change', function() {
        let region = $('.regionfilter').val();
        let age = $('.agefilter').val();
        let date = $('.mainfilter').val();

        $.ajax({
            url: '/Users/Regionfilter',
            type: 'GET',
            data: { region: region, age: age, date: date }
        })
        .done(function(data) {
            console.log(data); // 응답 확인
            $('.container').html(""); // 기존 내용 비우기
            let html = "";

            // filterlist가 존재하고 배열인지 확인
            if (data.filterlist && Array.isArray(data.filterlist)) {
                if (data.filterlist.length > 0) { // filterlist가 비어있지 않으면
                    data.filterlist.forEach(function(a) {
                        html +="<a href='/Users/Info?store_idx=" + a.store_idx + "'>" + 
                              "<div class='card'>" +
                                    "<img src='/image/read?path="+a.image_path+"' alt='Store Image' >"+
                                    "<div class='title'>" + a.title + "</div>" +
                                    "<div class='info'>주소: " + a.address + "<br>기간: " + a.start_date + " ~ " + a.end_date + "</div>" +
                                 "</div>"+
                                 "</a>"; 
                    });
                } else {
                    html = "<div class='nodata'>데이터가 없습니다.</div>"; // filterlist가 비어있을 때 메시지
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
   document.addEventListener("DOMContentLoaded", function () {
       const swiper = new Swiper('.slide-wrapper', {
           slidesPerView: 'auto', // 한 번에 보여줄 슬라이드 수
           spaceBetween:500, // 슬라이드 간 간격 (px)
           grabCursor: true, // 마우스 커서 변경
           simulateTouch: true, // 터치/드래그 활성화
           freeMode: true,         // 자유롭게 드래그
           breakpoints: {
               768: {
                   slidesPerView: 2, // 화면이 좁아지면 2개 표시
                   spaceBetween: 500,
               },
               480: {
                   slidesPerView: 2, // 모바일 화면에서는 1개 표시
                   spaceBetween: 500,
               }
           }
       });
   });
</script>

</html>