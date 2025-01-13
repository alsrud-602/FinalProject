<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop corn</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet"  href="/css/popupdetail.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a9gjf918ri"></script>
<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>

</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<div class="container">
  <img id="icon_back" src="/images/icon/back.png" alt="뒤로가기">
  <main>
  
    <div class="swiper-container">
  <div class="swiper-wrapper">
    <div class="swiper-slide"><img src="/images/example/exampleimg1.png" alt="1"></div>
    <div class="swiper-slide"><img src="/images/example/exampleimg2.png" alt="2"></div>
    <div class="swiper-slide"><img src="/images/example/exampleimg3.png" alt="3"></div>
    <div class="swiper-slide"><img src="/images/example/exampleimg4.png" alt="4"></div>
    <div class="swiper-slide"><img src="/images/example/exampleimg5.png" alt="5"></div>
  </div>
  <!-- Navigation buttons -->
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>
</div>
    
    <div class='title'>
   
      <div class="title_header"> 
        <div class="title_category">잡화 > 스포츠 > 2030대</div> 
        <div class="title_icon">
          <img src="/images/icon/heart.png"><p>100</p>&nbsp;
          <img src="/images/icon/eye1.png"><p>100</p>&nbsp;
          <img src="/images/icon/degree.png"><p>90%</p>
        </div>
      </div>
      <p class="title_name">스텐리 1943 기념 팝업스토어</p>
      <p class="title_subname"> 드디어 상륙! 스탠리와 메시의 콜라보 팝업스토어가 떴다!</p>
      <div class="title_adress">
        <img src="/images/icon/map1.png">&nbsp;<p>서울 성동구 성수이로 134-2</p>&nbsp;&nbsp;<p>|</p>&nbsp;&nbsp;
        <img src="/images/icon/store.png">&nbsp;<p>스텐리</p>
      </div>
      <div class="title_footer">
      <div class="tags">
      <div class="tag_option">스텐리</div> <div class="tag_option">포토부스</div>
      </div>
      <div class="title_click" >
       <div class="bookmark"><img src="/images/icon/star.png"><p>찜하기</p></div>&nbsp;
       <div class="share" onclick="clipboard()" ><img src="/images/icon/share1.png"><p>공유하기</p></div>&nbsp;
      </div>
      </div>
    
    </div>
    
    <div class="guide_line">
      <p>사전예약제로 운영되는 팝업입니다. 일정을 예약후 방문해주세요.</p>
    </div>
    
    <div class="date_line">
    <div class="deadline"><p>종료까지</p><p>D-22</p></div>
    <div class="dateo"><p>팝업기간</p><p>2024 .12 .20  ~ 2024.12.31</p></div>
    <button id="reserveBtn" class="btn_booking">예약하기</button>    
    </div>
    
    <div class="menu_main">
      <div onclick="moveInfo()">팝업정보</div>
      <div onclick="moveReiview()">리뷰</div>
      <div onclick="moveMap()">위치</div>
    </div>
    
    <div id="contents">  
    <div class="content">
    <div class="content_title"><img  src="/images/icon/speaker.png" ><p>팝업스토어 소개</p></div>
    <p class="content_detail">메시 X  스탠리 1913 컬렉션 출시 기념 팝업 open!
		합업에서 확인할 수 있는 메시X스탠리 1913 컬렉션을 직접 즐겨보세요
		
		다양한 프로그램과 함께 스토리로 공개되는 깜짝 게릴라 이벤트도 있으니 방문하셔서 스탠리와 메시의 
		특별한 한정판을 직접 눈으로 확인해 보세요!!
		 step1 각인 이벤트
		팝업에서 구매하신 제품에 나만의 문구로 특별한 각인을 해드립니다
		
		step2 게릴라 이벤트
		성수동 일대에서 staff를 만나 게임에 참여하시면 선물을 드립니다</p>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/clock.png" ><p>운영시간</p></div>
    <p class="content_detail">11:00 - 12:00 </p>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/check.png" ><p>팝업환경</p></div>
    <div class="content_sit">
      <div><img src="/images/icon/driver.png"><p>주차금지</p></div>
      <div><img src="/images/icon/fare.png"><p>임장료 무료</p></div>    
    </div>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/box.png" ><p>굿즈 특이사항</p></div>
    <p class="content_detail">
    메시x스텐리 한정판 텀블러 :  200개
    스탠리 1913 다이어리 :300개   </p>
  </div>        
  <p class="sub_detail">현장상황에 따라 재고가 변동 혹은  수량의 오차가 있을 수 있습니다</p>
  <div class="link">
  <a class="btn1" href="#">홈페이지 바로가기</a><a class="btn1" href="#">SNS 바로가기</a>
  </div>
  






    
  </div> <!-- contents -->
	
  </main>
  
  <aside>
  <div class="side-layout">
  <p>김방글 님</p>
  <div class="side_box">200 팝콘</div>
  <div class="side_box">내가 쓴 리뷰수 3개</div>
  <hr>
  <div class="atag_div"><a class="btn2" href="/Review/WriteForm">후기 작성하기</a></div>
  </div>
  </aside>

