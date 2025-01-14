<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

  <style>
    body {
      margin: 0;
      background-color: #121212;
      color: #fff;
    }
     .header {
        display: flex;
        align-items: center;
        padding: 15px 15px;
        background-color: #000;
        color: #fff;
        border-bottom: 1px solid #757575;
    }
    .header p {
        font-weight:400;
        font-size: 20px;
    }
    .header span {
        font-size: 25px;
    }
    .content {
      padding: 20px;
    }
    .waiting {
      background-color: #00FF84;
      color: #000;
      padding: 20px 20px;
      border-radius: 5px;
      text-align: center;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .section {
      margin-top: 20px;
      margin-bottom:7px;
      padding: 16px 25px;
      background-color: #333;
      border-radius: 25px;
    }
    .section-title {
      font-size:18px;
      font-weight: bold;
    }
    .section-content {
      padding: 20px 20px;
      font-size: 16px;
      line-height: 1.5;
      background-color: #fff;
       border-radius: 25px;
       color: #333; font-weight: 700;
    }
    
    #reserveButton {
     font-size: 18px;
      font-weight: 600;
      padding: 9px;   
       border-radius: 50px;
       border: 2px solid #333;
    
    }
    #waiting-count{
       font-size: 25px;
      font-weight: bold;
    }
    
        #overlay {
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.3);
        display: none; /* 처음에는 숨김 */
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
    }

    #delay-popup {
        width: 320px;
        height: 340px;
        background-color: #fff;
        position: absolute;
        top: 50%; /* 중앙 정렬을 위한 초기 위치 */
        left: 50%;
        transform: translate(-50%, -50%); /* 중앙 정렬 */
        display: none; /* 처음에는 숨김 */
        padding: 30px;
        display: flex;
        border-radius: 20px;

    }
    #delay-title{
    color:#121212;
    font-size: 34px;
    font-weight: 800;
    margin: 10px 0;
    display: flex;
    justify-content: center;
    
    }
    #delay-select{
    width: 80%;
    font-size: 30px;
    font-weight: 700 ;
    padding: 10px;    
    
    margin: 20px;
    border: 1px solid #A5A5A5;
    border-radius: 10px;
    }
	#delay-select option {
	}   
	 #delay-info{
    font-size: 20px;
    font-weight: 500;    
    color: #00875F;
    display: flex;
    justify-content: center;
    margin: 20px 0 0 0;
    }
    .btn-basic{
	width: 150px;
	height: 60px;
	display: flex;
	justify-content: center;
	font-size: 20px;
	 font-weight: 700 ;
	 align-items: center;
	 border-radius: 15px;
	} 
	.delay-center{
    display: flex;
	justify-content: center;
	gap:20px;
	padding: 10px 0 20px;
	}
	#btn-back{
	background: #fff;
	color:#121212;
	border: 1px solid #121212;
	}
    #btn-ok{
	background: #00FF84;
	color:#121212;
	border: none;
	}
  </style>
</head>
<body style="padding-top: 0px; ">

<div class="container">
 
  <main>
  
  
 <div class="header">
    <span onclick="backPage()">←</span> &nbsp;&nbsp;
    <p >매장 대기 현황</p>
  </div>
  <div class="content">
    <div class="waiting"><p id ="waiting-count"></p>  <button id="reserveButton"> 대기불가 </button>   </div>
    <div class="section">
      <div class="section-title">주의사항</div>
    </div>
      <div class="section-content">
   <c:choose>
   <c:when test="${not empty anDTO.notes}">
      ${anDTO.notes}   
   </c:when>
   <c:otherwise>
        현재순번 연락 후 15분이 지나면 예약이 취소될 수 있습니다.
   </c:otherwise>
   </c:choose>
      </div>
      
    <div class="section">
      <div class="section-title">오시는 길</div>
    </div>
      <div class="section-content">${anDTO.address}</div>
      
  
  </div>
  
  
  </main>
  
  <div id="overlay">
 <div id="delay-popup">
   <p id="delay-title">예약 인원수</p>
    <p id="delay-info">예약 노쇼시, 팝콘이 차감됩니다</p>
   <select id="delay-select">
     <option>1</option>
     <option>2</option>
     <option>3</option>
     <option>4</option>
     <option>5</option>
     <option>6</option>
     <option>7</option>
     <option>8</option>
   </select> 
    <div class= "delay-center">
  <button class="btn-basic" id="btn-back">돌아가기</button>
  <button class="btn-basic" id="btn-ok">예약하기</button>
  </div>  
   </div>
   
   </div>
  

</div>	
	<%@include file="/WEB-INF/include/app-navbar.jsp" %>
