<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    // 요일을 키-값 쌍으로 설정
    java.util.Map<String, String> daysOfWeek = new java.util.LinkedHashMap<>();
    daysOfWeek.put("MON", "월");
    daysOfWeek.put("TUE", "화");
    daysOfWeek.put("WED", "수");
    daysOfWeek.put("THU", "목");
    daysOfWeek.put("FRI", "금");
    daysOfWeek.put("SAT", "토");
    daysOfWeek.put("SUN", "일");

    request.setAttribute("daysOfWeek", daysOfWeek);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팝업스토어 수정</title>

<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/company_m.css" />
<link rel="stylesheet"  href="/css/common-company.css" />
    <style>
    
.button-container {
  display: flex;          
  align-items: flex-start; 
   gap: 10px; 
}   
  .btn10{
  width: 130px;        
  height: 43px;
  box-sizing:border-box; 
  font-size: 20px;
  background: write;
  border: 1px solid #9A9A9A; 
  display:flex;
  justify-content:center;
  align-items:center;
  transition: background-color 0.3s;
}
    
.btn10:hover {
  background: #DFDFDF;
}
.btn11 {
  width: 400px; 
  height: 43px;  
  font-size: 20px; 
  margin-left:20px;
  background: #f9f9f9;  
  border: 1px solid #9A9A9A; 
  display: flex; 
  justify-content: center;  
  align-items: center; 
  transition: background-color 0.3s;  
}

.btn11:hover {
  background: #DFDFDF; 
}
.btn12 {
  width: 600px;  
  height: 43px;
  font-size: 20px;  
  margin-left:20px;
  background: #f9f9f9;  
  border: 1px solid #9A9A9A;  
  display: flex;  
  justify-content: center;  
  align-items: center;  
  transition: background-color 0.3s; 
}


.btn11:hover {
  background: #DFDFDF; 
}
   
.btn10.active {
 background-color: #BDFF91; /* 활성화된 버튼 색상 */
        }
       
#read_guide {
  display: block; 
  margin-left: 40px; 
 font-size: 18px; 
  font-weight: 600
 line-height: 1.5; 
 color: #333; 
 padding: 10px; 
}    
             
input[type="date"] {
 width: 160px;        
 height: 43px;         
 border: 1px solid #9A9A9A; 
 margin-right: 10px;  
 box-sizing: border-box; 
 padding-left: 10px;
 padding-right: 10px;
 font-size: 20px;
}
 .button {
  padding: 10px 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align: center;
  text-decoration: none;
  color: #000;
  background-color: #f9f9f9;
  transition: background-color 0.3s;
        }
 .button.active {
  background-color: #BDFF91; /* 클릭했을 때 배경색 */
 }
        
.title_write{
margin-top: 30px;
padding: 33px 53px 30px 53px;
background: linear-gradient(to right, #20FF94 0%, #BFFFC9 50%, #BDFF91 85%);
height: 164px;
margin-bottom:37px;

p:nth-child(2) {
font-size: 34px;
font-weight: 900; 	
color:#121212;
}
p:first-child {
font-size: 15px;
font-weight: 700; 	
color:#121212;
}  
}
#brand_red{
color:red;
}
.button_reservation {
 font-size:15px;
 padding: 10px 20px;
 border: 1px solid #ccc;
 border-radius: 5px;
 text-align: center;
 text-decoration: none;
 color: #000;
 background-color: #f9f9f9;
 transition: background-color 0.3s;
 margin-left: 20px;
       }