</div>

<!-- 모달 배경 -->
<div id="modalBg" class="modal-bg">
    <!-- 모달 창 -->
    <div id="reserveModal" class="modal">
    <div class="modal_layout_header">
       <h2>예약 시간 선택</h2>
       <img id="btnClose" src="/images/icon/delete.png" alt="삭제">
    </div>
       <div>
         <label for="calendar-container">날짜 선택</label>
         <div id="calendar-container">

        </div>
      </div>

      <div id="timeAndPeople">
    <!-- 시간대와 인원수 선택이 동적으로 추가됩니다 -->
      </div>
      <div class="modal_layout_confirm" >
      <button id="btnConfirm">예약하기</button>
       </div>
    </div>
</div>



<script src="/js/popup_info.js" defer></script>
<script>


const infoPage = `<div class="content">
    <div class="content_title"><img  src="/images/icon/speaker.png" ><p>팝업스토어 소개</p></div>
    <p class="content_detail">메시 X  스탠리 1913 컬렉션 출시 기념 팝업 open!
		합업에서 확인할 수 있는 메시X스탠리 1913 컬렉션을 직접 즐겨보세요
		
		다양한 프로그램과 함께 스토리로 공개되는 깜짝 게릴라 이벤트도 있으니 방문하셔서 스탠리와 메시의 
		특별한 한정판을 직접 눈으로 확인해 보세요!!
		 step1 각인 이벤트
		팝업에서 구매하신 제품에 나만의 문구로 특별한 각인을 해드립니다
		
		step2 게릴라 이벤트
		성수동 일대에서 staff를 만나 게임에 참여하시면 선물을 드립니다</p>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/clock.png" ><p>운영시간</p></div>
    <p class="content_detail">11:00 - 12:00 </p>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/check.png" ><p>팝업환경</p></div>
    <div class="content_sit">
      <div><img src="/images/icon/driver.png"><p>주차금지</p></div>
      <div><img src="/images/icon/fare.png"><p>임장료 무료</p></div>    
    </div>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/box.png" ><p>굿즈 특이사항</p></div>
    <p class="content_detail">
    메시x스텐리 한정판 텀블러 :  200개
    스탠리 1913 다이어리 :300개   </p>
  </div>        
  <p class="sub_detail">현장상황에 따라 재고가 변동 혹은  수량의 오차가 있을 수 있습니다</p>
  <div class="link">
  <a class="btn1" href="#">홈페이지 바로가기</a><a class="btn1" href="#">SNS 바로가기</a>
  </div>`
  
  const reviewPage = ` 
	  <!-- review header-->
	  <div class="review_header">
	    <div class="review_title">
	      <p>HOT 리뷰</p><p>조회수 기반 HOT 리뷰</p>
	    </div>
	  </div>
	  
	   <!-- review body-->
	   <div class="review_body">
	     <div class="review_box" onclick="moveReviewDetail()">
	     <div class ="review_preview">
	     <img class= "review_img"src="/images/example/exampleimg6.png">     
	     <div class="review_like">
	     <img src="/images/icon/heart.png">
	     <p>100</p>
	     </div>
	     </div>
	     <div class="review_info">
	       <p>김방글 님</p>
	       <div><img src="/images/icon/eye2.png">&nbsp;100&nbsp;</div>
	     </div>
	     <div class="review_score">평점 3.5</div>
	     <div class="review_time"><div>3시간 전</div></div>
	     <div class="review_cdate">2024.12.12</div>
	     </div>       
	   </div> 
	  
	  <!-- review header-->
	    <div class="review_header">
	    <div class="review_title">
	      <p>전체 리뷰</p>
	    </div>
	  </div>
	  <div class="review_sub">
	    <p>전체리뷰수&nbsp; | &nbsp;10 &nbsp;&nbsp; 평균&nbsp; |&nbsp; 4.5</p>
	    <div class="review_filter">
	    <div id="review_slike">좋아요순</div>
	    <div id="review_sscore">평점순</div>
	    <div id="review_snew">최신순</div>
	    </div>
	   </div>
	  
	   <!-- review body-->
	<div class="review_body">
	     <div class="review_box" onclick="moveReviewDetail()">
	     <div class ="review_preview">
	     <img class= "review_img"src="/images/example/exampleimg6.png">     
	     <div class="review_like">
	     <img src="/images/icon/heart.png">
	     <p>100</p>
	     </div>
	     </div>
	     <div class="review_info">
	       <p>김방글 님</p>
	       <div><img src="/images/icon/eye2.png">&nbsp;100&nbsp;</div>
	     </div>
	     <div class="review_score">평점 3.5</div>
	     <div class="review_time"><div>3시간 전</div></div>
	     <div class="review_cdate">2024.12.12</div>
	     </div>        
	        
	   </div> 
	  `;
  
