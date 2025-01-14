<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet"  href="/css/main-pagination.css" />
<style>

  body {
    background-color: #121212 !important;
    color: white;
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
    width: 100%;
    max-width: 1250px; /* 최대 너비 */
    margin: 0 auto; /* 중앙 정렬 */
}

.search-input {
    width: 100%;
    padding: 15px 50px 15px 20px; /* 패딩 */
    border: 2px solid #00ff84; /* 테두리 색상 */
    border-radius: 15px; /* 둥근 모서리 */
    background-color: #121212; /* 배경색 */
    color: white; /* 글자색 */
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
  /*--------------------------------------------------------------*/
/* 랭킹,오픈예정 캐러셀(이미지 슬라이드)*/
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
    height: 350px; /* 비율 유지 */
    border-radius: 10px;
}
   
   

  .carousel1 h2 {
    display: inline-block;
    margin-right: 10px; /* 제목과 버튼 사이의 간격 조절 */
}

  .view-all {
    display: inline;
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    color: #00ff84;
}
    
  .maintitle {
    font-size: 48px; /* 폰트 크기 */
    font-family:'Pretendard';
    display: inline-block; /* 인라인 블록으로 설정 */
}
 .maintext{
    max-width: 300px;
    position: relative;
    width: 100%;
    margin: 0 auto;
}

.slides-href{
  width: 350px;
  height: 440px;
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
}

/*------------------------------------------------------------------*/
  /*진행중 팝업*/
   .container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3개씩 나열 */
    gap: 30px; /* 간격 조정 */
    padding: 30px;
    justify-items: center; /* 카드 가운데 정렬 */
  }

  .card {
    background-color: #121212; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 15px; /* 패딩 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: white;
    width: 100%; /* 카드 폭을 컨테이너에 맞춤 */
    max-width: 535px; /* 최대 너비 설정 */
    display: flex; /* Flexbox 활성화 */
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
}

