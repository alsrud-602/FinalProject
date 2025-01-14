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
 <form action="/Business/Operation/UpdateStore" method="POST" enctype="multipart/form-data" 
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

        <div >
         <c:forEach var="img" items="${imageList}">
        <div class="file-item"><span>${img.imagename}</span>&nbsp;<a class="deleteImage" href="/DeleteImage?is_idx=${img.is_idx}">x</a></div>   
        </c:forEach>
       </div>
       <div id="file-name-container">
       </div>
         
         </td>
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



function validateForm() {
    const statusElement = document.querySelector('input[name="status"]');
    const TagElement = document.querySelectorAll('input[name="tag_name"]');

    const parkingElement = document.querySelector('select[name="parking"]');
    const fareElement = document.querySelector('select[name="fare"]');
    const ageLimitElement = document.querySelector('select[name="age_limit"]');
    const shootingElement = document.querySelector('select[name="shooting"]');



    const inputsToValidate = [
        { element: parkingElement, defaultValue: '', message: '주차정보를 선택하세요' },
        { element: fareElement, defaultValue: '', message: '요금정보를 선택하세요' },
        { element: ageLimitElement, defaultValue: '', message: '연령제한 정보를 선택하세요' },
        { element: shootingElement, defaultValue: '', message: '사진촬영여부를 선택하세요' }
       
    ];       
    
    
    if (TagElement.length === 0) {
        alert('해시태그를 만들어주세요.');
        return false;
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



     

    </script>
  <script src="/js/authcompany.js" defer></script>     
</body>
</html>
