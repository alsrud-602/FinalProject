<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
      color: #fff;
      text-align: center;
      display: flex;
      justify-content: space-between;
      align-items: baseline;
    }
    #watinginfo{
     display: flex;
     gap:20px;
      
     
    }
    
    .info{
    background-color: #000;
      padding: 40px 50px;
     border-radius: 15px;
      font-size: 45px;
      border: 2px solid #00FF84;
    }
    
    #title{
    color: #fff;
    margin: 10px 0;
  
    
    }
    .section {
      margin-top: 30px;
      margin-bottom:10px;
      background-color: #333;
      border-radius: 25px;
      padding-bottom: 30px;
      
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
          font-size: 40px;
      font-weight: 600;
      padding: 25px;
    
       border-radius: 50px;
       border: 3px solid #333;
    
    }
    #waiting-count{
       font-size: 40px;
      font-weight: 400;
    }
    #myindex{
           font-size: 40px;
      font-weight: 400;
    }
    #onsiteinfo{
    font-size: 40px;
      font-weight: 600;
      margin-top: 50px;
      margin-left: 50px;
    }
    #indexnum{
    color:red;
    margin: 0 20px;
    }
    #navi{
    display:flex;
    justify-content: space-around;
    padding: 50px 0;
    }
    .navi_option{
        font-size: 40px;
      font-weight: 600;
    }
    .navi_option:hover{
    color: #00FF84;
    }
    #reservationbox{
    margin: 0 auto;
    width: 90%; 
    }
    .rtable{
    width:100%;
    td{
    padding:30px 20px;
    border-bottom: 1px solid #fff;   
     }
     td:last-child{
     
     }
    }

    .rtable-header{
    margin:6px 0 10px;
    display:flex;
    justify-content:space-between;
    align-items:baseline;
    p{
      font-size: 40px;
      font-weight: 300;
    }
    div{
     font-size: 40px;
      font-weight: 600;
      padding: 10px 15px;
      background: #fff;
      color: #121212;
      border-radius: 12px;
    }
    }
    .rtable-footer{
          font-size: 35px;
      font-weight: 200;
    }
  </style>
</head>
<body>

<div class="container">
 
  <main>
  
  
 <div class="header">
    
    <h1 style="margin: 0 auto; font-size: 50px; color:#00FF84 ">예약 내역</h1>
  </div>
  <p id="onsiteinfo">현장대기 현황</p>
  <div class="content">
   <c:choose>
   <c:when test="${not empty wDTO.title}">
   <div class="info">
    <div id="title">${wDTO.title}</div>   
    <div class="waiting">
    <div id="watinginfo"> <p id ="waiting-count">대기인원 : 로딩중</p>|<p id="myindex">현재순번 : <span id="indexnum">1</span></p></div>
     <button id="reserveButton">예약취소</button> 
     </div>
     <input type="hidden" id="reserveButton">
    </div>
    </c:when>
    <c:otherwise>
    <div class="info">예약 내역 없음</div>
    </c:otherwise>
    </c:choose>

  </div>
  
      <div class="section">

      <div id="navi">
        <div class="navi_option" onclick="advanceRes()">사전예약</div>
        <div class="navi_option" onclick="onSiteRes()">현장대기</div>
     </div> 
     <hr>
     
     <div id="reservationbox">
     <table class ="rtable">
     <tr>
       <td>
       <div class="rtable-header">
        <p id="title-warp"><a href="#">스텐리 x 메시</a></p><div>D-3</div> 
       </div>
       <div  class="rtable-footer">
        2024.12.14 &nbsp;|&nbsp;11:00-12:00&nbsp;|&nbsp;4명&nbsp;
       </div>
        </td>
     </tr>

     </table>

     </div>
     
  </div>
  
  </main>
  

</div>   