.card img {
    width: 100%; /* 카드 크기에 맞춤 */
    max-width: 300px; /* 최대 너비를 300px로 설정 */
    height: auto; /* 비율 유지 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
    object-fit: contain; /* 비율 유지하며 크기 조정 */
}

  .title {
    font-size: 36px; /* 제목 크기 */
    margin: 10px 0; /* 여백 */
    color: white;
    font-family:'Pretendard';
    background: #121212;overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 글자에 ... 표시 */
  }

  .info {
    font-size: 16px; /* 정보 크기 */
    color: white; /* 정보 색상 */
    overflow: hidden; /* 넘치는 글자 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
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
    font-size:20px;
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
    font-size:20px;
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
    font-size:20px;
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
    }
    
    .nodata{
      font-size: 40px;
      padding : 30px;
      width: 600px;
      margin-left: 500px;
    }
    
    
    
 
  /*--------------------------------------------------------------*/
  /*부트스트랩 캐러셀(이미지 슬라이드)*/
.swiper-container {
    margin-bottom: 30px;
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    max-width: 1200px; /* 최대 너비 제한 */
    height: 700px; /* 높이를 컨텐츠에 맞게 자동 조정 */
    overflow: hidden; /* 넘치는 컨텐츠 숨김 */
    position: relative; /* 내부 요소 위치를 조정 가능 */
    margin: 0 auto; /* 중앙 정렬 */
}

/* Swiper-slide 스타일 수정 */
.swiper-slide {
    display: flex;
    justify-content: center; /* 슬라이드 컨텐츠를 수평 가운데 정렬 */
    align-items: center; /* 슬라이드 컨텐츠를 수직 가운데 정렬 */
    width: 100%; /* 부모 요소에 맞춤 */
    height: auto; /* 비율 유지 */
    box-sizing: border-box; /* padding 포함한 크기 계산 */
    padding: 10px; /* 간격 추가 */
}

/* Swiper-slide 이미지 스타일 */
.swiper-slide img {
    max-width: 100%; /* 이미지 너비 제한 */
    height: auto; /* 비율 유지하며 크기 조정 */
    border-radius: 10px; /* 둥근 모서리 */
    object-fit: cover; /* 이미지가 공간에 맞게 조정 */
}

/* Swiper-controls 스타일 */
.swiper-controls {
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
.swiper-button-prev,
.swiper-button-next {
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    color: #fff; /* 버튼 색상 */
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    position: absolute;
    z-index: 20;
    width: 60px;
    height: 60px;
    border-radius: 50%; /* 동그란 모양 */
    font-size: 18px;
}

/* 이전 버튼 위치 */
.swiper-button-prev {
    left: 10px;
}

/* 다음 버튼 위치 */
.swiper-button-next {
    right: 10px;
}

/* 페이지네이션 스타일 */
.swiper-pagination {
    position: absolute;
    bottom: 10px; /* 슬라이드 하단에 위치 */
    transform: translate(45%, 330px);
    display: flex;
    gap: 8px; /* 점 사이 간격 */
    z-index: 1000; /* 버튼 위에 표시되도록 설정 */
}

/* 페이지네이션 점 스타일 */
.swiper-pagination .swiper-pagination-bullet {
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
    top: 70px; /* 원하는 위치에 맞게 조정 */
    left: calc(50% - 825px); /* 왼쪽으로 100px 이동 (1000px의 절반 만큼) */
    transform: translateX(0); /* 중앙 정렬 보정 제거 */
    width: 1000px;
    height: 100px;
}
  
  
</style>
</head>
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
         <div class ="maintext">
          <h2 class="maintitle">랭킹</h2>
          <a href="/Users/Rankdetail"class="view-all" >전체보기 ☞</a>
          </div>
          <div class="slide-wrapper">
              <ul class="slides">
                  <c:forEach var="rank" items="${ranklist}">
                  <li>
                <a href="/Users/Info?store_idx=${rank.store_idx}">
                   <div class="slides-href">
                        <img src="/image/read?path=${rank.image_path}" alt="Store Image" >
                        <div class="slides-title">${rank.title}</div>
                        <div class="slides-info">주소: ${rank.address}</div>
                   </div>
                   </a>
               </li>
                </c:forEach>
              </ul>
          </div>
          <p class="controls">
              <span class="prev">이전</span>
              <span class="next">다음</span>
          </p>
      </div>
   
      <div class="carousel1">
      <div class ="maintext">
      <h2 class="maintitle">오픈예정</h2>
      <a href="/Users/Opendetail" class="view-all">전체보기 ☞</a>
      </div>
          <div class="slide-wrapper">
              <ul class="slides">
                <c:forEach var="opend" items="${opendpopuplist}">
                  <li>
                       <div class="slides-href">
                    <a href="/Users/Info?store_idx=${opend.store_idx}">
                          <img src="/image/read?path=${opend.image_path}" alt="Store Image" >
                        <div class="slides-title">${opend.title}</div>
                        <div class="slides-info">주소:${opend.address}</div>
                 </a>
                     </div>
                 </li>
                </c:forEach>
              </ul>
          </div>
          <p class="controls">
              <span class="prev">이전</span>
              <span class="next">다음</span>
          </p>
      </div>
   
      <div class="carousel1">
        <div class ="maintext">
        <h2 class="maintitle">진행중</h2>
        <a href="/Users/Ongoingdetail"class="view-all">전체보기 ☞</a>
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
         <a href="/Users/Info?store_idx=${popup.store_idx}">      
             <div class="card">
                  <img src="/image/read?path=${popup.image_path}" alt="Store Image" >
                  <div class="title">${popup.title}</div>
                  <div class="info">주소:${popup.address}<br>기간: ${popup.start_date} ~ ${popup.end_date}</div>
             </div>
          </a>
          </c:forEach>
        </div>
        <%@include file="/WEB-INF/include/main-pagination.jsp" %>
        
      </div>
   </div>
  </main>
 <%@include file="/WEB-INF/include/footer.jsp" %>

</body>
<script>
const swiper = new Swiper('.swiper-container', {
    slidesPerView: 2, // 한 번에 보여줄 슬라이드 수
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

    const carousels = document.querySelectorAll('.carousel1');

    carousels.forEach(carousel => {
        const slides = carousel.querySelector('.slides');
        const slide = carousel.querySelectorAll('.slides li');
        let currentIdx = 0;
        const slideCount = slide.length;
        const prevBtn = carousel.querySelector('.prev');
        const nextBtn = carousel.querySelector('.next');
        const slideWidth = 350;
        const slideMargin = 5;

        slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';

        function moveSlide(num) {
            slides.style.left = -num * (slideWidth + slideMargin) + 'px';
            currentIdx = num;
        }

        nextBtn.addEventListener('click', function() {
            if (currentIdx < slideCount - 5) {
                moveSlide(currentIdx + 1);
            } else {
                moveSlide(0);
            }
        });

        prevBtn.addEventListener('click', function() {
            if (currentIdx > 0) {
                moveSlide(currentIdx - 1);
            } else {
                moveSlide(slideCount - 5);
            }
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
/*
//팝업스토어 클릭했을때

$(function(){
   $('.slides-href').on('click',function(){
      window.location.href = '/Users/Info';
   })
})*/


// 지역,연령대,날짜 필터링
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

</html>
