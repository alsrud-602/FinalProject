<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>POPCORN에서 팝업스토어 현황을 알아보세요!</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<!-- Swiper CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet"  href="/css/main-pagination.css" />
<link rel="stylesheet"  href="/css/mobile-common.css" />
<style>

  body {
    background-color: #121212 !important;
    color: white;
    max-width: 100%; /* body의 최대 너비를 100%로 설정 */
  }
.logo-container{
    display: block; /* 블록 요소로 설정하여 중앙 정렬 가능 */
 margin: 0 auto 0; /* 좌우 여백을 자동으로 설정하여 중앙 정렬 */

}
.logo {
   width: 200px;
    height: auto;
    margin-bottom: 10px; /* 하단 여백 */
}
.gradient-line {
    width: 100%; /* 선의 너비를 조정 */
    height: 2px; /* 선의 두께 */
        background: linear-gradient(to right,
        #00ff84, /* 초록색 */
        #00ccff, /* 파란색 */
        #ffff00, /* 노란색 */
        #ffcc00, /* 황금색 */
        #66ff66  /* 연한 초록색 */
    );
    margin-top: -5px; /* 로고와 선 사이의 간격 조정 */
    margin-bottom: 5px;
}

  li { list-style: none;
  }
  h2 {text-align : center;
      padding-top : 25px;
      }
  a  {text-align : center;
      color: #00ff84;
  }

  /*--------------------------------------------------------------*/
  /*검색창*/
.search-container {
    position: relative;
    margin: 0 auto 10px auto; /* 중앙 정렬 */
}

.search-input {
    width: 100%;
    padding: 15px 10px 15px 10px; /* 패딩 */
    border: 2px solid #00ff84; /* 테두리 색상 */
    border-radius: 15px; /* 둥근 모서리 */
    background-color: #121212; /* 배경색 */
    color: white; /* 글자색 */
    font-size: 80px;
}


.search-button {
    position: absolute;
    right: 10px; /* 오른쪽 여백 조정 */
    top: 50%;
    transform: translateY(-50%);
    background: transparent; /* 투명 배경 */
    border: none; /* 테두리 없음 */
    cursor: pointer; /* 포인터 커서 */
}

.search-button img {
    height: 40px; /* 아이콘 크기 */
    width: auto;
}
  /*--------------------------------------------------------------*/
/* 랭킹,오픈예정 캐러셀(이미지 슬라이드)*/
  ul > .slide-wrapper {
     overflow: hidden;
     }

  ul > .swiper-wrapper slides {
    margin: 0;
    display: flex;
   transition: transform 0.3s ease; /* 부드러운 이동 효과 */
   list-style: none;
   }


   .controls {
     text-align: center;
     margin-top: 25px;
     font-size: 10px;
   }

   .controls span {
      background: #333;
      color: #fff;
      cursor: pointer;
   }

   .slides img {
    height: auto; /* 비율 유지 */
    border-radius: 10px;
}

   .carousel1 {
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
    font-size: 25px; /* 폰트 크기 */
    font-family: 'Pretendard';
    margin-left: 80px; /* view-all과의 간격 조정 */
    text-align: center;
}

.view-all {
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    color: #00ff84;
    font-size: 15px; /* 폰트 크기 */
    padding-top: 20px;
}
.swiper-slide{
  height: 100%;
}
.slides-href{
  width: 290px;
}
.slides-title
{
    bottom: 10px;
    font-size : 25px;
    left: 10px;
    color: white;
    padding: 5px;
    border-radius: 5px;
    background: #121212;
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
}

.slides-info {
    left: 10px;
    color: white;
    border-radius: 5px;
    background: #121212;
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    font-size:18px;
}

/*------------------------------------------------------------------*/
  /*진행중 팝업*/
   .container {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 2개씩 나열 */
        grid-row-gap: 0; /* 행 간 여백 제거 */
    grid-column-gap: 5px; /* 열 간 여백 설정 */
}

