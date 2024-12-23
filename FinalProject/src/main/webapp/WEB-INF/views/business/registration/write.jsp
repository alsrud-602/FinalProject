<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팝업스토어 등록</title>

<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet"  href="/css/company_m.css" />
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

    
    
        
 .active {
            background-color: #BDFF91; 
        }
       
       
    #read_guide {
    display: block; 
    margin-left: 40px; 
    font-size: 14px; 
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


    </style>
</head>
<body>
<%@include file="/WEB-INF/include/header_company.jsp" %> 
    <main>



  <div class="content_body">     
    <div class="sub_title">예약하기</div>
  	<div class="sub_content">
  	<table class="sub_table">
  	  <tr>
		<td>예약기능</td>
		<td>    
           <div class="button-container" >
           <div class="btn10"  id="button1" onclick="toggleContent('content1', ['content2', 'content3'], this)">현장문의</div>
           <div class="btn10"  id="button2" onclick="toggleContent('content2', ['content3', 'content1'], this)">사전예약</div> 
           <div class="btn10"  id="button3" onclick="toggleContent('content3', ['content1', 'content2'], this)">현장대기예약</div>
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
 		<td><div class="btn11" onclick="toggleSubContent('content4', 'content2', this)">네! 플랫폼 기능을 사용할래요</div></td>
        <td><div class="btn12" onclick="toggleSubContent('content5', 'content2', this)">아니요! 다른 자체적인 사전예약 시스템이 있습니다</div></td>
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
        <div class="content_body">
            <div class="sub_title">플랜</div>
            <div class="btn3" id="planaddbtn" onclick="addToPlans(this)">추가</div>
            <div class="sub_content">
                <div class="sub_day">
                    <p>차</p> <!-- 초기 설정에서 1차로 하드코딩 -->
                    <input type="time" class="time_start" onchange="validateTimes(this, this.nextElementSibling)">
                    <input type="time" class="time_end" onchange="validateTimes(this.previousElementSibling, this)">
                    <select class="sub_select">
                        <option>인원수</option>
                        <option></option>
                        <option></option>
                    </select>
                </div>
            </div>
            <div id="plansContainer" style="width:1000px;"></div>
            
        </div>
  </div> 


		
       <hr>
       <p>기간설정하기</p>  
       <span id="read_guide">사전예약받을 기간과 플랜을 적용하세요. 플랜과 기간은 운영페이지에서 수정이 가능합니다.<br>
       *추후 오픈예정인 기간은 해당 오픈날짜에 수정을 통해 추가가능합니다</span> 
       
<div class="content" id="periodContainer" style="display: flex; align-items: flex-start;">
    <div class="calendar-container" style="flex: 1; margin-left: 10%; margin-top: 10px;">
        <%@include file="/WEB-INF/include/calender.jsp" %>
    </div>

  <div class="sub_content" style="flex: 1; margin-right:10% ">
        <div class="sub_day" id="plansContainer"> 
            <div id="periods">
                <div class="period" style="display: flex; align-items: center;">
                    <input type="date" class="date_start"  id="dateStart" onchange="updateCalendarHighlight()">
                    <input type="date" class="date_end"   id="dateEnd" onchange="updateCalendarHighlight()">
                    <select class="sub_select" id="planOptions">
                        <option value="0">플랜</option>
                    </select>
                </div>
                <div id="periodsContainer"> 
   				</div>
            </div>
        </div>
    </div>
</div>


       <hr>
       <p>예약 오픈 일자</p>  
               <select class="sub_select">
                   <option>시작날짜</option>
                </select>
       <span id="  ">사전예약을 오픈할 기간을 지정해주세요! 이미오픈된 예약은 변경 불가합니다.</span> 
       <hr>
       <p>예약시 주의사항</p>  
       <input type="text"  class="sub_link" placeholder="예약 홈페이지 링크를 복사해주세요">
        
        
  </div>      
        
        
         </div>   
  		 </div>
  
    
    <!-- ------------------------------------------------------------- -->
    
         <div class="content_body" id="content5" style="display: none;">
         <div class="sub_content">     
         <h2 class="sub_title">예약시스템링크</h2>  
	     <input type="text"  class="sub_link" placeholder="예약 홈페이지 링크를 복사해주세요">
	     </div>
	     </div>
	     
	     
    </main>
    
    
<script>
function toggleContent(currentId, otherIds, button) {
    const currentDiv = document.getElementById(currentId);
    const isCurrentlyVisible = currentDiv.style.display === 'block';

    // 다른 내용 숨기기
    otherIds.forEach(id => {
        const otherDiv = document.getElementById(id);
        otherDiv.style.display = 'none'; // 다른 콘텐츠 숨김
    });

    // 현재 내용 표시/숨기기
    if (isCurrentlyVisible) {
        currentDiv.style.display = 'none'; // 현재 내용 숨기기
        div.classList.remove('active'); // 클릭한 버튼 비활성화
    } else {
        currentDiv.style.display = 'block'; // 현재 내용 표시
        resetButtons(button); // 다른 버튼 비활성화
        div.classList.add('active'); // 클릭한 버튼 활성화
    }
}

