<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common-company.css" />
<link rel="stylesheet"  href="/css/company_m.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>



</style>
</head>
<body>

<div class="container">
  <main>
  
  <button id="reserveButton"> 대기없음 </button>
  <div >대기인원</div>
  <div id ="waiting-count"></div>
  </main>
  

</div>	

</body>
  <script>
  
  const socket = new SockJS('/ws');  // 웹소켓 연결
  const stompClient = Stomp.over(socket);

  stompClient.connect({}, function(frame) {
      console.log('Connected: ' + frame);

      // 예약 대기 버튼 클릭 시 웹소켓 메시지 발송
      document.getElementById("reserveButton").addEventListener("click", function() {
          const waitingRequest = {
              store_idx: 90, // 예약할 가게 ID
              user_idx: 85,  // 사용자 ID
              reservation_number: 2
          };

          stompClient.send("/app/Waiting/Update", {}, JSON.stringify(waitingRequest));  // 서버로 대기 등록 요청
      });

      // 대기 리스트 실시간 업데이트
      stompClient.subscribe("/topic/Waiting/90", function(message) {
          const waitingList = JSON.parse(message.body);
          updateWaitingList(waitingList);
      });

     
      /*
      // 가게 예약 대기 상태 실시간 업데이트
      stompClient.subscribe("/topic/StoreStatus/1", function(message) {
          const status = message.body;
          if (status === "대기기능사용") {
              document.getElementById("reserveButton").textContent = " 대기하기";
              document.getElementById("reserveButton").disabled = false;
          }
      });
      */
  });
  
  function updateWaitingList(waitingList) {
	    const waitingCountElement = document.getElementById("waiting-count");
	    
	    // 대기 인원 수 계산
	    const waitingCount = waitingList.length;

	    // 대기 인원 수 업데이트
	    waitingCountElement.textContent = `대기 인원: \${waitingCount}`;
	}
  

 </script>
</html>






