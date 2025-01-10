<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId="></script>
<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
#remainingDays {
    color: #00ff84; /* 텍스트 색상 */
    font-weight: bold; /* 글씨 두껍게 */
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<div class="container">
  <img id="icon_back" src="/images/icon/back.png" alt="뒤로가기">
  <main>
  
    <div class="swiper-container">
  <div class="swiper-wrapper">
  <!-- 이미지 들어갈곳 -->
  
<%--   <c:choose>
  	<c:when test="${PopImgPath}==null">
	      <c:forEach var="img" items="${IgImgPath}">
	        <div class="swiper-slide"><img src="${img}" alt="User Image" class="profileSize"></div>
	      </c:forEach>
     </c:when>
     <c:otherwise> --%>
      <c:forEach var="img" items="${PopImgPath}">
        <div class="swiper-slide"><img src="/image/read?path=${img}" alt="User Image" class="profileSize"></div>
      </c:forEach>
<%--       </c:otherwise>
  </c:choose> --%>
  </div>
  <!-- Navigation buttons -->
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>


</div>
    
    <div class='title'>
      <div class="title_header">
      <div class="title_category">
        <c:forEach var="sc" items="${StoreCategory}">
        ${sc.category_name}>
        </c:forEach>
        ${storedetail.age} 
       </div>

        <div class="title_icon">
          <img src="/images/icon/heart.png"><p>${StoreLike.storelike}</p>&nbsp;
          <img src="/images/icon/eye1.png"><p>${StoreHit.hit}</p>&nbsp;
          <img src="/images/icon/degree.png"><p>90%</p>
        </div>
      </div>
      <p class="title_name">${storedetail.title}</p>
      <p class="title_subname">${storedetail.introduction}</p>
      <div class="title_adress">
        <img src="/images/icon/map1.png">&nbsp;<p>${storedetail.address}</p>&nbsp;&nbsp;<p>|</p>&nbsp;&nbsp;
        <c:if test="${not empty storedetail.brand1}">
          <img src="/images/icon/store.png">&nbsp;<p>${storedetail.brand1}&nbsp;&nbsp;&nbsp;</p>
        </c:if>
        <c:if test="${not empty storedetail.brand2}">
          <img src="/images/icon/store.png">&nbsp;<p>${storedetail.brand2}</p>
        </c:if>
        


      </div>
      <div class="title_footer">
      <div class="tags">
        <c:forEach var = "tag" items="${storetag}" >
          <div class="tag_option">${tag.tag_name}</div> 
        </c:forEach>
      </div>
      <div class="title_click" >
       <div class="bookmark"><img src="/images/icon/star.png"><p>찜하기</p></div>&nbsp;
       <div class="share" onclick="clipboard()" ><img src="/images/icon/share1.png"><p>공유하기</p></div>&nbsp;
      </div>
      </div>
    
    </div>
    
    <div class="guide_line">
    <c:choose>
        <c:when test="${StoreReservation.status == '사전예약'}">
            <p>사전예약제로 운영되는 팝업입니다. 일정을 예약후 방문해주세요.</p>
        </c:when>
        <c:when test="${StoreReservation.status == '현장문의'}">
            <p>현장방문으로 운영되는 팝업입니다.</p>
        </c:when>
        <c:when test="${StoreReservation.status == '현장대기예약'}">
            <p>현장방문과 대기예약이 가능한 팝업입니다.대기예약은 앱을 이용해주세요</p>
        </c:when>
        <c:otherwise>
            <p>상태가 설정되지 않았습니다.</p>
        </c:otherwise>
    </c:choose>