.container a {
width:170px;
}

  .card {
    background-color: #121212; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 15px; /* 패딩 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: white;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
    width: 170px;
}

.card img {
width:170px;
    height: auto; /* 비율 유지 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
}

  .title {
    font-size: 25px; /* 제목 크기 */
    margin: 10px 0; /* 여백 */
    color: white;
    font-family:'Pretendard';
    background: #121212;
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    width:150px;
  }

  .info {
    font-size: 20px; /* 정보 크기 */
    color: white; /* 정보 색상 */
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
    width:150px;
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
    padding-left:20px;
    padding-right:20px;
    position: relative;
    width: 100%;
    }

  .regionfilter{
    cursor: pointer;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 13px;
    position: relative;
    width: 100%;
    }
    .agefilter{
    cursor: pointer;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 13px;
    position: relative;
    width: 100%;
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
    width: 100%;
    }

    .resetbutton{
      background: #121212;
      color:white;
      padding: 10px;
      border: none;
      border: 2px solid #00ff84;
      border-radius: 10px;
      width: 100%;
    }




  /*--------------------------------------------------------------*/
  /*부트스트랩 캐러셀(이미지 슬라이드)*/
.swiper-container {
    margin-bottom: 15px;
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    overflow: hidden; /* 넘치는 컨텐츠 숨김 */
    position: relative; /* 내부 요소 위치를 조정 가능 */
    margin: 0 auto; /* 중앙 정렬 */
    height: 350px;
}

/* Swiper-slide 스타일 수정 */
div > .swiper-slide {
    display: flex;
    justify-content: center; /* 슬라이드 컨텐츠를 수평 가운데 정렬 */
    align-items: center; /* 슬라이드 컨텐츠를 수직 가운데 정렬 */
    width: 100%; /* 부모 요소에 맞춤 */
    height: auto; /* 비율 유지 */
    box-sizing: border-box; /* padding 포함한 크기 계산 */
    padding: 10px; /* 간격 추가 */
}

/* Swiper-slide 이미지 스타일 */
div > .swiper-slide img {
    height: auto; /* 비율 유지하며 크기 조정 */
    width: 330px;
    border-radius: 10px; /* 둥근 모서리 */
}

/* Swiper-controls 스타일 */
div > .swiper-controls {
    display: flex;
    justify-content: space-between; /* 버튼을 양쪽 끝으로 배치 */
    align-items: center;
    width: 100%;
    position: absolute; /* 슬라이드 위에 겹쳐 배치 */
    top: 50%; /* 슬라이드 가운데에 위치 */
    transform: translateY(-50%); /* 수직 정렬 */
    z-index: 10; /* 슬라이드 위에 표시되도록 설정 */
}

/* 버튼 스타일 */
div > .swiper-button-prev,
div > .swiper-button-next {
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    color: #fff; /* 버튼 색상 */
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    position: absolute;
    z-index: 20;
    width: 50px;
    height: 50px;
    border-radius: 50%; /* 동그란 모양 */
    font-size: 5px;
}

/* 이전 버튼 위치 */
div > .swiper-button-prev {
    left: 10px;
}

/* 다음 버튼 위치 */
div > .swiper-button-next {
    right: 10px;
}

/* 페이지네이션 스타일 */
div > .swiper-pagination {
    position: absolute;
    bottom: 10px; /* 슬라이드 하단에 위치 */
    transform: translate(43%, 180px);
    display: flex;
    gap: 8px; /* 점 사이 간격 */
    z-index: 1000; /* 버튼 위에 표시되도록 설정 */
}

/* 페이지네이션 점 스타일 */
div > .swiper-pagination .swiper-pagination-bullet {
    width: 10px;
    height: 10px;
    background-color: rgba(0, 255, 132, 0.7); /* 점 색상 */
    border-radius: 50%; /* 동그란 모양 */
    cursor: pointer;
    transition: background-color 0.3s ease; /* 색상 변화 애니메이션 */
}