function resetButtons(activeButton) {
    const buttons = document.querySelectorAll('.btn10'); // .btn10 클래스를 가진 버튼만 선택
    buttons.forEach(btn => {
    	div.classList.remove('active'); // 모든 버튼에서 active 클래스 제거
    });
    div.classList.add('active'); // 현재 클릭된 버튼에 active 클래스 추가
}
  //2.사전예약 아래 선택 버튼 ----------------------------------------------------------------------
    function toggleSubContent(subContentId, parentContentId, button) {
        const subContentDiv = document.getElementById(subContentId);
        const isCurrentlyVisible = subContentDiv.style.display === 'block';

        // 모든 서브 콘텐츠 숨기기
        const subContents = ['content4', 'content5'];
        subContents.forEach(id => {
            const subDiv = document.getElementById(id);
            subDiv.style.display = 'none';
        });

        // 클릭한 서브 콘텐츠 표시
        if (isCurrentlyVisible) {
            subContentDiv.style.display = 'none'; // 서브 콘텐츠 숨기기
            div.classList.remove('active'); // 서브 버튼 비활성화
        } else {
            subContentDiv.style.display = 'block'; // 서브 콘텐츠 표시
            resetSubButtons(); // 모든 서브 버튼 초기화
            div.classList.add('active'); // 클릭한 서브 버튼 활성화
        }
    }

    // 상위 버튼의 활성화 상태를 초기화하는 함수
    function resetButtons() {
        const buttons = document.querySelectorAll('.button');
        buttons.forEach(btn => {
        	div.classList.remove('active'); // 모든 상위 버튼에서 active 클래스 제거
        });
    }

    // 서브 버튼의 활성화 상태를 초기화하는 함수
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
  		let i = 0; // 플랜 수 카운터
        let planCount = 1; // 플랜 수 카운터 (1부터 시작)
        const periodsContainer = document.getElementById('periodsContainer');

        // 플랜 추가 버튼 클릭 이벤트
        document.getElementById('addPlanButton').addEventListener('click', function() {
            // 새로운 플랜 요소 생성 후 DOM에 추가
            const newPlanElement = createPlanElement(planCount);
            document.getElementById('plansContainer').appendChild(newPlanElement);
            planCount++; // 플랜 수 증가
            updatePlanOptions(); // 플랜 옵션 업데이트
            addPeriodElement(); // 기간 요소 추가
        });

        // 새로운 플랜 요소를 생성하는 함수
        function createPlanElement(planCount) {
            const newPlan = document.createElement('div');
            newPlan.className = 'content_body';
            newPlan.innerHTML = `
                <div class="sub_title">플랜 ${planCount}</div>
                <div class="btn3" id="planaddbtn" onclick="addToPlans(this)">추가</div>
                <div class="sub_content">
                    <div class="sub_day">
                        <p>${planCount}차</p>
                        <input type="time" class="time_start" onchange="validateTimes(this, this.nextElementSibling)">
                        <input type="time" class="time_end" onchange="validateTimes(this.previousElementSibling, this)">
                        <select class="sub_select">
                            <option>인원수</option>
                            <option></option>
                            <option></option>
                        </select>
                    </div>
                </div>
            `;
            return newPlan; // 생성된 플랜 요소 반환
        }

        // 추가 버튼 클릭 시 새로운 sub_day 추가하는 함수
        function addToPlans(button) {
            const subContentDiv = button.parentElement.querySelector('.sub_content');
            const subDays = subContentDiv.querySelectorAll('.sub_day');
            const newSubDayIndex = subDays.length + 1;

            // 새로운 sub_day 요소 생성하여 추가
            const newSubDayHTML = `
            <div class="sub_day">
                <p>${newSubDayIndex}차</p>
                <input type="time" class="time_start" onchange="validateTimes(this, this.nextElementSibling)">
                <input type="time" class="time_end" onchange="validateTimes(this.previousElementSibling, this)">
                <select class="sub_select">
                    <option>인원수</option>
                    <option></option>
                    <option></option>
                </select>
            </div>
            `;
            subContentDiv.insertAdjacentHTML('beforeend', newSubDayHTML); // sub_content에 추가
        }

        	
        function updatePlanOptions() {
            const planOptions = document.getElementById(`planOptions`);
            if (!planOptions) {
                console.error(`ID가 'planOptions${i}'인 요소를 찾을 수 없습니다.`);
                return;
            }
            const newOption = document.createElement('option');
            newOption.value = planCount; // planCount의 값을 사용
            newOption.textContent = `플랜 ${planCount}`; // "플랜 1", "플랜 2" 형식으로 추가
            planOptions.appendChild(newOption); // 새로운 옵션 추가
        }

// 기간 요소 추가 함수
function addPeriodElement() {
	i++;
    const newPeriodHTML = `
        <div class="period" style="display: flex; align-items: center;">
            <input type="date" class="date_start" id="dateStart${i}" onchange="updateCalendarHighlights(${i})">
            <input type="date" class="date_end" id="dateEnd${i}" onchange="updateCalendarHighlights(${i})">
            <select class="sub_select" id="planOptions">
                <option value="0">플랜</option>
            </select>
        </div>
    `;
    periodsContainer.insertAdjacentHTML('beforeend', newPeriodHTML); // 기간 요소 추가
}


// 날짜 유효성 검사 함수

// 시간 유효성 검사 함수



    </script>
    
</body>
</html>
