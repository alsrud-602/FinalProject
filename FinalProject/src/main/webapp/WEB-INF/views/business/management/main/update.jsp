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
 <form action="/Business/Management/Main/update" method="POST" enctype="multipart/form-data" 
       onsubmit="return validateForm()">
 <input type="hidden" name="detail_idx" value="${store.detail_idx}">      
 <input type="hidden" name="store_idx" value="${store.store_idx}">      
 <input type="hidden" name="company_idx" value="${store.company_idx}">      
 <input type="hidden" name="operation_idx" value="${store.operation_idx}">      
    <main>




 <div class="title">
   <p>입점 전 필요한 팝업정보를 수정하세요</p>
   <p>팝업스토어 수정</p>
 </div>  
   <p id="title_guide">*수정 불가 항목은 관리자요청 부탁드립니다.</p>

  
  <div class="content_body">
    <div class="sub_title">기본정보</div>
    <div class="sub_content">
      <table class="sub_table">
        <tr>
           <td>팝업스토어명칭</td>
           <td>${store.title}</td>
        </tr>
        <tr>
           <td>카테고리</td>
           <td>
           <c:forEach var="c" items="${categoryList}" varStatus="status">
            ${c.category_name} 
		    <c:if test="${!status.last}">
		    &nbsp;&nbsp;|&nbsp;&nbsp;
		    </c:if>
                     
           </c:forEach>      
           </td>
        </tr>        
        <tr>
           <td>브랜드</td>
           <td>
               ${store.brand1} 
              <c:if test="${not empty store.brand2}">
               &nbsp;&nbsp;|&nbsp;&nbsp;${store.brand2} 
              </c:if>           
            </td>
        </tr>        
        <tr>
           <td>주 타겟 연령대</td>
           <td>${store.age}</td>
        </tr>        
      </table>
  </div>
 </div>

  <div class="content_body">
    <div class="sub_title">상세정보</div>
    <div class="sub_content">
      <table class="sub_table">
        <tr>
           <td>팝업스토어 주소</td>
           <td>
           
           <div id="sub_adress">
             <input value="${store.address}"  name="address"  required type="text"  id="roadFullAddr" class="sub_link" placeholder="주소검색 버튼을 눌러주세요" style="width:620px; margin: 0 10px 0 0;">
             <div class="btn3" onclick="searchAddress()" >주소검색</div>
           </div>
          
           </td>
        </tr>
        <tr>
        <td>운영기간</td>
         <td> 
         <div class="sub_day">
          <input   value="${store.start_date}" name="start_date" required onchange="vailddateOperation(this,document.getElementById('pop_end'))"  id="pop_start"class="sub_input_date"type="date" placeholder="시작날짜"> 
          &nbsp;&nbsp;<p>-</p>&nbsp;&nbsp;
           <input   value="${store.end_date}" name="end_date" required onchange="vailddateOperation(document.getElementById('pop_start'),this)"  id="pop_end"class="sub_input_date"type="date" placeholder="마감날짜">
               
             
               </div> 
          </td>
             
        </tr>        
        <tr>
           <td>영업시간</td>
           <td>
            <c:forEach var="entry" items="${daysOfWeek}">
            <div class="sub_day">
               <p>${entry.value}</p>

               <input                  
                name="S${entry.key}" required type="time" id="${entry.key}_START" class="time_start" 
                onchange="validateTimes(this,document.getElementById('${entry.key}_END') )">
               <p>-</p>&nbsp;&nbsp;
               <input   
               name="E${entry.key}" required type="time" id="${entry.key}_END" class="time_end" 
                 onchange="validateTimes(document.getElementById('${entry.key}_START'), this)">
             </div>
             </c:forEach>
            
             <div class="sub_day_full">
             <p>전체</p>
             <input  type="time" id="FULL_START" 
             onchange="validateTimes( this,document.getElementById('FULL_END'))">
             <p>-</p>&nbsp;&nbsp;
             <input type="time"   id="FULL_END" 
             onchange="validateTimes(document.getElementById('FULL_START'), this)">
             <div class="btn3" onclick="applyAllTimes()">일괄적용</div>
             </div>
             <div class="sub_day_full">
             <input name="onotes" value="${store.onotes}"class="sub_note"type="text" placeholder="특이사항이 있으면 남겨주세요">
             </div>
           </td>
        </tr>        
        <tr>
           <td>홈페이지 링크</td>
           <td><input value="${store.homepage}" name="homepage" class="sub_link"type="text" placeholder="홈페이지 링크를 복사해 주세요"></td>
        </tr>        
        <tr>
           <td>SNS 링크</td>
           <td><input value="${store.sns}" name="sns" class="sub_link"type="text" placeholder="SNS 링크를 복사해 주세요"></td>
        </tr>        
        <tr>
           <td>해시태그</td>
           <td>
           <input type="text" id="inputHash" onkeydown="checkEnter(event)" placeholder="#없이 입력 후 ENTER로 해쉬태그를 입력하세요">
           <div class="sub_flex">
           <c:forEach var="tag" items="${tagList}" >
            <div class="sub_hash">${tag.tag_name}<span onclick="deleteHash(this)">
			<img src="/images/icon/delete2.png"></span><input type="hidden" name="tag_name"value="${tag.tag_name}"/></div>
			
		  </c:forEach>	
			
           </div>
           </td>
        </tr>        
      </table>
  </div>
 </div>
 
   <div class="content_body">
    <div class="sub_title">팝업 상세 내용</div>
    
    <div class="sub_content">
      <table class="sub_table">
       <tr>
         <td>소개 한 줄</td>      
         <td><input value="${store.introduction}" required name="introduction" class="sub_link"  type="text" placeholder="팝업을 소개할 문구를 완성해 보세요">
         <p class="sub_guide" >소개 한줄은 목록상단에 기재되어 고객들에게 안내될 예정입니다</p></td>      
       </tr>
       <tr >
         <td>상세내용</td>      
         <td><textarea name="content" required id="sub_textarea" placeholder="팝업스토어에 구체적인 내용을 작성하세요" >${store.content}</textarea></td>      
       </tr>
       <tr>
         <td>굿즈 특이사항</td>      
         <td><input value="${store.goods}" name="goods" class="sub_link"  type="text" placeholder="강조하고 싶은 굿즈가 있다면 작성하세요"></td>      
       </tr>
       <tr>
         <td>팝업환경</td>      
         <td>
           <select name="parking" class="sub_select">
             <option value="" >주차정보</option>
             <option  value="주차불가" <c:if test="${store.parking == '주차불가'}"> selected</c:if>>주차불가</option>
             <option  value="주차가능" <c:if test="${store.parking == '주차가능'}"> selected</c:if>>주차가능</option>
           </select>
           <select name="fare" class="sub_select">
             <option value="">요금</option>
             <option value="무료"<c:if test="${store.fare == '무료'}"> selected</c:if>>무료</option>
             <option value="유료"<c:if test="${store.fare == '유료'}"> selected</c:if>>유료</option>
           </select>
           <select name="age_limit"  class="sub_select">
             <option value="">연령제한</option>
             <option value="19세 이상"<c:if test="${store.age_limit == '19세 이상'}"> selected</c:if>>19세 이상</option>
             <option value="15세 이상"<c:if test="${store.age_limit == '15세 이상'}"> selected</c:if>>15세 이상</option>
             <option value="전 연령 가능"<c:if test="${store.age_limit == '전 연령 가능'}"> selected</c:if>>전 연령 가능</option>
             <option value="노키즈 존"<c:if test="${store.age_limit == '노키즈 존'}"> selected</c:if>>노키즈 존</option>
           </select>
           <select name="shooting"  class="sub_select">
             <option value="">사진촬영여부</option>
             <option value="촬영 가능"<c:if test="${store.shooting == '촬영 가능'}"> selected</c:if>>촬영 가능</option>
             <option value="촬영 불가"<c:if test="${store.shooting == '촬영 불가'}"> selected</c:if>>촬영 불가</option>
           </select>        
         </td>      
       </tr>
       <tr>
         <td>홍보이미지</td>
         <td>
		 <div class="sub_flex2">
		    <label for="file-input" class="btn4">
		        파일 선택
		    </label>
           <input id="file-input" name="upfile" type="file" accept=".jpg, .jpeg, .png" style="display: none;" multiple  />
         </div>
      <div>
     <c:forEach var="img" items="${imageList}">
      <div class="file-item"><span>${img.imagename}</span>&nbsp;<a class="deleteImage" href="/DeleteImage?is_idx=${img.is_idx}">x</a></div>   
      </c:forEach>     
     <div id="file-name-container">
      </div>
     </div>       
         </td>
       </tr>
      
      </table>
    </div>
 </div> 
 
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
    <div style=" display: flex; justify-content: space-between; margin-bottom: 20px;">
    <p>플랜설정하기</p>
    <a href="#" class="btn3" id="addPlanButton">플랜추가</a>
    </div>
    
    <div id="plansContainer" style="width:1000px;"> 
      <div id="plansContainer" style="width:1000px;"></div>
        </div>
  

       <hr>
       <p>기간설정하기</p>  
       <span id="read_guide">사전예약받을 기간과 플랜을 적용하세요. 플랜과 기간은 운영페이지에서 수정이 가능합니다.<br>
       *추후 오픈예정인 기간은 해당 오픈날짜에 수정을 통해 추가가능합니다</span> 
       
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
    
   </form> 
