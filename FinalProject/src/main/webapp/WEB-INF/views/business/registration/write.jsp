<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // 요일을 키-값 쌍으로 설정
    java.util.Map<String, String> daysOfWeek = new java.util.HashMap<>();
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
<title>팝업스토어 등록</title>

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
 <form action="/Business/Registraion/Write" method="POST" enctype="multipart/form-data">
    <main>




 <div class="title_write">
   <p>입점 전 필요한 팝업정보를 수정하세요</p>
   <p>팝업스토어 등록</p>
 </div>  
   <p id="title_guide">*수정 불가 항목은 관리자요청 부탁드립니다.</p>

  
  <div class="content_body">
    <div class="sub_title">기본정보</div>
    <div class="sub_content">
      <table class="sub_table">
        <tr>
           <td>팝업스토어명칭</td>
           <td><input type="text" name="title" class="sub_link" placeholder="팝업스토어명을 입력하세요"></td>
        </tr>
        <tr>
           <td>카테고리</td>
           <td>  
           <select name="category_id" class="sub_select">
             <option>10</option>
           </select>
           <select class="category_id">
             <option>10</option>
           </select></td>
        </tr>        
        <tr>
           <td>브랜드</td>
           <td>
             메인 
             <span id="brand_red">*</span>
             <input name="brand1" type="text" class="sub_brand" placeholder="메인브랜드를 작성하세요" >
             콜라보 브랜드
             <input name="brand2" type="text"  class="sub_brand" placeholder="콜라보 브랜드를 작성하세요" ></td>
        </tr>        
        <tr>
           <td>주 타겟 연령대</td>
           <td><select name="age" class="sub_select">
             <option>연령대</option>
             <option>어린이</option>
             <option>10대</option>
             <option>10~20대</option>
             <option>20~30대</option>
             <option>30대~40대</option>
             <option>40대 ~</option>
             <option>전연령층</option>
           </select></td>
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
             <input name="address"  type="text"  class="sub_link" placeholder="주소검색 버튼을 눌러주세요" style="width:620px; margin: 0 10px 0 0;">
             <div class="btn3">주소검색</div>
           </div>
           <input type="text"  class="sub_link" placeholder="상세주소를 입력하세요" style="margin: 10px 0;" >
           </td>
        </tr>
        <tr>
        <td>운영기간</td>
         <td> 
         <div class="sub_day">
          <input  name="start_date" onchange="vailddateOperation(this,document.getElementById('pop_end'))"  id="pop_start"class="sub_input_date"type="date" placeholder="시작날짜"> 
          &nbsp;&nbsp;<p>-</p>&nbsp;&nbsp;
           <input  name="end_date" onchange="vailddateOperation(document.getElementById('pop_start'),this)"  id="pop_end"class="sub_input_date"type="date" placeholder="마감날짜">
               
             
               </div> 
          </td>
             
        </tr>        
        <tr>
           <td>영업시간</td>
           <td>
            <c:forEach var="entry" items="${daysOfWeek}">
            <div class="sub_day">
               <p>${entry.value}</p>
               <input name="S${entry.key}" type="time" id="${entry.key}_START" class="time_start" 
                onchange="validateTimes(this,document.getElementById('${entry.key}_END') )">
               <p>-</p>&nbsp;&nbsp;
               <input  name="E${entry.key}" type="time" id="${entry.key}_END" class="time_end" 
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
             <input name="onotes" class="sub_note"type="text" placeholder="특이사항이 있으면 남겨주세요">
             </div>
           </td>
        </tr>        
        <tr>
           <td>홈페이지 링크</td>
           <td><input name="homepage" class="sub_link"type="text" placeholder="홈페이지 링크를 복사해 주세요"></td>
        </tr>        
        <tr>
           <td>SNS 링크</td>
           <td><input name="sns" class="sub_link"type="text" placeholder="SNS 링크를 복사해 주세요"></td>
        </tr>        
        <tr>
           <td>해시태그</td>
           <td>
           <input type="text" id="inputHash" onkeydown="checkEnter(event)" placeholder="#없이 입력 후 ENTER로 해쉬태그를 입력하세요">
           <div class="sub_flex">
             <div class="sub_hash">굿즈판매<span onclick="deleteHash(this)"><img src="/images/icon/delete2.png"></span></div>
             <input type="hidden" name="tag_name"value="굿즈판매"/>
             <div class="sub_hash">포토부스<span onclick="deleteHash(this)"><img src="/images/icon/delete2.png"></span></div>
             <input type="hidden" name="tag_name"value="포토부스"/>
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
         <td><input name="introduction" class="sub_link"  type="text" placeholder="팝업을 소개할 문구를 완성해 보세요">
         <p class="sub_guide" >소개 한줄은 목록상단에 기재되어 고객들에게 안내될 예정입니다</p></td>      
       </tr>
       <tr >
         <td>상세내용</td>      
         <td><textarea name="content" id="sub_textarea" placeholder="팝업스토어에 구체적인 내용을 작성하세요" ></textarea></td>      
       </tr>
       <tr>
         <td>굿즈 특이사항</td>      
         <td><input name="goods" class="sub_link"  type="text" placeholder="강조하고 싶은 굿즈가 있다면 작성하세요"></td>      
       </tr>
       <tr>
         <td>팝업환경</td>      
         <td>
           <select name="parking" class="sub_select">
             <option>주차정보</option>
             <option selected>주차불가</option>
             <option>주차가능</option>
           </select>
           <select name="fare" class="sub_select">
             <option>요금</option>
             <option selected>무료</option>
             <option>유료</option>
           </select>
           <select name="age_limit"  class="sub_select">
             <option>연령제한</option>
             <option selected>19세 이상</option>
             <option>15세 이상</option>
             <option>전 연령 가능</option>
             <option>노키즈 존</option>
           </select>
           <select name="shooting"  class="sub_select">
             <option>사진촬영여부</option>
             <option selected>촬영 가능</option>
             <option>촬영 불가</option>
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
           <input id="file-input" type="file" accept="image/*" style="display: none;" multiple />
         </div>
    <div id="file-name-container">
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
          <a href="#" class="button" onclick="toggleContent('content1', ['content2', 'content3'], this)">현장문의</a>
    	  <a href="#" class="button" onclick= "toggleContent('content2', ['content3', 'content1'], this)">사전예약</a>
   		  <a href="#" class="button" onclick="toggleContent('content3', ['content1', 'content2'], this)">현장대기예약</a>
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
 		<a href="#" class="button" onclick="toggleSubContent('content4', 'content2', this)"  style="font-size: 16px; margin-left: 250px;">네! 플랫폼 기능을 사용할래요</a>
        <a href="#" class="button" onclick="toggleSubContent('content5', 'content2', this)"  style="font-size: 16px; margin-left: 30px;">아니요! 다른 자체적인 사전예약 시스템이 있습니다</a></td>
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
           <input type="date" style="width: 600px;">
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
           <td><input class="sub_link"  type="text" placeholder="예약시 주의사항을 입력하세요"></td>
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
           <td><input class="sub_link" type="text" placeholder="예약 홈페이지 링크를 복사해주세요"></td>
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



