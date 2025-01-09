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
      padding: 20px 40px 40px 40px;
    }
    .waiting {
      background-color: #121212;
      color: #000;
      padding: 30px 50px;
      border-radius: 5px;
    }
    
    .waiting-info{
     display: flex;
     justify-content: flex-end;
     align-items: flex-end;
     margin-top: -70px;

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
      margin: 10px 0;
    }
    .section-content {
      padding: 60px 60px;
      font-size:28px;
      line-height: 1.5;
      background-color: #fff;
       border-radius: 25px;
       color: #333; font-weight: 700;
    }
    .section-content2 {
      padding: 60px 60px;

      line-height: 1.5;
      background-color: #fff;
       border-radius: 25px;
       color: #333; 
    }
    
    #reserveButton {
          font-size: 45px;
      font-weight: 600;
      padding: 30px;
    
       border-radius: 50px;
       border: 3px solid #333;
    
    }
    
    #reserveButton:hover{
      background-color: #BFBDBD;
       
       }
    #detail-info{

       font-size: 25px;
      font-weight: 600;
    }
    #detail-header{
       font-size: 55px;
      font-weight: bold;
      margin-top:10px;
    }
    
  </style>
</head>
<body>

<div class="container">
 
  <main>
  
  
 <div class="header">
    <span onclick="backPage()">←</span> &nbsp;&nbsp;
    <h1 style="margin: 0; font-size: 50px; ">예약 상세 내역</h1>
  </div>
  <div class="content">
       <div class="section">
      <div class="section-title">예약정보</div>
    </div>
      <div class="section-content2">
      <p id="detail-header">${store.title}</p>
      <p id="detail-info">- 예약상태&nbsp;:&nbsp;${store.status}</p>
      <p id="detail-info">- 예약날짜&nbsp;:&nbsp;${store.cdate}</p>
      <p id="detail-info">- 예약시간&nbsp;:&nbsp;${store.time_slot}</p>
      <p id="detail-info">- 인원&nbsp;:&nbsp;${store.reservation_number}</p>
      <div class="waiting-info">
      <button id="reserveButton" > 예약취소 </button>
      </div>
      </div>
  
  

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
  

</div>	

</body>
  <script>
  const reserveButton = document.getElementById("reserveButton");
  const reservation_idx =${store.reservation_idx};
  const status = '${store.status}';
  const reservation_date = '${store.reservation_date}';
  
  const currentDate = new Date(); // 현재 날짜
  const reservationDateObj = new Date(reservation_date);
  
  if(status ==='예약취소'){
   reserveButton.disabled = true;
   reserveButton.textContent = "취소완료";	  
	  
  }else if(reservationDateObj< currentDate){
	  
	   reserveButton.disabled = true;
	   reserveButton.textContent = "마감";	  
	  
  }
  reserveButton.addEventListener("click", function() {
  
	  //취소 버튼 구현
	  fetch(`/api/waiting/cancel?reservation_idx=\${encodeURIComponent(reservation_idx)}`)
	  .then(response => {
	        if (!response.ok) {
	            throw new Error(`HTTP error! status: ${response.status}`);	           
	        }
	        alert('취소완료되었습니다')
	        reserveButton.disabled = true;
    	    reserveButton.textContent = "취소완료";
	        return response
	    })
      .catch(error => {
	      console.error(' 삭제대상인 예약내역을 찾지 못했습니다', error);
	  }); 
	   
  })


  function backPage() {
	  window.history.back();    
  }

 </script>
</html>