.button_reservation.active {
           background-color: #BDFF91; /* 클릭했을 때 배경색 */
       }
        
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/header_company.jsp" %> 
 <img id="icon_back" src="/images/icon/back2.png" alt="뒤로가기" onclick="goBack()">
 <form action="/Business/Operation/UpdateReservation" method="POST" enctype="multipart/form-data" 
       onsubmit="return validateForm()">     
 <input type="hidden" name="store_idx" value="${store.store_idx}">      
 <input type="hidden" name="company_idx" value="${store.company_idx}">      
 <input type="hidden" name="operation_idx" value="${store.operation_idx}">      
    
    <div class="container">
    <main>




 <div class="title">
   <p>예약 일정 및 관련사항을 수정하세요</p>
   <p>팝업스토어 예약수정</p>
 </div>  
   <p id="title_guide">*수정 불가 항목은 관리자요청 부탁드립니다.</p>

 
 <div class="content_body">     
    <div class="sub_title">예약하기</div>
  	<div class="sub_content">
  	<table class="sub_table">
  	  <tr>
		<td>예약기능</td>
		<td>    
           <div class="button-container" >
          <a href="#" id="btn_n" class="button" onclick="toggleContent('content1', ['content2', 'content3'], this)" data-status ="현장문의">현장문의</a>
    	  <a href="#" id="btn_a" class="button" onclick= "toggleContent('content2', ['content3', 'content1'], this)"data-status ="사전예약">사전예약</a>
   		  <a href="#" id="btn_w" class="button" onclick="toggleContent('content3', ['content1', 'content2'], this)"data-status ="현장대기예약">현장대기예약</a>
   		  <input type="hidden" name="status" id="statusInput" value="">
           </div>
        </td> 
      </tr> 
	</table>
	</div>
	
   <!-- ------------------------------------------------------------- -->
	<div class="content_field" id="content1" style="display: none;">
    <hr>
    <p>현장문의란?</p>  
    <span id="read_guide">현장문의는 플랫폼에서 예약기능을 사용하지 않음을 의미하며 예약관련 사항을 자체적으로 관리할때  설정합니다.</span>
	</div>
	
	 <div class="content_field" id="content3" style="display: none;">
     <hr>
     <p>현장대기예약이란?</p>   
     <span id="read_guide">현장대기예약은 현장 웨이팅이 발생했을때 고객들의 웨이팅을 플랫폼에서 관리해주는 기능을 의미합니다.
      <br>선택 후 운영 페이지에서 현장대기를 관리하세요!</span>
     </div>
	  <!-- ------------------------------------------------------------- -->
	
	
	
	<div class="content_field" id="content2" style="display: none;">
    <hr>
    <p>사전예약이란?</p>
    <span id="read_guide">사전예약은 사전에 정해진 기간과 시간에 적정인원수를 설정해 예약을 받는 시스템을 의미합니다.</span>
      <hr>
      <p>기능사용 여부</p>
      <span id="read_guide">플랫폼 자체 사전예약기능 사용여부를 체크해주세요</span>
	   <table class="sub_table">
	   	<tr>
 		<td>
 		<a href="#" id="btn_ok" class="button" onclick="toggleSubContent('content4', 'content2', this)" data-rq ="사용가능" style="font-size: 16px; margin-left: 250px;">네! 플랫폼 기능을 사용할래요</a>
        <a href="#" id="btn_no" class="button" onclick="toggleSubContent('content5', 'content2', this)"  data-rq ="사용불가" style="font-size: 16px; margin-left: 30px;">아니요! 다른 자체적인 사전예약 시스템이 있습니다</a>
         <input type="hidden" id="advanceInput" value="">
        </td>
        
         </tr>
         </table>
         
         
    <!-- ------------------------------------------------------------- -->       
         
         
         
 <div class="content" id="content4" style="display: none;">
    <hr>
    <div style=" display: flex; justify-content: space-between; margin-bottom: -18px;">
    <p>플랜설정하기</p>
    <a href="#" class="btn3" id="addPlanButton">플랜추가</a>
    </div>
     <span id="read_guide" style=" color: red;">*이미 생성된 플랜은 예약이 오픈되었으므로 삭제 할 수 없습니다. 새로운 플랜 생성으로 일정을 변경하세요<br>
     *인원수를 차감해 현재 예약인원 된 수를 넘을 경우 이미 예약받은 고객의 예약은 취소되지 않고 유지됩니다.</span> 
    
    <div id="plansContainer" style="width:1000px;"> 
      <div id="plansContainer" style="width:1000px;"></div>
        </div>
  

       <hr>
       <p>기간설정하기</p>  
       <span id="read_guide">사전예약받을 기간과 플랜을 적용하세요. 플랜과 기간은 운영페이지에서 수정이 가능합니다.<br>
       *이미 오픈된 예약날짜는 수정이 불가 합니다.</span> 
       
		<div class="content" id="periodContainer" style="display: flex; align-items: flex-start;">
    	<div class="calendar-container" style="flex: 1; margin-left: 10%; margin-top: 10px;">
        <%@include file="/WEB-INF/include/calender.jsp" %>
    	</div>
		</div>


       <hr>
       <div class="sub_content">
        <table class="sub_table">
        <tr>
           <td>예약 오픈 일자</td>
           <td>
           <input  name="open_date" type="date" style="width: 600px;"onchange=vaildOpendate(this)>
           <p class="sub_guide" style="font-size: 16px; font-weight: 300 ;margin-bottom: -19px;">사전예약을 오픈할 날짜를 지정해주세요! 이미오픈된 예약은 변경 불가합니다.</p>
           </td>
          </tr>
          </table> 
        </div>
       
       <hr>
       <div class="sub_content">
        <table class="sub_table">
        <tr>
           <td>예약시 주의 사항</td>
           <td><input class="sub_link"  value="${reservation.notes}" name="notes" type="text" placeholder="예약시 주의사항을 입력하세요"></td>
          </tr>
          </table> 
        </div>
        
      </div>      
     </div>     
    </div>       
  
    
    <!-- ------------------------------------------------------------- -->
    
        <div class="content_body" id="content5" style="display: none;">
         <div class="sub_content">
         <table class="sub_table">     
         <tr>
           <td>예약시스템링크</td>
           <td><input class="sub_link" name="link" type="text" placeholder="예약 홈페이지 링크를 복사해주세요"></td>
	     </tr>
	     </table>
	     </div>
	     </div>
	     
 
 <div class="cover_layout">
 <input class="btn2" type="submit" value="등록">
  </div>



  
	     
    </main>
    </div>
   </form> 
   	 