function vailddateOperation(startDate, endDate){

	const start = startDate.value;
	const end = endDate.value;
	
	if(start && end && start >= end){
		alert("시작 날짜는 종료 날짜보다 나중이어야 합니다");	
		startDate.value ="";
		endDate.value ="";	
	}
	
	
}

function validateTimes(startInput, endInput) {
    const startTime = startInput.value;
    const endTime = endInput.value;

    if (startTime && endTime && startTime >= endTime) {
        alert("종료 시간은 시작 시간보다 나중이어야 합니다.");
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
			<img src="/images/icon/delete2.png"></span></div>
			<input type="hidden" name="tag_name"value="\${hashValue}"/>
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

////////////////////////////////////////////////////////////////////////


function toggleContent(currentId, otherIds, button) {
	 event.preventDefault();
    const currentDiv = document.getElementById(currentId);
    const isCurrentlyVisible = currentDiv.style.display === 'block';

   
    otherIds.forEach(id => {
        const otherDiv = document.getElementById(id);
        otherDiv.style.display = 'none';
    });

   
    if (isCurrentlyVisible) {
        currentDiv.style.display = 'none'; // 현재 내용 숨기기
        button.classList.remove('active'); 
    } else {
        currentDiv.style.display = 'block'; // 현재 내용 표시
        resetButtons(); 
        button.classList.add('active'); 
    }

   
    const subContents = ['content4', 'content5'];
    subContents.forEach(id => {
        const subDiv = document.getElementById(id);
        subDiv.style.display = 'none'; 
    });
    resetSubButtons(); 
}

function toggleSubContent(subContentId, parentContentId, button) {
	 event.preventDefault();
    const subContentDiv = document.getElementById(subContentId);
    const isCurrentlyVisible = subContentDiv.style.display === 'block';

    
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
     let planCount = 1; 
     let plans = []; // 생성된 플랜을 저장할 배열
     
     
        // 플랜 추가 버튼 클릭 이벤트
        document.getElementById('addPlanButton').addEventListener('click', function() {
        	 event.preventDefault();
            // 새로운 플랜 요소 생성 후 DOM에 추가
            const newPlanElement = createPlanElement(planCount);
            document.getElementById('plansContainer').appendChild(newPlanElement);
            planCount++; // 플랜 수 증가
            
            // 새로운 플랜을 plans 배열에 추가
            plans.push(newPlanNumber);
            updatePlanSelectOptions(); // 플랜 선택 옵션 업데이트
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

            // 기본 서브 플랜 추가
            const initialSubDay = createSubDayElement(planCount, 1);
            subContent.appendChild(initialSubDay);

            newPlan.appendChild(subTitle);
            newPlan.appendChild(addButton);
            newPlan.appendChild(subContent);
            
            return newPlan; // 생성된 플랜 요소 반환
        }

        
        
        // 새로운 서브 플랜을 생성하는 함수
        function createSubDayElement(planCount, subDayIndex) {
            const subDay = document.createElement('div');
            subDay.className = 'sub_day';

            const stepLabel = document.createElement('p');
            stepLabel.innerText = subDayIndex+'차';

            const timeStart = document.createElement('input');
            timeStart.type = 'time';
            timeStart.className = 'time_start';
            timeStart.onchange = function() { validateTimes(this, this.nextElementSibling); };

            const timeEnd = document.createElement('input');
            timeEnd.type = 'time';
            timeEnd.className = 'time_end';
            timeEnd.onchange = function() { validateTimes(this.previousElementSibling, this); };

            const numberOfPeopleSelect = document.createElement('select');
            const option1 = document.createElement('option');
            option1.textContent = '인원수';
            numberOfPeopleSelect.appendChild(option1); // 기본 옵션 추가

            
            for (let i = 1; i <= 10; i++) {
                const option = document.createElement('option');
                option.textContent = i; // 1, 2, ..., 10
                numberOfPeopleSelect.appendChild(option);
            }

            
            subDay.appendChild(stepLabel);
            subDay.appendChild(timeStart);
            subDay.appendChild(timeEnd);
            subDay.appendChild(numberOfPeopleSelect);
            
            return subDay; 
        }

        
        function addToPlans(button) {
            const subContentDiv = button.nextElementSibling; 
            const subDays = subContentDiv.querySelectorAll('.sub_day');
            const newSubDayIndex = subDays.length + 1;

            // 새로운 sub_day 요소 생성하여 추가
            const newSubDay = createSubDayElement(parseInt(button.previousSibling.innerText.split(' ')[1]), newSubDayIndex);
            subContentDiv.appendChild(newSubDay); // sub_content에 추가
        }

        // 시간 유효성 검사 함수 (추가 필요)
       
       // 시간 유효성 검사 로직 구현
    </script>
    
</body>
</html>