</body>
  <script>
  const store_idx = ${store_idx};
  const user_idx = ${user_idx}; 
  document.getElementById("reserveButton").addEventListener("click", function() {
          
 	 $('#overlay').fadeIn(); // 오버레이를 나타냄
      $('#delay-popup').css({ top: '100%', display: 'block' }) // 팝업을 아래로 위치시킴
       .animate({ top: '50%' }, 500); // 팝업을 위로 애니메이션	     
  
  })
  
    $('#btn-back').click(function() {	  
      $('#delay-popup').animate({ top: '100%' }, 500, function() {
          $(this).hide(); // 애니메이션 후 팝업 숨김
      });
      $('#overlay').fadeOut(); // 오버레이 숨김
  });
  
  const socket = new SockJS('/ws');  // 웹소켓 연결
  const stompClient = Stomp.over(socket);
   // 소켓 연결
  stompClient.connect({}, function(frame) {
      console.log('Connected: ' + frame);

      // 예약 대기 버튼 클릭 시 웹소켓 메시지 발송
      document.getElementById("btn-ok").addEventListener("click", function() {  	    	  
    	  
          let number = $('#delay-select').val();
          console.log(number)
        	  
          const waitingRequest = {
              store_idx: store_idx, // 예약할 가게 ID
              user_idx: user_idx,  // 사용자 ID
              reservation_number: number
          };
          
          fetch(`/api/waiting/check?user_idx=\${encodeURIComponent(user_idx)}`)
          .then(response => response.json())
          .then(data => {
              // data가 null, undefined, 또는 길이가 없는 경우
              if (!data || data.length === 0) {
                  // 대기 등록 요청
                  stompClient.send("/app/Waiting/Update", {}, JSON.stringify(waitingRequest));
              } else {
                  // 대기 내역이 있는 경우
                  alert('대기내역이 있습니다! 예약취소 후 등록하세요;)');
              }
          })
          .catch(error => {
              console.error('Error fetching waiting list:', error);
              alert('대기 목록을 가져오는 중 오류가 발생했습니다.');
          }); 
      
          $('#delay-popup').animate({ top: '100%' }, 500, function() {
              $(this).hide(); // 애니메이션 후 팝업 숨김
          });
          $('#overlay').fadeOut(); // 오버레이 숨김

      
      
      });

      // 대기 리스트 실시간 업데이트
      stompClient.subscribe(`/topic/Waiting/\${store_idx}`, function(message) {
          const waitingList = JSON.parse(message.body);
          updateWaitingList(waitingList);
      });

     
      
      // 가게 예약 대기 상태 실시간 업데이트
      stompClient.subscribe(`/topic/StoreStatus/\${store_idx}`, function(message) {
    	  const data = JSON.parse(message.body);
    	    const onsite_use = data.onsite_use;
    	    const reserveButton = document.getElementById("reserveButton");

    	    console.log('onsite_use의 값' + onsite_use);
    	    console.log('data의 값' + data);
    	    if (onsite_use === "able") {
    	      reserveButton.disabled = false;
    	      reserveButton.textContent = "대기하기";
    	    } else {
    	      reserveButton.disabled = true;
    	      reserveButton.textContent = "대기불가";
    	    }
      });
     
  });
  
  //처음 로딩시  버튼
  fetch(`/api/waiting/status?store_idx=\${encodeURIComponent(store_idx)}`)
  .then(response => {
	    if (!response.ok) {
	        throw new Error('Network response was not ok');
	      }
	      return response.json();	  	  
  })
  .then(status => {
	  console.log('처음로딩 버튼 상태');
	  console.log(status);
    const reserveButton = document.getElementById("reserveButton");
    if (status.onsite_use === 'able') {
      reserveButton.disabled = false;
      reserveButton.textContent = '대기하기';
    } else {
      reserveButton.disabled = true;
      reserveButton.textContent = '대기불가';
    }
  }).catch(error => {
	    console.error('There was a problem with the fetch operation:', error);
	    // 오류 발생 시 버튼을 '대기불가'로 설정
	    const reserveButton = document.getElementById("reserveButton");
	    reserveButton.disabled = true;
	    reserveButton.textContent = '대기불가';
	  });
  
  //처음 로딩시 대기인원
  fetch(`/api/waiting/list?store_idx=\${encodeURIComponent(store_idx)}`)
  .then(response => response.json())
  .then(data => {
	  if(data)
	  updateWaitingList(data)
  });  
  

  //대기인원 업데이트
  function updateWaitingList(waitingList) {
	    const waitingCountElement = document.getElementById("waiting-count");
	    
	    // 대기 인원 수 계산
	    const waitingCount = waitingList.length;

	    // 대기 인원 수 업데이트
	    waitingCountElement.textContent = `대기 인원: \${waitingCount}`;
	}
  function backPage() {
	  window.history.back();    
  }

 </script>
</html>