<script>
  
const linkElement = document.querySelector('input[name="link"]');
const btnNEl = document.querySelector('#btn_n');
const btnAEl = document.querySelector('#btn_a');
const btnWEl = document.querySelector('#btn_w');
const btnOkEl = document.querySelector('#btn_ok');
const btnNoEl = document.querySelector('#btn_no');
const openDateElement = document.querySelector('input[name="open_date"]');



// 수정 폼에 예약 정보 받기
const rStatus = '${reservation.status}';
console.log(rStatus);
if (rStatus) {
    
    switch (rStatus) {
        case '현장문의':
            toggleContent('content1', ['content2', 'content3'], btnNEl);
            break;
        case '사전예약':
            toggleContent('content2', ['content3', 'content1'], btnAEl);
            break;
        case '현장대기예약':
            toggleContent('content3', ['content1', 'content2'], btnWEl);
            break;
        default:
            console.log('알 수 없는 상태입니다: ' + rStatus);
    }
}

// 정규 표현식 패턴: "P" 다음의 숫자 만들기
function getNumberAfterP(planName) {
  
    const regex = /P(\d+)/;
    const match = planName.match(regex);

    if (match) {
        return match[1]; 
    }
    return null; 
}
const uniqueNumbers = new Set(); 

//시간 변환 로직
function jsonTime(dateArray){

	
	const year = dateArray[0];
	const month = String(dateArray[1]).padStart(2, '0'); 
	const day = String(dateArray[2]).padStart(2, '0'); 
	const hour = String(dateArray[3]).padStart(2, '0'); 
	const minute = String(dateArray[4]).padStart(2, '0'); 

	// 최종 문자열 생성
	const formattedDateTime = `\${hour}:\${minute}`;

	return  formattedDateTime;
	
}
let planCountArray = [];
let plans = []; // 생성된 플랜을 저장할 배열
//사전예약 정보 받기
const rlink = '${reservation.link}'? '${reservation.link}' : null;

 // 사전예약 기능 이용 x 시