/* 활성화된 점 스타일 */
.swiper-pagination .swiper-pagination-bullet-active {
    background-color: rgba(255, 255, 255, 0.9); /* 활성화된 점 색상 */
}

.ongoingfilter {
    position: relative; /* 요소를 고정 */
    font-size: 18px;
    display: flex; /* 슬라이드들을 가로로 나열 */
    height: auto;
        flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
}
.main-pagination{
font-size:15px;
display: flex;
}
.main-pagination a{
display: flex;
margin-right: 10px;
color: white;
}
.ca-image{
width:300px;
height: 300px;
}
 /* 미디어 쿼리 */
  @media (max-width: 360px) {
    .search-input {
      font-size: 20px; /* 폰트 크기 조정 */
      height: 50px; /* 높이 조정 */
    }

    li .swiper-slide img {
      width: 300px; /* 이미지 너비를 100%로 조정 */
      height: auto; /* 비율 유지 */
    }

    .swiper-slide {
    }

    .ongoingfilter {
      flex-direction: column; /* 세로 방향으로 정렬 */
      align-items: center; /* 수평 중앙 정렬 */
    }

    .ongoingfilter > select {
      width: 90%; /* 선택 박스 너비 조정 */
      margin: 5px 0; /* 여백 조정 */
    }

  }

</style>
</head>
<body>
 <main>
	<div>
	<a href="/Mobile/Users/Main" class="logo-container"><img class="logo" src="/images/header/logo.png" alt="로고" /></a>
	    <div class="gradient-line"></div>
	<div class="swiper-container">
	    <div class="swiper-wrapper">
	        <c:forEach var="banner" items="${banners}" varStatus="status">
	            <div class="swiper-slide">
	        <a href="/Users/Info?store_idx=${banner.store_idx}">
	                <img src="/image/read?path=${fn:replace(banner.image_path, '\\', '/')}"
	                     alt="${banner.image_path}">
	            </a>
	            </div>
	        </c:forEach>
	    </div>
	    <div class="swiper-controls">
	        <div class="swiper-button-prev"></div>
	        <div class="swiper-button-next"></div>
	        <div class="swiper-pagination"></div>
	    </div>
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
                        <img src="/image/read?path=${rank.image_path}" alt="Store Image" class="ca-image" >
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
                          <img src="/image/read?path=${opend.image_path}" alt="Store Image" class="ca-image">
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
                  <img src="/image/read?path=${popup.image_path}" alt="Store Image" >
                  <div class="title">${popup.title}</div>
                  <div class="info">${popup.address}<br>${popup.start_date} ~ ${popup.end_date}</div>
             </div>
		    </a>
		    </c:forEach>
		  </div>

		</div>
	</div>
  </main>

</body>
<%@include file="/WEB-INF/include/app-navbar.jsp" %>
<script>
const swiper = new Swiper('.swiper-container', {
    slidesPerView: 1, // 한 번에 보여줄 슬라이드 수
    slidesPerGroup: 1, // 버튼 클릭 시 넘어가는 슬라이드 수
    autoplay: {
        delay: 5000, // 3초마다 전환
        disableOnInteraction: false, // 사용자가 슬라이드를 조작해도 자동 전환 유지
      },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    loop: true, // 슬라이드 반복
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
                        html +="<a href='/Mobile/Users/Info?store_idx=" + a.store_idx + "'>" +
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
           spaceBetween:100, // 슬라이드 간 간격 (px)
           grabCursor: true, // 마우스 커서 변경
           simulateTouch: true, // 터치/드래그 활성화
           freeMode: true,         // 자유롭게 드래그
           breakpoints: {
               768: {
                   slidesPerView: 2, // 화면이 좁아지면 2개 표시
                   spaceBetween: 300,
               },
               360: {
                   slidesPerView: 2, // 모바일 화면에서는 1개 표시
                   spaceBetween: 270,
               }
           }
       });
   });
</script>

</html>
