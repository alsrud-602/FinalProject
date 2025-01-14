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
      font-size: 35px;
      color: #fff;
    }
    .content {
      padding: 15px;
    }
    .waiting {
      color: #fff;
      text-align: center;
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      margin: 7px;
    }
    #watinginfo{
     display: flex;
     gap:5px;
     padding-top: 20px;
      
     
    }
    
    .info{
    background-color: #000;
      padding: 15px 20px;
     border-radius: 15px;
      font-size: 20px;
      border: 2px solid #00FF84;
    }
    
    #title{
    color: #fff;
    font-weight: 800px;
    margin-bottom: -8px;
    
    }
    .section {
      margin-top: 10px;
      margin-bottom:58px;
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
      font-size: 15px;
      font-weight: 600;
      padding: 10px;
    
       border-radius: 50px;
       border: 2px solid #333;
    
    }
    #waiting-count{
       font-size: 15px;
      font-weight: 400;
    }
    #myindex{
       font-size: 15px;
      font-weight: 400;
    }
    #onsiteinfo{
    font-size: 20px;
      font-weight:500;
      margin-top: 20px;
      margin-left: 20px;
    }
    #indexnum{
    color:red;
    margin: 0 5px;
    }
    #navi{
    display:flex;
    justify-content: space-around;
    padding: 20px 0;
    }
    .navi_option{
        font-size: 20px;
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
    margin-top: 8px;
    width:100%;
    td{
    padding:10px 10px;
 
     }
     td:last-child{
     
     }
    }

    .rtable-header{
    margin:6px 0 7px;
    display:flex;
    justify-content:space-between;
    align-items:baseline;
    p{
      font-size: 20px;
      font-weight: 300;
    }
    div{
     font-size: 20px;
      font-weight: 600;
      padding: 5px 5px;
      background: #fff;
      color: #121212;
      border-radius: 12px;
    }
    }
    .rtable-footer{
          font-size: 17px;
      font-weight: 200;
    }
    
    #delayButton {
    font-size: 20px;
    font-weight: 600;
    padding: 20px 20px; 
    width:90%;   
    border-radius: 10px;
    border: 2px solid #333;
    background: #00FF84;
    
    }
    #btn-center{
    display: flex;
    justify-content: center;
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
        height: 400px;
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
    font-size: 30px;
    font-weight: 800;
    margin: 10px 0;
    display: flex;
    justify-content: center;
    
    }
    #delay-table{
    width: 100%;
    margin: 13px 0;
    border-collapse: collapse;
 
    tr:first-child {    
	background-color: #F7F6FB;
    }
    td:first-child {
	 border-bottom: 1px solid #86879A;
	 border-top: 1px solid #86879A;
	 padding: 20px 18px;
    }
    
    }
    .delay-header{
    font-size: 20px;
    font-weight: 700;
    color:#121212;
    
    }
    #delay-num{
    font-size: 20px;
    font-weight: 700;
    color:red;   
    }
    .delay-flex{
    display: flex;
    justify-content: space-between;
    }
	 #delay-info{
    font-size: 16px;
    font-weight: 500;    
    color: #00875F;
    display: flex;
    justify-content: center;
    margin: 20px 0 0 0;
    text-align: center;
    }
    #delay-select{
    width: 100px;
    font-size: 20px;
    font-weight: 600 ;
    padding: 5px 10px;
    }
	#delay-select option {
	    font-size: 20px;
	    font-weight: 500; /* 원하는 굵기로 변경 (예: 700은 굵은 글씨) */
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
    
    <h1 style="margin: 0 auto; font-size: 20px; color:#00FF84 ">예약 내역</h1>
  </div>
  <p id="onsiteinfo">현장대기 현황</p>
  <div class="content" style="
    padding-bottom: 10px;">
   <c:choose>
   <c:when test="${not empty wDTO.title}">
   <div class="info">
    <div id="title">${wDTO.title}</div>   
    <div class="waiting">
    <div id="watinginfo"> <p id ="waiting-count">대기인원 : 로딩중</p>
    <p style="font-size: 14px;">|</p>
    <p id="myindex">현재순번 : <span id="indexnum">1</span></p></div>
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
  
   <div id="btn-center">
   <button id="delayButton">예약 미루기</button> 
   <input type="hidden" id="reserveButton">

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
        <p id="title-warp"></p>

        </td>
     </tr>
     </table>

     </div>
     
  </div>
  
  </main>
  

</div>	
<div id="overlay">
 <div id="delay-popup">
   <p id="delay-title">몇 번으로 미룰까요?</p>
   <p id="delay-info">미루기 한번 당 팝콘 200이 소모됩니다</p>
   <table id="delay-table">
   <tr>
     <td>
     <div class= "delay-flex">
      <p class="delay-header">현재 번호</p>
      <p id="delay-num"></p>
      </div>
     </td>
   </tr>
      <tr>
     <td>
     <div class= "delay-flex">
      <p class="delay-header">원하는 순번</p>
      <select id="delay-select">
      
      </select>
      </div>
     </td>
   </tr>
   
   </table>
   <input type="hidden" id="cindex"/>
     <div class= "delay-center">
  <button class="btn-basic" id="btn-back">돌아가기</button>
  <button class="btn-basic" id="btn-ok">미루기</button>
  </div>

 </div>
</div>

	<%@include file="/WEB-INF/include/app-navbar.jsp" %>