if(rlink){
	linkElement.value ='${reservation.link};'
	toggleSubContent('content5', 'content2', btnNoEl)
	
	//사전예약 기능 이용 시
}else {
	const openDate = '${reservation.open_date}'; 
	if(openDate) {
	const utcDateStr = openDate.replace('KST', 'UTC+0900');
	const date = new Date(utcDateStr);
	console.log(date);
	const yyyy = date.getFullYear();
	const mm = String(date.getMonth() + 1).padStart(2, '0'); 
	console.log(mm);
	const dd = String(date.getDate()).padStart(2, '0');
	const formattedDate = `\${yyyy}-\${mm}-\${dd}`;
	document.querySelector('input[name="open_date"]').value = formattedDate;
	toggleSubContent('content4', 'content2', btnOkEl)
      }	

	
	
	//플랜용
	const dateList = JSON.parse('${dateList}');
	console.log(dateList);
	for (let dates of dateList) {
		let planName = dates.plan
	    let planCount = getNumberAfterP(planName);
	   uniqueNumbers.add(planCount);          	    
	 }
	
	planCountArray = Array.from(uniqueNumbers);
	console.log("planCountArray 값 이 뭐냐 " + planCountArray);
	for (let planCount of planCountArray) {
		let deleteReject = 'reject';
		let updatePlan = createPlanElement(planCount,deleteReject);	
	    plans.push(planCount);
		console.log("planCount이 뭔지 찾습니다" + planCount);
		document.getElementById('plansContainer').appendChild(updatePlan);
	
	}
	
	
	// 플랜-날짜	
	for (let dates of dateList) {
		let planName = dates.plan
		let rsDate = dates.reservation_start_date
		let reDate = dates.reservation_end_date
		
		let startDate = new Date(rsDate);
		let endDate = new Date(reDate);
	    console.log('말해'+startDate);
	    console.log(endDate);
	   let planCount = getNumberAfterP(planName);
	   uniqueNumbers.add(planCount);          
	   periods.push({ start: startDate, end: endDate });
	   console.log(periods);
	   periodCount++;
       console.log('시작')
	   addNewPeriodForm(startDate,endDate,planCount);
	   highlightDates();
	}	
	
 }	
	
	
//플랜 넣는 중 	
    const planList = JSON.parse('${planList}'); // JSON 문자열을 객체로 변환

        console.log('배열확인planList: ' +planList);
 
for (const plans of planList) { // for...of 사용
	let subIndex = 1;
    for (const plan of plans) { // 각 plans 배열을 반복
        let planName = plan.plan;
        let planStart = plan.start_time;
        let planEnd = plan.end_time;
        let planMax = plan.max_number;
        let rpIdx = plan.rp_idx;
        console.log('rpIdx : '+rpIdx);      
        startInput = jsonTime(planStart);
        endInput = jsonTime(planEnd);
        let planCount = getNumberAfterP(planName);

        let updateChild = createSubDayElement(planCount,subIndex,startInput,endInput,planMax,rpIdx);
        let planClass = `.Plan\${planCount}`
        const SubInputDiv = document.querySelector(planClass);
        SubInputDiv.appendChild(updateChild);                    
        subIndex++ ;            
    }
}




/* 여기서 부터 등록 코딩 */
 

function validateTimes(startInput, endInput) {
    const startTime = startInput.value;
    const endTime = endInput.value;

    if (startTime && endTime && startTime >= endTime) {
        alert("마감시간은 오픈시간보다 이전일 수 없습니다.");
        endInput.value = "";   
        startInput.value="";
    }
}







//변수
const formEl = document.getElementsByTagName('form')[0];	
//폼 제출 시 Enter 키 입력방치처리
$(formEl).on('keydown', function(event) {
 if (event.keyCode === 13) {	  	   
	        event.preventDefault();    
 }
});

function vaildOpendate(date){
    const open = new Date(date.value);
    const today = new Date(); // 현재 날짜
	 
	if(open<today){
		date.value = "";
		alert('예약은 현재날짜보다 이후에 오픈 할 수 있습니다');		
	}
}
//null 값 유효성 검사


function validateForm() {
    const statusElement = document.querySelector('input[name="status"]');

    const aiElement = document.querySelector('#advanceInput');
    const reservationEndDates = document.querySelectorAll('.config_end_date');
    const planSelects = document.querySelectorAll('.sub_plan_select'); 

    
    
    
    if(statusElement.value == '') {
        alert('예약기능을 선택하세요');
        return false; // 폼 제출을 방지
    }else if (statusElement.value === '사전예약'){
    	if(aiElement.value == ''){
    		alert('사전예약기능 종류를 선택하세요');	
    		return false;	
    	}    	
    }
    
    if (aiElement.value === '사용가능'){
      if (reservationEndDates.length === 0){
         alert('예약날짜와 플랜을 설정하세요');	
    	return false;
      }else if(openDateElement.value == ''){
    	  alert('오픈 날짜를 설정하세요');	
    	  return false;
    	  
      }else{
    	  
          for (let i = 0; i < planSelects.length; i++) {
              if (planSelects[i].value === '플랜선택') {
            	  alert('플랜을 선택해주세요')
            	  return false;
              }
          }     	
      }
    }
   
    
    return true; // 폼 제출 허용
}