const mapPage = `
    <div class="review_header">
    <div class="review_title">
      <p>팝업스토어 위치</p>
    </div>
  </div>
  <div id="map"></div>
  <div class="content">
  <div class="content_title"><img  src="/images/icon/location.png"><p>주소</p></div>
  <p class="content_detail">서울 성북구 성수이로 231-2 </p>
</div>
<br><br><br><br>

`  

const reDetailPage = `    
<div class="review_header">
    <div class="review_title">
    <p>리뷰상세보기</p><p>유저들의 생생한 후기를 확인하세요</p>
  </div>
</div>

<div class="swiper-container2">
<div class="swiper-wrapper">
  <div class="swiper-slide ss"><img src="/images/example/exampleimg1.png" alt="1"></div>
  <div class="swiper-slide ss"><img src="/images/example/exampleimg2.png" alt="2"></div>
  <div class="swiper-slide ss"><img src="/images/example/exampleimg3.png" alt="3"></div>
  <div class="swiper-slide ss"><img src="/images/example/exampleimg4.png" alt="4"></div>
  <div class="swiper-slide ss"><img src="/images/example/exampleimg5.png" alt="5"></div>
</div>
<!-- Navigation buttons -->
<div class="swiper-button-next"></div>
<div class="swiper-button-prev"></div>
</div>


<div class="review_line">
  <div class="review_score2">
  <p>평점</p>
  <img src="/images/icon/star2.png">
  </div>
  <div class="review_nld">
  <img src="/images/icon/calender.png">&nbsp;&nbsp;&nbsp; <p>2024.12.13</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/images/icon/eye1.png"> &nbsp;&nbsp;&nbsp;<p>100</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/images/icon/heart.png">&nbsp;&nbsp;&nbsp; <p>100</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</div>

<div class="content">
  <div class="content_title"><img  src="/images/icon/msg.png" ><p>코멘트</p></div>
  <p class="content_detail">
평일 오후에는 웨이팅도 별로 없었고 굿즈 수량도 많이 남아있어서 좋았어요! 주말 보다 평일에 가세요  </p>
</div>   
<div class="sizebox"></div>
<div class="btn_line">
<a class="btn3" href="#">수정</a>
<a class="btn3" href="#">삭제</a>
<a class="btn3" href="#"  onclick="moveReviewBack(event)">돌아가기</a>
</div>
`

 function moveReviewDetail(){
	$('#contents').html('');
	$('#contents').html(reDetailPage);	
	 
var swiper2 = new Swiper('.swiper-container2', {
	 slidesPerView: 1,
	 slidesPerGroup: 1,
   navigation: {
       nextEl: '.swiper-button-next',
       prevEl: '.swiper-button-prev',
   },
   loop: true, // 무한 반복
});
	
} 
  
  function moveInfo() {
	$('#contents').html('');
  $('#contents').html(infoPage);
	
}
  
function moveReiview() {
	$('#contents').html('');
	  $('#contents').html(reviewPage);
}

function moveReviewBack(e) {
	
	 e.preventDefault();
	$('#contents').html('');
	  $('#contents').html(reviewPage);
}

