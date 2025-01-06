<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
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
      padding: 50px 23px;
      
      background-color: #000;
      font-size: 35px;
      color: #fff;
    }
    .content {
      padding: 40px;
    }
    .waiting {
      background-color: #00FF84;
      color: #000;
      padding: 30px 50px;
      border-radius: 5px;
      text-align: center;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .section {
      margin-top: 20px;
      margin-bottom:10px;
      padding: 30px 50px;
      background-color: #333;
      border-radius: 25px;
    }
    .section-title {
      font-size: 50px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .section-content {
      padding: 60px 50px;
      font-size: 40px;
      line-height: 1.5;
      background-color: #fff;
       border-radius: 25px;
       color: #333; font-weight: 700;
    }
    
    #reserveButton {
          font-size: 45px;
      font-weight: 600;
      padding: 30px;
    
       border-radius: 50px;
       border: 3px solid #333;
    
    }
    #waiting-count{
       font-size: 55px;
      font-weight: bold;
    }
  </style>
</head>
<body>

<div class="container">
 
  <main>
  
  
 <div class="header">
    <span onclick="backPage()">←</span> &nbsp;&nbsp;
    <h1 style="margin: 0; font-size: 50px; ">매장 대기 현황</h1>
  </div>
  <div class="content">
    <div class="waiting"><p id ="waiting-count"></p>  <button id="reserveButton"> 대기불가 </button>   </div>
    <div class="section">
      <div class="section-title">주의사항</div>
    </div>
      <div class="section-content">
        현재순번 연락 후 15분이 지나면 자동으로 예약이 취소됩니다.
      </div>
      
    <div class="section">
      <div class="section-title">오시는 길</div>
    </div>
      <div class="section-content">서울 성동구 3432-123 1호</div>
      
  
  </div>
  
  
  </main>
  

</div>	

</body>
  <script>
  const store_idx = 92;
  
  const socket = new SockJS('/ws');  // 웹소켓 연결
  const stompClient = Stomp.over(socket);
   // 소켓 연결
  stompClient.connect({}, function(frame) {
      console.log('Connected: ' + frame);

      // 예약 대기 버튼 클릭 시 웹소켓 메시지 발송
      document.getElementById("reserveButton").addEventListener("click", function() {
          const waitingRequest = {
              store_idx: store_idx, // 예약할 가게 ID
              user_idx: 85,  // 사용자 ID
              reservation_number: 2
          };

          stompClient.send("/app/Waiting/Update", {}, JSON.stringify(waitingRequest));  // 서버로 대기 등록 요청
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