////////////////////////////////////////////////////////////////////////


function toggleContent(currentId, otherIds, button) {
	
	
	 if (event && event.type === 'click' && button.tagName === 'A') {
	        event.preventDefault(); // a 태그일 경우 기본 동작 방지
	    }
	
	
    const currentDiv = document.getElementById(currentId);
    const isCurrentlyVisible = currentDiv.style.display === 'block';

   
    otherIds.forEach(id => {
        const otherDiv = document.getElementById(id);
        otherDiv.style.display = 'none';
    });

    const statusValue = button.getAttribute('data-status');
    
    if (isCurrentlyVisible) {
        currentDiv.style.display = 'none'; // 현재 내용 숨기기
        button.classList.remove('active'); 
        document.getElementById('statusInput').value = "";
        let statusValue ="";
        resetFrom(statusValue);
        
    } else {
        currentDiv.style.display = 'block'; // 현재 내용 표시
        resetButtons(); 
        button.classList.add('active');
        document.getElementById('statusInput').value = statusValue;
        resetFrom(statusValue);
    }

    const subContents = ['content4', 'content5'];
    subContents.forEach(id => {
        const subDiv = document.getElementById(id);
        subDiv.style.display = 'none'; 
    });
    resetSubButtons(); 
}


//staust삭제 
function resetFrom(statusValue){
    if(statusValue === '현장문의' ||  statusValue === '현장대기예약' || statusValue === ""){
    	
    	//사전예약기능사용여부
    	document.getElementById('advanceInput').value  ="";
    	//사전예약 내용 리셋
    	document.getElementById('plansContainer').innerHTML = "";
    	openDateElement.value="";
    	document.querySelector('input[name="notes"]').value="";
    	periods = []; 
    	periodCount = 0; 
    	document.getElementById('periods').innerHTML = "";
    	highlightDates();
    	
    	
    	//예약 링크 리셋
	    if (linkElement.hasAttribute('required')) {
            linkElement.removeAttribute('required'); 
            linkElement.value="";
        } else {
            console.log('처음부터 required 속성이 없습니다.');  
        }
    	
    }	
	
}


function toggleSubContent(subContentId, parentContentId, button) {
	
	 if (event && event.type === 'click' && button.tagName === 'A') {
	        event.preventDefault(); // a 태그일 경우 기본 동작 방지
	    }
	 
	 
    const subContentDiv = document.getElementById(subContentId);
    const isCurrentlyVisible = subContentDiv.style.display === 'block';
    
  
    const rqValue = button.getAttribute('data-rq');
    document.getElementById('advanceInput').value = rqValue;
    
    
    
    console.log(rqValue);
    if(rqValue === '사용불가'){
    	linkElement.setAttribute('required', 'required');
        console.log(linkElement);
        
        
    	document.getElementById('plansContainer').innerHTML = "";
    	openDateElement.value="";
    	document.querySelector('input[name="notes"]').value="";
    	periods = []; 
    	periodCount = 0; 
    	document.getElementById('periods').innerHTML = "";
    	highlightDates();
    	
        
    }else if (rqValue === '사용가능'){
    	
    	    if (linkElement.hasAttribute('required')) {
            linkElement.removeAttribute('required'); 
            linkElement.value="";
            console.log('required 속성이 제거되었습니다.');
        } else {
            console.log('required 속성이 없습니다.'); 
        }
    	    console.log(linkElement);
    }
    
    
    const subContents = ['content4', 'content5'];
    subContents.forEach(id => {
        const subDiv = document.getElementById(id);
        subDiv.style.display = 'none';
    });

    
    if (isCurrentlyVisible) {
        subContentDiv.style.display = 'none'; 
        button.classList.remove('active'); 
    } else {
        subContentDiv.style.display = 'block'; 
        resetSubButtons(); 
        button.classList.add('active'); 

        
        const parentButton = document.querySelector(`.button[onclick*="${parentContentId}"]`);
        if (parentButton) {
            parentButton.classList.add('active'); 
        }
    }
}