function initMap() {
    // 지도 객체 생성
    map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.5665, 126.9780), // 기본 서울 위치
        zoom: 10
    });
    console.log("지도 객체 생성 완료!");
    // 위도, 경도를 직접 설정하여 지도 변경
    var coordinates = { latitude: 35.1796, longitude: 129.0756 }; // 부산광역시 연제구 중앙대로 1001의 위도, 경도

    var position = new naver.maps.LatLng(coordinates.latitude, coordinates.longitude);

    // 지도에 마커 추가
    new naver.maps.Marker({
        position: position,
        map: map
    });

    // 지도 중심을 해당 좌표로 이동
    map.setCenter(position);
    map.setZoom(14);    

}

function moveMap() {
	$('#contents').html('');
	 $('#contents').html(mapPage);
	  var map;         
      


      // 페이지 로드 후 지도 초기화
      // maps.js가 로드된 후 initMap을 호출
      //window.onload =  
    	  initMap();
          	 	 
}

//예약하기 버튼 클릭 시 모달 열기
document.getElementById('reserveBtn').addEventListener('click', function() {
    document.getElementById('modalBg').style.display = 'block';
});

// 모달 닫기 버튼
document.getElementById('btnClose').addEventListener('click', function() {
    document.getElementById('modalBg').style.display = 'none';
});


// 예약 확인 버튼 클릭 시
document.getElementById('btnConfirm').addEventListener('click', function() {
	  const selectedDate = $("#calendar").val();
    const selectedTime = document.getElementById('time').value;
    const selectedPeople = document.getElementById('people').value;

    if (!selectedDate || !selectedTime || !selectedPeople) {
        alert('모든 항목을 선택해주세요.');
    } else {
        alert(`예약이 완료되었습니다! 날짜: ${selectedDate}, 시간: ${selectedTime}, 인원수: ${selectedPeople}`);
        document.getElementById('modalBg').style.display = 'none';  // 모달 닫기
    }
});

document.addEventListener("DOMContentLoaded", function() {
    // 날짜 선택을 위한 Flatpickr 초기화
    flatpickr("#calendar-container", {
        dateFormat: "Y-m-d",     // 날짜 형식
        minDate: "2023-12-12",   // 최소 날짜
        maxDate: "2023-12-24",   // 최대 날짜
        inline: true,
        onChange: function(selectedDates, dateStr, instance) {
            // 날짜가 변경될 때마다 시간대와 인원수를 동적으로 업데이트
            updateTimeAndPeople(dateStr);
        }
    });     

    // 날짜에 따른 시간대와 인원수 선택을 업데이트하는 함수
    function updateTimeAndPeople(date) {
        // 시간대 선택 (예: 11시부터 8시까지 한 시간 간격)
        const timeOptions = getTimeOptions(date); // 날짜에 따른 시간대 옵션
        const peopleOptions = getPeopleOptions(); // 인원수 선택

        let timeSelectHtml = `<div class="modal_layout_select"><label for="timeSelect">시간 선택</label><select id="timeSelect">`;
        timeOptions.forEach(time => {
            timeSelectHtml += `<option value="${time}">\${time}</option>`;
        });
        timeSelectHtml += `</select></div>`;

        let peopleSelectHtml = `<div class="modal_layout_select"><label for="peopleSelect">인원수</label><select id="peopleSelect">`;
        peopleOptions.forEach(num => {
            peopleSelectHtml += `<option value="${num}">\${num}</option>`;
        });
        peopleSelectHtml += `</select></div>`;

        // 시간대와 인원수 선택을 업데이트
        document.getElementById("timeAndPeople").innerHTML = timeSelectHtml + peopleSelectHtml;
    }

    // 날짜에 따른 시간대 옵션 반환
    function getTimeOptions(date) {
        // 날짜에 따른 예약 가능한 시간대를 다르게 설정할 수 있음
        if (date === "2023-12-12") {
            return ["11:00", "12:00", "13:00", "14:00"];
        } else if (date === "2023-12-13") {
            return ["14:00", "15:00", "16:00", "17:00"];
        } else {
            return ["11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"];
        }
    }

    // 인원수 선택 옵션 (1 ~ 10명)
    function getPeopleOptions() {
        let options = [];
        for (let i = 1; i <= 10; i++) {
            options.push(i);
        }
        return options;
    }
});

</script>

    <script>
      
    </script>
</body>


</html>