<script>
  $('.deleteImage').on('click',function(event){
	
	event.preventDefault();   
	event.stopPropagation();  
	let aDelete = this; 
	
	//서버에서 파일과 Files table의 정보를 삭제하고 돌아온다
	$.ajax({
		url : this.href,
		method:'GET'
	}).done(function(result){
		$(aDelete).parent().remove();
	}).fail(function(error){
		console.log(error);
		alert('서버오류발생:' + error + '관리자에게문의하세요')
	})
	
  })
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
		let updatePlan = createPlanElement(planCount);	
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
        console.log('배열확인');
        console.log(planList);
 
for (const plans of planList) { // for...of 사용
	let subIndex = 1;
    for (const plan of plans) { // 각 plans 배열을 반복
        let planName = plan.plan;
        let planStart = plan.start_time;
        let planEnd = plan.end_time;
        let planMax = plan.max_number;
        
        startInput = jsonTime(planStart);
        endInput = jsonTime(planEnd);
        let planCount = getNumberAfterP(planName);

        let updateChild = createSubDayElement(planCount,subIndex,startInput,endInput,planMax);
        let planClass = `.Plan\${planCount}`
        const SubInputDiv = document.querySelector(planClass);
        SubInputDiv.appendChild(updateChild);                    
        subIndex++ ;            
    }
}