function resetButtons() {
    const buttons = document.querySelectorAll('.button');
    buttons.forEach(btn => {
        btn.classList.remove('active');
    });
}


function resetSubButtons() {
    const buttons = document.querySelectorAll('.button');
    buttons.forEach(btn => {
        // 버튼의 onclick 속성이 toggleSubContent인 경우에만 초기화
        if (btn.getAttribute('onclick') && btn.getAttribute('onclick').includes('toggleSubContent')) {
            btn.classList.remove('active'); // 서브 버튼에서 active 클래스 제거
        }
    });
}
    
    //3.플랜설정하기 버튼--------------------------------------------------------------------------
     let  planCount ;
    if (planCountArray.length === 0) {
   
    planCount = 1; 
    console.log('planCountArray가 비어 있습니다. 기본값으로 1을 설정합니다.');
     } else {
    
    planCount = 1 + Number(planCountArray[planCountArray.length - 1]);

     }
     
     console.log('값플랜 어레이 : '+planCountArray[planCountArray.length - 1]); 
     console.log('값플랜 어레이 : '+planCountArray.length ); 
     
     
        // 플랜 추가 버튼 클릭 이벤트
        document.getElementById('addPlanButton').addEventListener('click', function() {
        	 event.preventDefault();
            // 새로운 플랜 요소 생성 후 DOM에 추가
            const newPlanElement = createPlanElement(planCount);
            document.getElementById('plansContainer').appendChild(newPlanElement);

            plans.push(planCount);
            planCount++; // 플랜 수 증가
            // 새로운 플랜을 plans 배열에 추가
            updatePlanSelectOptions();
        });
            

        // 새로운 플랜 요소를 생성하는 함수
        function createPlanElement(planCount,deleteReject) {
            const newPlan = document.createElement('div');
            newPlan.className = 'content_body';
            newPlan.style.position = 'relative';
            
            const subTitle = document.createElement('div');
            subTitle.className = 'sub_title';
            subTitle.innerText = '플랜'+planCount;

            const closeButton = document.createElement('button');
            closeButton.innerText = 'x';
            closeButton.style.position = 'absolute'; // 절대 위치 지정
            closeButton.style.top = '10px'; // 위쪽 여백
            closeButton.style.right = '20px'; // 오른쪽 여백
            closeButton.style.color = 'red'; 
            closeButton.style.backgroundColor = 'transparent'; // 배경색 투명
            closeButton.style.border = 'none'; // 테두리 없애기
            closeButton.style.fontSize = '20px'; // 폰트 크기 증가
            closeButton.style.cursor = 'pointer'; // 커서 포인터로 변경           
            
            if( deleteReject == undefined) {
            closeButton.onclick = function() {         	
            	console.log(planCount);
            	plans = plans.filter(plan => plan !== planCount);
            	console.log(plans);
            	updatePlanSelectOptions();
                newPlan.remove(); // 플랜 삭제
            };
            }else {    
            	
          	 closeButton.onclick = function(event) {  
          		 alert('이미 만들어진 플랜은 삭제할 수 없습니다') 
          		event.preventDefault();
          	 }
           	
            	
            }
          // 플랜 제목과 닫기 버튼을 함께 추가
            subTitle.appendChild(closeButton);            
            const addButton = document.createElement('div');
            addButton.className = 'btn3';
            addButton.innerText = '추가';
            addButton.onclick = function() {
                addToPlans(addButton); // 버튼을 통해 서브 플랜 추가
            };
            const subContent = document.createElement('div');
            subContent.className = 'sub_content';
            subContent.className = 'Plan'+ planCount;            

            // click  생성시에만 추가
       	 if (event && event.type === 'click') { 	         	   
            // 기본 서브 플랜 추가
            const initialSubDay = createSubDayElement(planCount, 1);
            subContent.appendChild(initialSubDay);
       	 }                        
            newPlan.appendChild(subTitle);
            newPlan.appendChild(addButton);
            newPlan.appendChild(subContent);
            
            return newPlan; // 생성된 플랜 요소 반환
        }

        
        
        // 새로운 서브 플랜을 생성하는 함수
        function createSubDayElement(planCount, subDayIndex,planStart,planEnd,planMax,rpIdx) {
            const subDay = document.createElement('div');
            subDay.className = 'sub_day';

            const stepLabel = document.createElement('p');
            stepLabel.innerText = subDayIndex+'차';

            
           //PlAN db 용 input
            let rpIndex = subDayIndex - 1;
            const planName = document.createElement('input'); 
            planName.type='hidden';
            if( planStart == undefined){
            planName.name='rp_plan';
            }
            planName.value= 'P'+ planCount;
           
            console.log(planName.name);
            //
            
            const timeStart = document.createElement('input');
            timeStart.type = 'time';
            timeStart.className = 'time_start2';
            timeStart.value = planStart;    
            
            if( planStart !== undefined){
            timeStart.setAttribute('readonly', 'readonly');	
              }else {
            timeStart.name = 'start_time';           	             	  
              }
            timeStart.setAttribute('required', 'required');
            timeStart.onchange = function() { validateTimes(this, this.nextElementSibling); };
          
            const timeEnd = document.createElement('input');
            timeEnd.type = 'time';
            timeEnd.className = 'time_end2';
            timeEnd.value = planEnd; 
            if( planEnd !== undefined){
            	timeEnd.setAttribute('readonly', 'readonly');	
                  }else {
            timeEnd.name ='end_time';                	  
                  }
            timeEnd.setAttribute('required', 'required');
            timeEnd.onchange = function() { validateTimes(this.previousElementSibling, this); };

            
            const numberMax = document.createElement('input');
            numberMax.type = 'number';
            numberMax.className ='sub_brand';
            if( planEnd == undefined){
            numberMax.name ='max_number';
            }else{
            numberMax.setAttribute('data-ob', 'max_number'); 	
            numberMax.onchange = function() {
                // 여기에 onchange 이벤트가 발생했을 때 실행할 코드를 작성합니다.
             maxchange(this,rpIdx);              
            };
            } 
            numberMax.value = planMax; 
            numberMax.setAttribute('required', 'required');
            numberMax.placeholder = '인원수';
           

            
            subDay.appendChild(stepLabel);
            subDay.appendChild(planName);
            subDay.appendChild(timeStart);
            subDay.appendChild(timeEnd);
            subDay.appendChild(numberMax);
            
            return subDay; 
        }

        
        function addToPlans(button) {
            const subContentDiv = button.nextElementSibling; 
            const subDays = subContentDiv.querySelectorAll('.sub_day');
            const newSubDayIndex = subDays.length + 1;
            
            const text = button.previousSibling.innerText; 
            const number = text.match(/\d+/);
            console.log(number[0]);
            // 새로운 sub_day 요소 생성하여 추가
            const newSubDay = createSubDayElement(number[0], newSubDayIndex);
            //parseInt(button.previousSibling.innerText.split(' ')[1])
            subContentDiv.appendChild(newSubDay); // sub_content에 추가
        }

      //////////////////////////////////////////////////////////////////  