</div>
    
    <div class="date_line">
    <div class="deadline">
      <p>종료까지</p>
      <p id="remainingDays"></p>
    </div>
    <div class="dateo"><p>팝업기간</p><p>${storedetail.start_date}  ~ ${storedetail.end_date}</p></div>
    <button id="reserveBtn" class="btn_booking">예약하기</button>    
    </div>
    
    <div class="menu_main">
      <div onclick="moveInfo()">팝업정보</div>
      <div onclick="moveReiview()">리뷰</div>
      <div onclick="moveMap()">위치</div>
      <div onclick="moveInstagram()">instgram피드</div>
    </div>
    
    <div id="contents">  
    <div class="content">
    <div class="content_title"><img  src="/images/icon/speaker.png" ><p>팝업스토어 소개</p></div>
    <p class="content_detail">${storedetail.content}</p>
  </div>
	<div class="content">
	    <div class="content_title"><img src="/images/icon/clock.png"><p>운영시간</p></div>
	    <c:choose>
	        <c:when test="${empty StoreOperation.igdate}">
	            <c:set var="weekdaysSame" value="${StoreOperation.smon == StoreOperation.stue && StoreOperation.emon == StoreOperation.etue && StoreOperation.emon == StoreOperation.ewed && StoreOperation.emon == StoreOperation.efri}" />
	            <c:set var="weekendSame" value="${StoreOperation.ssat == StoreOperation.ssun && StoreOperation.esat == StoreOperation.esun}" />
	            <c:set var="allSame" value="${weekdaysSame && weekendSame && StoreOperation.smon == StoreOperation.ssat && StoreOperation.emon == StoreOperation.esun}" />
	
	            <c:if test="${allSame}">
	                <p class="content_detail">매일: ${StoreOperation.smon} - ${StoreOperation.emon}</p>
	            </c:if>
	            <c:if test="${weekdaysSame && !allSame}">
	                <p class="content_detail">월~금: ${StoreOperation.smon} - ${StoreOperation.emon}</p>
	                <c:if test="${weekendSame}">
	                    <p class="content_detail">주말: ${StoreOperation.ssat} - ${StoreOperation.esat}</p>
	                </c:if>
	            </c:if>
	            <c:if test="${!weekdaysSame && weekendSame}">
	                <p class="content_detail">주말: ${StoreOperation.ssat} - ${StoreOperation.esat}</p>
	            </c:if>
	            <c:if test="${!weekdaysSame && !weekendSame}">
	                <p class="content_detail">
	                    월: ${StoreOperation.smon} - ${StoreOperation.emon}<br>
	                    화: ${StoreOperation.stue} - ${StoreOperation.etue}<br>
	                    수: ${StoreOperation.swed} - ${StoreOperation.ewed}<br>
	                    목: ${StoreOperation.sthu} - ${StoreOperation.ethu}<br>
	                    금: ${StoreOperation.sfri} - ${StoreOperation.efri}<br>
	                    토: ${StoreOperation.ssat} - ${StoreOperation.esat}<br>
	                    일: ${StoreOperation.ssun} - ${StoreOperation.esun}
	                </p>
	            </c:if>
	        </c:when>
	        <c:otherwise>
	            <p class="content_detail">상세페이지를 참고해주세요</p>
	        </c:otherwise>
	    </c:choose>
	</div>

  <div class="content">
    <div class="content_title"><img  src="/images/icon/check.png" ><p>팝업환경</p></div>
    <div class="content_sit">
      <c:choose>
        <c:when test="${storedetail.parking == '주차불가'}">
        <div><img src="/images/popup/driver.png"><p>${storedetail.parking}</p></div>
        </c:when>
        <c:when test="${storedetail.parking == '주차가능'}">
        <div><img src="/images/popup/parking.png"><p>${storedetail.parking}</p></div>
        </c:when>
      </c:choose>
      
      <c:choose>
        <c:when test="${storedetail.fare == '무료'}">
        <div><img src="/images/popup/fare.png"><p>${storedetail.fare}</p></div>
        </c:when>
        <c:otherwise>
        <div><img src="/images/popup/nofree.png"><p>${storedetail.fare}</p></div>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${storedetail.age_limit == '19세 이상'}">
        <div><img src="/images/popup/driver.png"><p>${storedetail.age_limit}</p></div>
        </c:when>
        <c:when test="${storedetail.age_limit == '노키즈 존'}">
        <div><img src="/images/popup/nokids.png"><p>${storedetail.age_limit}</p></div>
        </c:when>
      </c:choose>
      
      <c:choose>
        <c:when test="${storedetail.shooting == '촬영 가능'}">
        <div><img src="/images/popup/camera.png"><p>${storedetail.shooting}</p></div>
        </c:when>
        <c:when test="${storedetail.shooting == '촬영 불가'}">
        <div><img src="/images/popup/nocamera.png"><p>${storedetail.shooting}</p></div>
        </c:when>
      </c:choose>
    </div>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/box.png" ><p>굿즈 특이사항</p></div>
    <p class="content_detail">
    ${storedetail.goods} </p>
  </div>        
  <p class="sub_detail">현장상황에 따라 재고가 변동 혹은  수량의 오차가 있을 수 있습니다</p>
  <div class="link">
  <a class="btn1" href="${storedetail.homepage}">홈페이지 바로가기</a><a class="btn1" href="${storedetail.sns}">SNS 바로가기</a>
  </div>
  






    
  </div> <!-- contents -->
	
  </main>
  
  <aside>
  <div class="side-layout">
  <p>${user.name} 님</p>
  <div class="side_box">${TotalPopcorn.total_points}</div>
  <div class="side_box">내가 쓴 리뷰 수 ${MyTotalReview.review_idx}개</div>
  <hr>
  <div class="atag_div"><a class="btn2" href="/Users/Writeform?store_idx=${storedetail.store_idx}">후기 작성하기</a></div>
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




