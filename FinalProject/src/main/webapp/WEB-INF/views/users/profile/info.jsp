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

body {
  background-color:#f1f1f1;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
<div class="container">
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
  </main>
</div>
<script src="/js/popup_info.js" defer></script>
<script>
const infoPage = `<div class="content">

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

</script>
</body>
</html>