// 운영시간 값 넣기
    document.querySelector('input[name="SMON"]').value = '${store.smon}';
    document.querySelector('input[name="EMON"]').value = '${store.emon}';   
    document.querySelector('input[name="STUE"]').value = '${store.stue}';
    document.querySelector('input[name="ETUE"]').value = '${store.etue}';   
    document.querySelector('input[name="SWED"]').value = '${store.swed}';
    document.querySelector('input[name="EWED"]').value = '${store.ewed}';
    document.querySelector('input[name="SFRI"]').value = '${store.sfri}';
    document.querySelector('input[name="EFRI"]').value = '${store.efri}';    
    document.querySelector('input[name="SSAT"]').value = '${store.ssat}';
    document.querySelector('input[name="ESAT"]').value = '${store.esat}';    
    document.querySelector('input[name="SSUN"]').value = '${store.ssun}';
    document.querySelector('input[name="ESUN"]').value = '${store.esun}';
    
    document.querySelector('input[name="STHU"]').value = '${store.sthu}';
    document.querySelector('input[name="ETHU"]').value = '${store.ethu}';


/* 여기서 부터 등록 코딩 */
 
function searchAddress() {
    window.open("/Business/SearchAddress","pop","width=570,height=430, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadFullAddr){
    document.getElementById('roadFullAddr').value = roadFullAddr;
}



function vailddateOperation(startDate, endDate){

    const start = new Date(startDate.value);
    const end = new Date(endDate.value);
    const today = new Date(); // 현재 날짜
    // 시작 날짜가 현재 날짜보다 미래인 경우 시작 날짜 비우기
    if (start < today) {
        alert("선택 날짜는 현재 날짜보다 이후여야 합니다.");
        startDate.value = "";
    }else if (end < today) {
        alert("선택 날짜는 현재 날짜보다 이후여야 합니다.");
        endDate.value = "";
    }else if(start && end && start  >= end){
		alert("시작 날짜는 종료 날짜보다 빨라야 합니다");	
		startDate.value ="";
		endDate.value ="";	
	}
	
	
}

function validateTimes(startInput, endInput) {
    const startTime = startInput.value;
    const endTime = endInput.value;

    if (startTime && endTime && startTime >= endTime) {
        alert("마감시간은 오픈시간보다 이전일 수 없습니다.");
        endInput.value = "";   
        startInput.value="";
    }
}

function applyAllTimes() {
    // 전체 시작 및 종료 시간 입력 필드의 값 가져오기
    const fullStartTime = document.getElementById('FULL_START').value;
    const fullEndTime = document.getElementById('FULL_END').value;

    if(fullStartTime ==='' || fullEndTime ===''){
    	alert('전체 운영시간 값을 입력하세요')
    	
    }else{
    	// 모든 시작 시간 입력 필드에 값 설정
        const startInputs = document.querySelectorAll('.time_start');
        startInputs.forEach(input => {
            input.value = fullStartTime;
        });

        // 모든 종료 시간 입력 필드에 값 설정
        const endInputs = document.querySelectorAll('.time_end');
        endInputs.forEach(input => {
            input.value = fullEndTime;
        });	
    }
    
    
}

const hashInput =document.getElementById('inputHash')
const hashContainer  = document.querySelector('.sub_flex')

function checkEnter(event){
	if(event.key === 'Enter'){		
		let hashValue = hashInput.value;
    console.log(hashValue)
		if(hashValue === '' || hashValue.length < 1){
			alert('태그명을 입력하세요')
		}else{
			const divHashInput = `<div class="sub_hash">\${hashValue}<span onclick="deleteHash(this)">
			<img src="/images/icon/delete2.png"></span><input type="hidden" name="tag_name"value="\${hashValue}"/></div>
			
			`
		    hashContainer.innerHTML += divHashInput;
			hashInput.value="";
		}		
	}	
}

function deleteHash(element) {
    const subHashDiv = element.parentElement;
    subHashDiv.remove();	
}


//파일 저장 로직
const fileInput = document.getElementById('file-input');
const fileNameContainer = document.getElementById('file-name-container');
// 파일 목록을 저장할 배열
let fileList = [];

fileInput.addEventListener('change', function() {
	console.log('버튼 파일 ')
	console.log(this.files)
	
	// 새로 선택된 파일들
    const newFiles = Array.from(this.files); 

    fileList = fileList.concat(newFiles); 
   // 화면에 파일 보이는 메소드
    displayFileNames(); 
    // 업로드 파일 리스트에 업로드 하기
    updateFileInput();
});

function displayFileNames() {
    fileNameContainer.innerHTML = '';
    fileList.forEach((file, index) => {
        const fileItem = document.createElement('div');
        fileItem.className = 'file-item';

        const fileNameSpan = document.createElement('span');
        fileNameSpan.textContent = file.name;

        const deleteButton = document.createElement('span');
        deleteButton.textContent = 'x';
        deleteButton.className = 'delete-button';

        // 삭제 기능 추가
        deleteButton.addEventListener('click', function() {
            fileList.splice(index, 1); // 배열에서 파일 삭제
            displayFileNames(); // 화면 업데이트
            updateFileInput(); // 파일 입력 업데이트
        });

        fileItem.appendChild(fileNameSpan);
        fileItem.appendChild(deleteButton);
        fileNameContainer.appendChild(fileItem); // 파일 이름 추가
    });
}

function updateFileInput() {
    const dataTransfer = new DataTransfer();
    fileList.forEach(file => dataTransfer.items.add(file));
   // 파일 입력 업데이트
    fileInput.files = dataTransfer.files;     
	console.log(fileInput.files)
}

//변수
const formEl = document.getElementsByTagName('form')[0];	
//폼 제출 시 Enter 키 입력방치처리
$(formEl).on('keydown', function(event) {
 if (event.keyCode === 13) {
	   const textarea = document.querySelector('#sub_textarea'); // textarea의 id를 사용하여 선택
	    if (event.key === 'Enter' && document.activeElement !== textarea) {
	        event.preventDefault(); // textarea가 아닌 경우에만 기본 동작 방지
	    }
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
    const TagElement = document.querySelectorAll('input[name="tag_name"]');


    const parkingElement = document.querySelector('select[name="parking"]');
    const fareElement = document.querySelector('select[name="fare"]');
    const ageLimitElement = document.querySelector('select[name="age_limit"]');
    const shootingElement = document.querySelector('select[name="shooting"]');
    const aiElement = document.querySelector('#advanceInput');
    const reservationEndDates = document.getElementsByName('reservation_end_date');
    const planSelects = document.querySelectorAll('.sub_plan_select'); 


    const inputsToValidate = [
        { element: parkingElement, defaultValue: '', message: '주차정보를 선택하세요' },
        { element: fareElement, defaultValue: '', message: '요금정보를 선택하세요' },
        { element: ageLimitElement, defaultValue: '', message: '연령제한 정보를 선택하세요' },
        { element: shootingElement, defaultValue: '', message: '사진촬영여부를 선택하세요' }
       
    ];       
    
    console.log(reservationEndDates.length);
    console.log(planSelects.length);
    console.log(planSelects);
    
    if (TagElement.length === 0) {
        alert('해시태그를 만들어주세요.');
        return false;
    }
    
    
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

    if (!validateInputs(inputsToValidate)) {
        return false; // 폼 제출을 방지
    }
    
    
    return true; // 폼 제출 허용
}

function validateInputs(inputs) {
    for (const { element, defaultValue, message } of inputs) {
        if (element.value === defaultValue) {
            alert(message);
            element.focus();
            return false; // 유효하지 않음
        }
    }
    return true; // 모든 입력값이 유효함
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
        function createPlanElement(planCount) {
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
            closeButton.onclick = function() {
            	
            	
            	console.log(planCount);
            	plans = plans.filter(plan => plan !== planCount);
            	console.log(plans);
            	updatePlanSelectOptions();
                newPlan.remove(); // 플랜 삭제
            };

            
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
        function createSubDayElement(planCount, subDayIndex,planStart,planEnd,planMax) {
            const subDay = document.createElement('div');
            subDay.className = 'sub_day';

            const stepLabel = document.createElement('p');
            stepLabel.innerText = subDayIndex+'차';

            
           //PlAN db 용 input
            let rpIndex = subDayIndex - 1;
            const planName = document.createElement('input'); 
            planName.type='hidden';
            planName.name='rp_plan';
            planName.value= 'P'+ planCount;
           
            console.log(planName.name);
            //
            
            const timeStart = document.createElement('input');
            timeStart.type = 'time';
            timeStart.className = 'time_start2';
            timeStart.name = 'start_time';
            timeStart.value = planStart;           
            timeStart.setAttribute('required', 'required');
            timeStart.onchange = function() { validateTimes(this, this.nextElementSibling); };
          
            const timeEnd = document.createElement('input');
            timeEnd.type = 'time';
            timeEnd.className = 'time_end2';
            timeEnd.name ='end_time';
            timeEnd.value = planEnd; 
            timeEnd.setAttribute('required', 'required');
            timeEnd.onchange = function() { validateTimes(this.previousElementSibling, this); };

            
            const numberMax = document.createElement('input');
            numberMax.type = 'number';
            numberMax.className ='sub_brand';
            numberMax.name ='max_number';
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

    </script>
 <script src="/js/authcompany.js" defer></script>    
</body>
</html>