</body>
  <script>
  
  const textElement = document.getElementById('title-warp');
  const text = textElement.innerText;

  if (text.length > 20) {
      // 20자 이상일 경우 줄바꿈 처리
     textElement.innerText = text.substring(0, 24) + '...'; 
  }
  
  
 
  
  //////////////////////////
  const waitingEl = document.querySelector(".waiting");
  const rtableEl = document.querySelector(".rtable");
  const reservationBox = document.querySelector("#reservationbox");
  const user_idx = ${wDTO.user_idx};
  const waiting_idx = ${wDTO.waiting_idx};
  const store_idx = ${wDTO.store_idx};

  const socket = new SockJS('/ws');  // 웹소켓 연결
  const stompClient = Stomp.over(socket);
   // 소켓 연결
  stompClient.connect({}, function(frame) {
      console.log('Connected: ' + frame);

      // 예약 대기 버튼 클릭 시 웹소켓 메시지 발송
      document.getElementById("reserveButton").addEventListener("click", function() {
         let newStatus = '예약취소';
          const waitingRequest = {
              waiting_idx: waiting_idx,
              status: newStatus
          };

          stompClient.send("/app/Waiting/Delete", {}, JSON.stringify(waitingRequest));  // 서버로 대기 등록 요청
      });

      // 대기 리스트 실시간 업데이트
      stompClient.subscribe(`/topic/Waiting/\${store_idx}`, function(message) {
          const waitingList = JSON.parse(message.body);
          updateWaitingList(waitingList);
          updateIndex(waitingList);

      });   
      
      // 가게 순번 실시간 업데이트
      stompClient.subscribe(`/topic/UserIndex/\${user_idx}`, function(message) {
         const data = JSON.parse(message.body);
           const wating_order = data.wating_order;
       
           
           console.log('wating_order의 값' + wating_order);
           console.log('data의 값' + data);
           
           if (wating_order) {
               waitingEl.innerHTML = '';
               // 새로운 <div> 요소 생성
               const messageDiv = document.createElement("div");
               messageDiv.textContent = `현재 순번! 입장하세요!`;
               messageDiv.style.color = 'red';
               //alert('현재순번입니다 15분내로 입장해주세요')
               
               // 생성한 <div>를 waitingEl에 추가
               waitingEl.appendChild(messageDiv);
           } else {
               console.error("Element with id 'indexnum' not found.");
           }

      });
     
  });
  
 
  //처음 로딩시 대기인원
  fetch(`/api/waiting/list?store_idx=\${encodeURIComponent(store_idx)}`)
  .then(response => response.json())
  .then(data => {
     if(data)
     updateWaitingList(data)
     updateIndex(data);
  }).catch(error => {
      console.error('처음 로딩 값이 없습니다:', error);
  }); 
  

  //대기인원 업데이트
  function updateWaitingList(waitingList) {
       const waitingCountElement = document.getElementById("waiting-count");
       
       // 대기 인원 수 계산
       const waitingCount = waitingList.length;

       // 대기 인원 수 업데이트
       if(waitingCountElement)
       waitingCountElement.textContent = `대기 인원: \${waitingCount}`;
   }
  function backPage() {
     window.history.back();    
  }
  
  
  function updateIndex(waitingList){
      const indexnumEl = document.getElementById("indexnum");
      const userWaiting = waitingList.find(waiting => waiting.user_idx === user_idx);
      console.log('찾기 성공');
      console.log(userWaiting);
      if (userWaiting) {
          // 일치하는 항목이 있을 경우 waiting_order를 가져와서 업데이트
          const waiting_order = userWaiting.wating_order;
          const curStatus = userWaiting.status;
         
      console.log(curStatus);
          if(curStatus=='현재순번'){
           alert('현재순번입니다! 15분내로 방문해주세요!')            
            waitingEl.innerHTML = '';
           // 새로운 <div> 요소 생성
           const messageDiv2 = document.createElement("div");
           messageDiv2.textContent = `현재 순번! 입장하세요!`;
           messageDiv2.style.color = 'red';
           //alert('현재순번입니다 15분내로 입장해주세요')
           
           // 생성한 <div>를 waitingEl에 추가
           waitingEl.appendChild(messageDiv2);       
           
          }else{
             indexnumEl.innerHTML ='';
             indexnumEl.innerHTML = waiting_order;
             
          }
            
          
      }else{
         waitingEl.innerHTML = '';
         waitingEl.innerHTML = '대기 상태가 아닙니다';  
      }  
  }
  
  function advanceRes(){

     fetch(`/api/waiting/advance?user_idx=\${encodeURIComponent(user_idx)}`)
     .then(response => {
          if (!response.ok) {
              throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
          })
     .then(data => {
       console.log(data);
       if(data){
       rtableEl.innerHTML = '';  
      data.forEach((item, index) => {
        
          let rdate = `\${item.reservation_date}`; 
          let cdateorgin = new Date(rdate);
          let currentDate = new Date(); // 현재 날짜
          let timeDiff = currentDate - cdateorgin; // 두 날짜의 차이
          let daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24)); // 밀리초를 일로 변환
          console.log(rdate)
          console.log(cdateorgin)
          
    const result = `    
            <tr>
             <td>
             <div class="rtable-header">
              <p id="title-warp"><a href="#">\${item.title}</a></p>
              <div>\${cdateorgin < currentDate ? "마감" : `D-\${Math.ceil(timeDiff / (1000 * 3600 * 24))}`}</div> 
             </div>
             <div  class="rtable-footer">
             \${rdate} &nbsp;|&nbsp;\${item.time_slot}&nbsp;|&nbsp;\${item.reservation_number}명&nbsp;
             </div>
              </td>
           </tr>`      
      
         rtableEl.innerHTML+=result;
           
      
       })  
        
       }  
     }).catch(error => {
         console.error('예약내역이 없습니다', error);
     }); 
        
     
  }
  
  function onSiteRes() {
    
     fetch(`/api/waiting/onsite?user_idx=\${encodeURIComponent(user_idx)}`)
     .then(response => {
          if (!response.ok) {
              throw new Error(`HTTP error! status: \${response.status}`);
            }
            return response.json();
          })
     .then(data => {
       console.log(data);
       if(data){
       rtableEl.innerHTML = '';  
      data.forEach((item, index) => {
        
          
      const result = `    
            <tr>
             <td>
             <div class="rtable-header">
              <p id="title-warp"><a href="#">\${item.title}</a></p>           
             </div>
             <div  class="rtable-footer">
             \${item.status}&nbsp;|&nbsp;\${item.reservation_number}명&nbsp;
             </div>
              </td>
           </tr>`      
      
         
           
       rtableEl.innerHTML+=result;
      
       }) 
       
        
       }  
     }).catch(error => {
         console.error('예약내역이 없습니다', error);
     }); 
     
     
     
     
  }

 </script>
</html>