</body>
  <script>
  
  const textElement = document.getElementById('title-warp');
  const text = textElement.innerText;
  const configuser = ${user_idx};
  console.log('configuser' + configuser);

  if (text.length > 20) {
      // 20자 이상일 경우 줄바꿈 처리
	  textElement.innerText = text.substring(0, 24) + '...'; 
  }
  
  $('#overlay').hide(); 
  
  $('#btn-back').click(function() {	  
      $('#delay-popup').animate({ top: '100%' }, 500, function() {
          $(this).hide(); // 애니메이션 후 팝업 숨김
      });
      $('#overlay').fadeOut(); // 오버레이 숨김
  });
  
  
  //예약 미루기
  document.getElementById("delayButton").addEventListener("click", function() {
	  
	  
	  //현재 예약 상태 및 번호  / 예약 현재 인원을 가져온다
	  fetch(`/api/waiting/waitingstatus?waiting_idx=\${encodeURIComponent(waiting_idx)}`)
	  .then(response => response.json())
	  .then(data => {
		  if(data){
			 if(data.status ==='대기') {
			 
				 $('#delay-num').html(data.wating_order);
				 
			  if( data.total > data.wating_order) {
				 let size = data.total - data.wating_order; 
				 let startnum = parseInt(data.wating_order) + 1;
				 console.log('total'+ size)
				 console.log('total'+ startnum)

				 // <select> 요소에 옵션 추가
				 let $select = $('#delay-select');
				 $select.empty(); // 기존 옵션 제거

				 for (let i = 0; i < size; i++) {
				     let optionValue = startnum + i; // startnum부터 시작
				     $select.append($('<option></option>').val(optionValue).text(optionValue));
				 }
				
	               $('#overlay').fadeIn(); // 오버레이를 나타냄
	               $('#delay-popup').css({ top: '100%', display: 'block' }) // 팝업을 아래로 위치시킴
	                .animate({ top: '50%' }, 500); // 팝업을 위로 애니메이션	   				     				 
			}else{  				
				alert('마지막 순번은 미루기 대상이 아닙니다')				     				
			}	 
			 }else {   				 
				 alert('현장 예약 내역이 없습니다')	
			 }  			
		  }
	  }).catch(error => {
	      console.error('처음 로딩 값이 없습니다:', error);
	  }); 

     // stompClient.send("/app/Waiting/Delete", {}, JSON.stringify(waitingRequest));  // 서버로 대기 등록 요청
  });
  
  //////////////////////////
  const waitingEl = document.querySelector(".waiting");
  const rtableEl = document.querySelector(".rtable");
  const reservationBox = document.querySelector("#reservationbox");
  const user_idx = '${user_idx}';
  const waiting_idx = '${wDTO.waiting_idx}';
  const store_idx = '${wDTO.store_idx}';

  const socket = new SockJS('/ws');  // 웹소켓 연결
  const stompClient = Stomp.over(socket);
   // 소켓 연결
  stompClient.connect({}, function(frame) {
      console.log('Connected: ' + frame);

      // 예약 취소 클릭 시 웹소켓 메시지 발송
      document.getElementById("reserveButton").addEventListener("click", function() {
    	  let newStatus = '예약취소';
          const waitingRequest = {
              waiting_idx: waiting_idx,
              status: newStatus
          };

          stompClient.send("/app/Waiting/Delete", {}, JSON.stringify(waitingRequest));  // 서버로 대기 등록 요청
      });

      // 미루기 웹소켓 전송 
      document.getElementById("btn-ok").addEventListener("click", function() {
    	 
    	   myorder = document.getElementById("delay-num").textContent;  
    	   neworder = document.getElementById("delay-select").value 
    	   console.log('neworder'+neworder);
    	   console.log('myorder'+myorder);
          const waitingDelay = {
    		   myOrder: myorder,
    		   newMyOrder: neworder,
    		   store_idx: store_idx,
    		   waiting_idx:waiting_idx
          };

          stompClient.send("/app/Waiting/Delay", {}, JSON.stringify(waitingDelay));  // 서버로 대기 등록 요청
          
          $('#delay-popup').animate({ top: '100%' }, 500, function() {
              $(this).hide(); // 애니메이션 후 팝업 숨김
          });
          $('#overlay').fadeOut(); // 오버레이 숨김
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
      const userWaiting = waitingList.find(waiting => waiting.user_idx == user_idx);
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

		// 현재 날짜의 시간을 00:00:00으로 설정하여 비교
		   currentDate.setHours(0, 0, 0, 0);
		   cdateorgin.setHours(0, 0, 0, 0);

		   let timeDiff = cdateorgin - currentDate; // 두 날짜의 차이
		   let daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24)); // 밀리초를 일로 변환
		 
		   if (daysDiff >= 0) {
		       daysDiff = daysDiff ; 
		   } else {
		       daysDiff = Math.abs(daysDiff); // 이미 지난 날짜는 양수로 변환
		   }

		    console.log(rdate)
		    console.log(cdateorgin)
		    
	 const result = `    
		      <tr>
		       <td>
		       <div class="rtable-header">
		        <p id="title-warp"><a href="/Mobile/Reservation/User/View?store_idx=\${item.store_idx}&user_idx=\${user_idx}&reservation_idx=\${item.reservation_idx}">\${item.title}</a></p>
		        <div>\${cdateorgin < currentDate ? "마감" : `D-\${daysDiff}`}</div> 
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
  //처음 초기화
  advanceRes()

 </script>
</html>

    