<!-- <script src="/js/authuser.js" defer></script> -->
<script src="/js/popup_info.js" defer></script>


<script>


const infoPage = `<div class="content">
    <div class="content_title"><img  src="/images/icon/speaker.png" ><p>팝업스토어 소개</p></div>
    <p class="content_detail">${storedetail.content}</p>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/clock.png" ><p>운영시간</p></div>
    <p class="content_detail">
    월 : ${StoreOperation.smon} - ${StoreOperation.emon }<br>
    화 : ${StoreOperation.stue } - ${StoreOperation.etue }<br>
    수 : ${StoreOperation.swed } - ${StoreOperation.ewed }<br>
    목 : ${StoreOperation.sthu } - ${StoreOperation.ethu }<br>
    금 : ${StoreOperation.sfri } - ${StoreOperation.efri }<br>
    토 : ${StoreOperation.ssat } - ${StoreOperation.esat }<br>
    일 : ${StoreOperation.ssun } - ${StoreOperation.esun }<br>
    ※${StoreOperation.onotes }
    </p>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/check.png" ><p>팝업환경</p></div>
    <div class="content_sit">
	    <c:choose>
	    <c:when test="${storedetail.parking == '주차불가'}">
	    <div><img src="/images/popup/driver.png"><p>${storedetail.parking}</p></div>
	    </c:when>
	    <c:when test="${storedetail.parking == '주차가능'}">
	    <div><img src="/images/popup/parking.png"><p>${storedetail.parking}</p></div>
	    </c:when>
	  </c:choose>
	  
	  <c:choose>
	    <c:when test="${storedetail.fare == '무료'}">
	    <div><img src="/images/popup/fare.png"><p>${storedetail.fare}</p></div>
	    </c:when>
	    <c:otherwise>
	    <div><img src="/images/popup/nofree.png"><p>${storedetail.fare}</p></div>
	    </c:otherwise>
	  </c:choose>
	  
	  <c:choose>
	    <c:when test="${storedetail.age_limit == '19세 이상'}">
	    <div><img src="/images/popup/driver.png"><p>${storedetail.age_limit}</p></div>
	    </c:when>
	    <c:when test="${storedetail.age_limit == '노키즈 존'}">
	    <div><img src="/images/popup/nokids.png"><p>${storedetail.age_limit}</p></div>
	    </c:when>
	  </c:choose>
	  
	  <c:choose>
	    <c:when test="${storedetail.shooting == '촬영 가능'}">
	    <div><img src="/images/popup/camera.png"><p>${storedetail.shooting}</p></div>
	    </c:when>
	    <c:when test="${storedetail.shooting == '촬영 불가'}">
	    <div><img src="/images/popup/nocamera.png"><p>${storedetail.shooting}</p></div>
	    </c:when>
	  </c:choose>
    </div>
  </div>
  <div class="content">
    <div class="content_title"><img  src="/images/icon/box.png" ><p>굿즈 특이사항</p></div>
    <p class="content_detail">
    ${storedetail.goods}</p>
  </div>        
  <p class="sub_detail">현장상황에 따라 재고가 변동 혹은  수량의 오차가 있을 수 있습니다</p>
  <div class="link">
  <a class="btn1" href="${storedetail.homepage}">홈페이지 바로가기</a><a class="btn1" href="${storedetail.sns}">SNS 바로가기</a>
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
	   <c:forEach  var = "HotReviews" items="${HotReviews}" >
	   <div class="review_box" onclick="moveHotReviewDetail(this)" 
		     data-idx="${HotReviews.store_idx}" 
		     data-user-idx="${HotReviews.user_idx}"
		     data-login-idx = "${user.userIdx}"
		     data-review-idx = "${HotReviews.review_idx}">
	     <div class ="review_preview">
	     <img class= "review_img"src="/images/example/exampleimg6.png">     
	     <div class="review_like">
	     <img src="/images/icon/heart.png">
	     <p>${HotReviews.like}</p>
	     </div>
	     </div>
	     <div class="review_info">
	       <p>${HotReviews.name} 님</p>
	       <div><img src="/images/icon/eye2.png">&nbsp;${HotReviews.score}&nbsp;</div>
	     </div>
	     <div class="review_score">평점 ${HotReviews.score}</div>
	     <div class="review_time"><div>3시간 전</div></div>
	     <div class="review_cdate">${HotReviews.review_date}</div>
	     </div>
	     </c:forEach> 
	   </div> 
	  
	  <!-- review header-->
	    <div class="review_header">
	    <div class="review_title">
	      <p>전체 리뷰</p>
	    </div>
	  </div>
	  <div class="review_sub">
	    <p>전체리뷰수&nbsp; | &nbsp;${totalcount.review_idx} &nbsp;&nbsp; 평균&nbsp; |&nbsp; ${totalcount.score}</p>
	    <div class="review_filter">
	    <div id="review_slike">좋아요순</div>
	    <div id="review_sscore">평점순</div>
	    <div id="review_snew">최신순</div>
	    </div>
	   </div>
	  
	   <!-- review body-->
	<div class="review_body">
	  <c:forEach  var = "review" items="${totalreviews}" >
	  <div class="review_box" onclick="moveHotReviewDetail(this)"
	  data-idx="${review.store_idx}" 
		     data-user-idx="${review.user_idx}"
			     data-login-idx = "${user.userIdx}"
			     data-review-idx = "${review.review_idx}">
	     <div class ="review_preview">
	     <img class= "review_img"src="/images/example/exampleimg6.png">     
	     <div class="review_like">
	     <img src="/images/icon/heart.png">
	     <p>${review.like}</p>
	     </div>
	     </div>
	     <div class="review_info">
	       <p>${review.name} 님</p>
	       <div><img src="/images/icon/eye2.png">&nbsp;${review.hit}&nbsp;</div>
	     </div>
	     <div class="review_score">평점 ${review.score}</div>
	     <div class="review_time"><div>3시간 전</div></div>
	     <div class="review_cdate">${review.review_date}</div>
	     </div>        
	     </c:forEach>  
	   </div> 
	  `;
	  
  const instagramPage = ` 
	  <!-- instagram header-->
	  <div class="review_header">
	    <div class="review_title">
	      <p>인스타그램 </p><p>조회수 기반 HOT 리뷰</p>
	    </div>
	  </div>
	  
	   <!-- instagram body-->
	   <div class="review_body">
	   <c:forEach  var = "HotReviews" items="${HotReviews}" >
	   <div class="review_box" onclick="moveHotReviewDetail(this)" 
		     data-idx="${HotReviews.store_idx}" 
		     data-user-idx="${HotReviews.user_idx}"
		     data-login-idx = "${user.userIdx}"
		     data-review-idx = "${HotReviews.review_idx}">
	     <div class ="review_preview">
	     <img class= "review_img"src="/images/example/exampleimg6.png">     
	     <div class="review_like">
	     <img src="/images/icon/heart.png">
	     <p>${HotReviews.like}</p>
	     </div>
	     </div>
	     <div class="review_info">
	       <p>${HotReviews.name} 님</p>
	       <div><img src="/images/icon/eye2.png">&nbsp;${HotReviews.score}&nbsp;</div>
	     </div>
	     <div class="review_score">평점 ${HotReviews.score}</div>
	     <div class="review_time"><div>3시간 전</div></div>
	     <div class="review_cdate">${HotReviews.review_date}</div>
	     </div>
	     </c:forEach> 
	   </div> 
	  
	  <!-- instagram header-->
	    <div class="review_header">
	    <div class="review_title">
	      <p>전체 리뷰</p>
	    </div>
	  </div>
	  <div class="review_sub">
	    <p>전체리뷰수&nbsp; | &nbsp;${totalcount.review_idx} &nbsp;&nbsp; 평균&nbsp; |&nbsp; ${totalcount.score}</p>
	    <div class="review_filter">
	    <div id="review_slike">좋아요순</div>
	    <div id="review_sscore">평점순</div>
	    <div id="review_snew">최신순</div>
	    </div>
	   </div>
	  
	   <!-- instagram body-->
	<div class="review_body">
	  <c:forEach  var = "review" items="${totalreviews}" >
	  <div class="review_box" onclick="moveHotReviewDetail(this)"
	  data-idx="${review.store_idx}" 
		     data-user-idx="${review.user_idx}"
			     data-login-idx = "${user.userIdx}"
			     data-review-idx = "${review.review_idx}">
	     <div class ="review_preview">
	     <img class= "review_img"src="/images/example/exampleimg6.png">     
	     <div class="review_like">
	     <img src="/images/icon/heart.png">
	     <p>${review.like}</p>
	     </div>
	     </div>
	     <div class="review_info">
	       <p>${review.name} 님</p>
	       <div><img src="/images/icon/eye2.png">&nbsp;${review.hit}&nbsp;</div>
	     </div>
	     <div class="review_score">평점 ${review.score}</div>
	     <div class="review_time"><div>3시간 전</div></div>
	     <div class="review_cdate">${review.review_date}</div>
	     </div>        
	     </c:forEach>  
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
  <p class="content_detail">${storedetail.address}</p>
</div>
<br><br><br><br>

` 

