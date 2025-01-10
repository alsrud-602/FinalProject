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
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
/* reset css */

.container {

display:flex;
justify-content: center;
position: relative;
margin-bottom: 110%;




}
main {

width: 1200px;
position: absolute;
left: 50%; 
margin-bottom: 80px;
transform: translateX(-50%); 
}   


#icon_back {
width: 43px;
height: 43px;
position: absolute;
left: calc(50% - 600px - 73px);
}
 
aside {
width: 271px; 
height: 286px;
border: 10px solid #00FF84;
position: fixed;
right: calc(50% - 600px - 300px);

}

.title{
border: 2px solid #BDFF91;
margin-top: 30px;
padding: 40px 50px 30px 50px;
}  

.guide_line{
border: 2px solid #ffffff;
margin-top: 15px;
height: 80px; 
display: flex; 
align-items: center; 
justify-content: center;
p{
color: white;

font-size: 20px;
font-weight: 400; 
margin: 0px;

}
} 

.date_line{
margin-top:15px;
height: 90px; 
display: flex;
justify-content: space-between;
gap:10px;
}
.menu_main{
margin-top:30px;
font-size: 24px;
font-weight: 900; 
height: 82px; 
background: #767676;
display: flex;
justify-content: space-around;
div{
width: 33%;
display:flex;
align-items: center; /* 수직 중앙 정렬 */
justify-content: center;
height: 100%;

&:hover{
color:white;
}
}

}
.content {
margin-top:10px;
background: #000000;
color: white;
padding: 40px 60px;
}
.link{

margin-top:30px;
font-size: 16px;
font-weight: 900; 
height: 90px; 
display: flex;
justify-content: center;
gap:20px;

}
.title_header{
display:flex;
justify-content: space-between;

}
.title_category {
color: #757575; 
font-size: 16px;
font-weight: 600; 
}
.title_name{
color: white; 
font-size: 34px; 
font-weight: 700;
}
.title_subname{
color: white;
font-size: 20px; 
font-weight: 600;
}
.title_icon{
display:flex;
justify-content: flex-start;
align-items:center;
color: white;
font-size: 16px; 
font-weight: 600;
gap:4px;
img{
width: 30px;
height: 30px;
}

}

.title_adress{
margin-top: 5px;
display: flex;
justify-content: flex-start;
color: #757575;
font-size: 16px; 
font-weight: 600;
}
.tags{
margin-top: 12px;
display: flex;
justify-content: flex-start;
gap:8px;
}
.tag_option {
border-radius: 5px;
background: white;
color: #121212;
font-size: 16px; 
font-weight: 800;
padding: 5px 7px;
}
.title_click {
display:flex;
justify-content: flex-end;
align-items:center;
color: white;
font-size: 16px; 
font-weight: 600;
gap:4px;
div {
padding: 10px;
display:flex;gap:4px;
align-items:center;
border-radius: 5px;
border: 1px solid #ffffff;

    }
img{
width: 20px;
height: 20px;
}
}
.title_footer{
display: flex;
justify-content: space-between;
}
.deadline {
border: 1px solid #ffffff;
display: flex;
width: 280px;
justify-content:center;
align-items:center;
gap:20px;
p:first-child {
color: white;
font-size: 24px; 
font-weight: 600;	
}
p:nth-child(2) {
font-size: 24px; 
font-weight: 600;
color: #00FF84;		
}
}
.dateo {
border: 1px solid #ffffff;
display: flex;
width: 660px;
justify-content:center;
align-items:center;
gap:20px;
p:first-child {
color: white;
font-size: 24px; 
font-weight: 600;	
}
p:nth-child(2) {
font-size: 24px; 
font-weight: 400;
color: white;		
}
}
.btn_booking {
width: 215px;
font-size: 28px; 
font-weight: 600;
border: 1px solid #ffffff;

&:hover{
background:#00FF84;
cursor: pointer;
}	
}
.content_title{
display:flex;
align-items:center;
gap:5px;
font-size: 24px; 
font-weight: 600;
color: #00FF84;
margin-bottom: 7px;
img{
width: 31px;
height: 31px;
}
}
.content_detail{
font-size: 20px; 
font-weight: 300;
color:white;
}
.content_sit{
display: flex;
justify-content: flex-start;
align-items: center;
gap: 60px;
div{
display: flex;
flex-direction: column;
align-items: center;
gap: 10px;
font-size: 20px; 
font-weight: 500;
}
}