function maxchange(element,rpIdx) {
    
    const max_number = element.value;
    const config = element.getAttribute('data-ob'); // 'getAttrbute'는 오타입니다. 'getAttribute'로 수정했습니다.
  console.log('element : '+ element);
  console.log('config : '+ config);
  console.log('rpIdx : '+ rpIdx);
    // 서버에 보낼 데이터 객체 생성
    const data = {
        max_number: max_number,
        rp_idx: rpIdx,
        config: config
    };
    // fetch를 사용하여 데이터 전송
    fetch('/Reservation/MaxNum/Update', {
        method: 'POST', // 또는 'PUT' 등 필요한 HTTP 메서드 사용
        headers: {
            'Content-Type': 'application/json' // JSON 형식으로 전송
        },
        body: JSON.stringify(data) // 데이터를 JSON 문자열로 변환
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('네트워크 응답이 좋지 않습니다.');
        }
        return response.json(); // 응답을 JSON으로 변환
    })
    .then(data => {
        console.log('datadata : ' +data);
        console.log('datadata2 : ' +String(data));

        element.value = String(data); // 응답 데이터에서 value를 가져와서 업데이트
    })
    .catch(error => {
        console.error('문제가 발생했습니다:', error);
    });
	
	
}      
      
      
    </script>
 <script src="/js/authcompany.js" defer></script>    
</body>
</html>
