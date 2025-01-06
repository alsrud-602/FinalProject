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



</style>
</head>
<body>

<div class="container">
 
  <main>
  
  <button id="reserveButton"> 대기상황 </button>
  <div >92번 대기인원</div>
  <div id ="waiting-count"></div>
  
      <div class='title'>
   
      <div class="title_header">
      <div class="title_category">
         카테고리 > 카테고리2
       </div>

        <div class="title_icon">
          <img src="/images/icon/heart.png"><p>20</p>&nbsp;
          <img src="/images/icon/eye1.png"><p>20</p>&nbsp;
          <img src="/images/icon/degree.png"><p>20</p>
        </div>
      </div>
      <p class="title_name">스텐리x메시</p>
      <p class="title_subname">드디어 상륙</p>
      <div class="title_adress">
        <img src="/images/icon/map1.png">&nbsp;<p>$주소주소주소</p>&nbsp;&nbsp;<p>|</p>&nbsp;&nbsp;
          <img src="/images/icon/store.png">&nbsp;<p>스텐리&nbsp;&nbsp;&nbsp;</p>
          <img src="/images/icon/store.png">&nbsp;<p>메시</p>
        


      </div>
      <div class="title_footer">
      <div class="tags">
          <div class="tag_option">스텐리</div> 
          <div class="tag_option">포토부스</div> 
      </div>
      <div class="title_click" >
       <div class="bookmark"><img src="/images/icon/star.png"><p>찜하기</p></div>&nbsp;
       <div class="share"  ><img src="/images/icon/share1.png"><p>공유하기</p></div>&nbsp;
      </div>
      </div>
    
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
    	      reserveButton.textContent = "대기없음";
    	    }
      });
     
  });
  
  //처음 로딩시  버튼
  fetch(`/api/waiting/status?store_idx=\${encodeURIComponent(store_idx)}`)
  .then(response => response.json())
  .then(status => {
	  console.log('처음로딩 버튼 상태');
	  console.log(status);
    const reserveButton = document.getElementById("reserveButton");
    if (status.onsite_use === 'able') {
      reserveButton.disabled = false;
      reserveButton.textContent = '대기하기';
    } else {
      reserveButton.disabled = true;
      reserveButton.textContent = '대기없음';
    }
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
  

 </script>
</html>