.btn1{
border: 2px solid #ffffff;
display: flex;
justify-content: center;
align-items: center;
width: 400px;
font-size: 22px; 
font-weight: 600;
color: white;
}
.atag_div{
margin-top:20px;
width: 215px;
height: 60px;
background: #00FF84;
display:flex;
justify-content: center;
align-items: center;
}
.btn2{
color: #121212;
font-size: 20px; 
font-weight: 800;
}

.swiper-button-next {
color: white;
}
.swiper-slide img {
  width: 600px;
  height: 600px;
  object-fit: cover;
}

.swiper-container {
     width: 1200px;
     height: 600px;
     margin: auto;
     overflow: hidden;
      position: relative;
   }
/* 네비게이션 버튼의 기본 스타일 */
.swiper-button-prev,
.swiper-button-next {
  position: absolute; /* swiper-wrapper 기준으로 위치 */
  top: 50%; /* 세로 중앙 */
  transform: translateY(-50%); /* 정확한 세로 중앙 정렬 */
  background-color: rgba(0, 0, 0, 0.5); /* 배경색 */
  color: #fff; /* 화살표 색상 */
  border: none;
  padding: 30px 20px 30px 20px;
  font-size: 18px;
  cursor: pointer;
  z-index: 10; /* 슬라이드 이미지 위에 오도록 설정 */
}
.swiper-button-prev {
  left: 0; 
}
.swiper-button-next {
  right: 0; 
}

.sub_detail{
text-align:right;
margin-top:5px;
color: #767676;
font-size: 13px;
}

.side-layout {
padding: 17px;

.side_box {
display:flex;
justify-content:flex-start;
align-items:center;
color: #ffffff;
border: 1px solid #ffffff;
font-size: 14px;
width: 215px;
height: 44px;
margin-top: 10px;
padding: 5px 15px;
font-weight: 500;
}
p {
color: #ffffff;
font-size: 20px;
font-weight: 700;

}
hr{
color: #ffffff;
margin-top: 20px;
}
}

.share:hover{
background: #767676;
cursor: pointer;
}
.bookmark:hover{
background: #767676;
cursor: pointer;
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
    <button class="btn_booking">예약하기</button>    
    </div>
    
    <div class="menu_main">
      <div>팝업정보</div>
      <div>리뷰</div>
      <div>위치</div>
    </div>
    
    <div class="contents">
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
  </div>
	
  </main>
  <aside>
  <div class="side-layout">
  <p>김방글 님</p>
  <div class="side_box">200 팝콘</div>
  <div class="side_box">내가 쓴 리뷰수 3개</div>
  <hr>
  <div class="atag_div"><a class="btn2" href ="#">후기 작성하기</a></div>
  </div>
  </aside>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<script >
const swiper = new Swiper('.swiper-container', {
    slidesPerView: 2, // 화면에 이미지 두 개 표시
    spaceBetween: 0,  // 이미지 간 여백 없음
    slidesPerGroup: 1, // 한 번에 한 장씩 슬라이드 이동
    loop: true, // 무한 루프
    navigation: {
      nextEl: '.swiper-button-next', // 다음 버튼
      prevEl: '.swiper-button-prev', // 이전 버튼
    },
    autoplay: {
      delay: 5000, // 3초마다 자동 슬라이드
    },
  });
  
function clipboard() {
    var currentUrl = window.location.href;

    // 클립보드에 URL 복사
    navigator.clipboard.writeText(currentUrl).then(function() {
        alert("URL이 클립보드에 복사되었습니다.");
    }).catch(function(error) {
        alert("복사 실패: " + error);
    });
} 


</script>
</body>
</html>