//핫리뷰 디테일
 function moveHotReviewDetail(element){
	const storeIdx = element.getAttribute('data-idx');
    const userIdx = element.getAttribute('data-user-idx');
    const loginIdx = element.getAttribute('data-login-idx');
    const reviewIdx = element.getAttribute('data-review-idx');
    console.log(storeIdx);
    console.log(userIdx);
    console.log(loginIdx);
    $.ajax({
    	url : '/Users/ReviewDetail',
    	type : 'GET',
    	data : { storeidx:storeIdx, useridx:userIdx,review_idx:reviewIdx}
    })
    .done(function(response){
    	const reviewData = response.ReviewDetail; // 서버에서 받아온 데이터
    	console.log(reviewData);
    	$('#contents').html('');
    	const reviewDetail = "<div class='review_header'>" +
        "<div class='review_title'>" +
            "<p>리뷰상세보기</p><p>유저들의 생생한 후기를 확인하세요</p>" +
        "</div>" +
    "</div>" +
    "<div class='swiper-container2'>" +
        "<div class='swiper-wrapper'>" +
            "<div class='swiper-slide ss'><img src='/images/example/exampleimg1.png' alt='1'></div>" +
            "<div class='swiper-slide ss'><img src='/images/example/exampleimg1.png' alt='2'></div>" +
            "<div class='swiper-slide ss'><img src='/images/example/exampleimg1.png' alt='3'></div>" +
            "<div class='swiper-slide ss'><img src='/images/example/exampleimg1.png' alt='4'></div>" +
            "<div class='swiper-slide ss'><img src='/images/example/exampleimg1.png' alt='5'></div>" +
        "</div>" +
        "<div class='swiper-button-next'></div>" +
        "<div class='swiper-button-prev'></div>" +
    "</div>" +
    "<div class='review_line'>" +
        "<div class='review_score2'>" +
            "<p>평점 " + reviewData.score + "</p>" +
            "<img src='/images/icon/star2.png'>" +
        "</div>" +
        "<div class='review_nld'>" +
            "<img src='/images/icon/calender.png'>&nbsp;&nbsp;&nbsp; <p>" + reviewData.review_date + "</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            "<img src='/images/icon/eye1.png'> &nbsp;&nbsp;&nbsp;<p>" + reviewData.hit + "</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            "<img src='/images/icon/heart.png'>&nbsp;&nbsp;&nbsp; <p>" + reviewData.like + "</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
        "</div>" +
    "</div>" +
    "<div class='content'>" +
        "<div class='content_title'><img src='/images/icon/msg.png'><p>코멘트</p></div>" +
        "<p class='content_detail'>" + reviewData.content + "</p>" +
    "</div>" +
    "<div class='sizebox'></div>" +
    "<div class='btn_line'>" +
        (loginIdx === userIdx ? 
            "<a class='btn3' href='/Users/Updateform?store_idx=" + reviewData.store_idx + "&user_idx=" + reviewData.user_idx + "&review_idx="+reviewIdx+"'>수정</a>" +
            "<a class='btn3' href='/Users/Delete?store_idx=" + reviewData.store_idx + "&user_idx=" + reviewData.user_idx + "&review_idx="+reviewIdx+"'>삭제</a>" : "") +
        "<a class='btn3' href='#' onclick='moveReviewBack(event)'>돌아가기</a>" +
    "</div>";
        $('#contents').append(reviewDetail); // 업데이트된 내용을 HTML에 삽입
        var swiper2 = new Swiper('.swiper-container2', {
            slidesPerView: 1,
            slidesPerGroup: 1,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            loop: true, // 무한 반복
        })
        
    })
	
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

function moveInstagram() {
	$('#contents').html('');
	  $('#contents').html(instagramPage);
}

function moveInstagramBack(e) {
	
	 e.preventDefault();
	$('#contents').html('');
	  $('#contents').html(instagramPage);
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
document.addEventListener("DOMContentLoaded", function() {
    const endDateStr = "${storedetail.end_date}"; // JSP에서 end_date를 가져옴
    console.log("End Date String:", endDateStr); // 디버깅 정보

    const endDate = new Date(endDateStr.replace(/-/g, '/')).getTime(); // '-'를 '/'로 바꿔서 Date 객체 생성
    const today = new Date().getTime(); // 현재 밀리초로 변환
    console.log("Today Date:", today); // 디버깅 정보

    const timeDiff = endDate - today; // 남은 시간 (밀리초 단위)
    const daysRemaining = Math.ceil(timeDiff / (1000 * 3600 * 24)); // 남은 일 수 계산

    // 남은 날짜를 HTML에 표시
    const remainingDaysElement = document.getElementById("remainingDays");
    if (daysRemaining > 0) {
        remainingDaysElement.innerHTML = `D-\${daysRemaining}`;
    } else if (daysRemaining === 0) {
        remainingDaysElement.innerHTML = "오늘 종료됩니다";
    } else {
        remainingDaysElement.innerHTML = "종료되었습니다"; // 종료된 경우 메시지 표시
    }
    console.log("Days Remaining:", daysRemaining); // 디버깅 정보
});
</script>
<!-- <script src="/js/authuser.js" defer></script> -->
</body>



</html>

