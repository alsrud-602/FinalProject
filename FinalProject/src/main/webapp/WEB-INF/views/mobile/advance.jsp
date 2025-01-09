<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
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
        color: #fff;
        border-bottom: 1px solid #757575;
    }
    .header p {
        font-weight:400;
        font-size: 50px;
    }
    .header span {
        font-size: 50px;
    }
    .title {
        background-color: #000;
    }
    .title-box {
        padding: 30px 70px;
    }
    #category {
        font-size: 15px;
        font-weight: 400;
        color: #757575;
    }
    #title-name {
        font-size: 40px;
        font-weight: 400;
        margin: 5px 0;
    }
    #title-address {
        font-size: 15px;
        font-weight: 400;
        color: #757575;
    }   
    .sizebox1 {
        height: 25px;
        background: #262626;
    }   
    .booking-box {
        padding: 50px 70px;
    }  
    .booking-title {
        font-size: 25px;
        font-weight: 300;
        color: #00FF84;
        margin: 10px 0;
    }
    .booking-option select {
    padding-left:20px;
        height: 100px;
        width: 100%;
        border-radius: 10px;
        font-size: 40px;   
        margin: 10px 0;
        option{
        
        font-size: 20px;   
font-weight: 300;
        }
        
        }
    
   
   .caution-box{
   padding: 50px 70px;
   
   } 
   .caution-opion p:first-child {
font-size: 30px;   
font-weight: 300;
}
   .caution-opion p:nth-child(2) {
font-size: 15px;   
font-weight: 200;
}
.btn-res{
font-size: 40px;   
background-color: #00FF84;
padding:40px;
color: #121212;
font-weight: 400;
border-radius: 15px;
width: 300px;

}
.booking-detail{
 font-size: 10px;  
 
}
</style>
</head>
<body>

<div class="container">
    <main>
        <div class="header">
            <span onclick="backPage()">←</span> &nbsp;&nbsp;
            <p>예약하기</p>
        </div>
        
        <div class="title">
            <div class="title-box"> 
                <div id="category">잡화 | 스포츠 | 연령대</div>
                <p id="title-name">스텐리x팝업</p>
                <p id="title-address">서울 성북구 성수동 2543-1호 중앙빌딩</p>
            </div>
        </div>
        
        <div class="sizebox1"></div>
        <div class="booking-box">
            <div class="booking-option">
                <p class="booking-title">일자선택</p>
                <select id="date-slot"onchange="dateTimeSlot(this)" required>  
                    <option value="" >일자선택</option>  
                    <c:forEach var="date" items="${rDateList}">
		    <c:set var="formattedDate" value="${fn:substring(date.reservation_date, 0, 10)}" />
		    <option value="${date.reservation_date}">${formattedDate}</option>                 
                    </c:forEach>     
                </select>
            </div>
            <div class="booking-option">
                <p class="booking-title">회차선택</p>
                <select id="time-slot" required>  
                <option value="">회차선택</option>   
                </select>
            </div>
            <div class="booking-option">
                <p class="booking-title">인원수선택</p>
                <select id="person">  
	                <option>1</option>  
	                <option>2</option>  
	                <option>3</option>  
	                <option>4</option>  
	                <option>5</option>  
	                <option>6</option>  
                </select>
                <div class="booking-detail">인원은 최대 6인까지 예약됩니다</div>
            </div>
        </div>
        
        <div class="sizebox1"></div>
        
        <div class="caution-box">
            <div class="caution-opion">
                <p>예약 안내</p>
                <p>- 사전 예약은 일자별/시간대별로 예약 가능합니다</p>   
                <p>- 과도한 트래픽이 발생할 경우 예약 오픈 시간 이전부터 대기열이 발생할 수 있습니다</p>   
                <p>- 취소표 발생시 실시간으로 노출되니 예약에 참고 부탁드립니다</p>    
            </div>
            <hr>
            <div class="caution-opion">
                <p>입장 안내</p>
                <p>- 예약내역>사전예약>’해당 팝업명’을 클릭하여 직원에게 확인 후 입장할 수 있습니다</p>   
                <p>- 입장 시 혼잡함을 예방하기 위해 예약시간 10분 전부터 대기 부탁드립니다</p>   
            </div>
            <hr>
            <div class="caution-opion">
                <p>취소 안내</p>
                <p>- 예약내역>사전예약>해당 팝업> ‘예약 취소’ 버튼을 클릭하여 예약을 취소할 수 있습니다</p>     
            </div>
        </div>
        
        <button class="btn-res" onclick="reservationbtn()">예약하기</button>
        
    </main>
</div>	

<script>
const store_idx = 90;

function reservationbtn() {
const timeSlotSelect = document.getElementById('time-slot');
const dateSlotSelect = document.getElementById('date-slot');
const personSelect = document.getElementById('person');
const selectedOption = timeSlotSelect.options[timeSlotSelect.selectedIndex];
	
	let date = dateSlotSelect.value;
	let person = personSelect.value;
    const selectedDataRp = selectedOption.getAttribute('data-rp');

    if (date === "" || selectedDataRp === null || selectedDataRp === undefined) {
        alert('날짜 및 시간을 선택하세요');
        return false;
    }else{
    	
    	 fetch(`/api/waiting/reservationwrite`, {
    	        method: 'POST', // POST 방식으로 요청
    	        headers: {
    	            'Content-Type': 'application/json' // JSON 형식으로 데이터 전송
    	        },
    	        body: JSON.stringify({
    	        	reservation_date: date,
    	        	max_number: person,
    	        	rp_idx: selectedDataRp 
    	        })
    	    })
    	    .then(response => {
    	        if (!response.ok) {
    	            throw new Error(`HTTP error! status: ${response.status}`);
    	        }
    	        return response.json();
    	    })
    	    .then(data => {
    	        // 성공적으로 데이터를 받았을 때 처리
    	        console.log('예약 성공:', data);
    	        alert('예약완료되었습니다!')
    	    })
    	    .catch(error => {
    	        console.error('예약내역이 없습니다', error);
    	    });
    	
    	
    	
    	
    	
    	
    	
    }
	// 결과를 출력합니다.
	console.log(selectedOption);	
	console.log(selectedDataRp);	
	
}


function dateTimeSlot(element) {
	
	const dateValue = element.value;
	console.log(dateValue);
	
	
	  fetch(`/api/waiting/timeslot?store_idx=\${encodeURIComponent(store_idx)}`)
	  .then(response => {
		    if (!response.ok) {
		        throw new Error(`HTTP error! status: \${response.status}`);
		      }
		      return response.json();
		    })
	  .then(data => {
		  
		    const timeSlotSelect = document.getElementById('time-slot');
		    timeSlotSelect.innerHTML = '<option value="">회차선택</option>'; 
       console.log('data:'+data);
       if(data){
       const filteredSlots = data.filter(item => item.reservation_date === dateValue); 
    	   
       filteredSlots.forEach(slot => {
           const option = document.createElement('option');
           option.value = slot.time_range; 
           option.setAttribute('data-rp', slot.rp_idx); 
           option.textContent = slot.time_range; 
           timeSlotSelect.appendChild(option);
       });
	    
		  
       }  
	  }).catch(error => {
	      console.error('예약내역이 없습니다', error);
	  }); 
	

	
}

    function backPage() {
        window.history.back();    
    }
</script>
</body>
</html>
