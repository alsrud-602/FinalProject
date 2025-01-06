<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/admin_s.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>


</style>
</head>
<body>
  <%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container">
  <%@include file="/WEB-INF/include/admin-slidebar2.jsp" %>
<form action="/Admin/Store/Update" method="POST" enctype="multipart/form-data"  onsubmit="return validateForm()">
  <input type="hidden" name="detail_idx" value="${store.detail_idx}">      
 <input type="hidden" name="store_idx" value="${store.store_idx}">      
 <input type="hidden" name="company_idx" value="${store.company_idx}">      
 <input type="hidden" name="operation_idx" value="${store.operation_idx}">  
 <main>


     <div id="view_header">
     <p>키스톤 마케팅</p>
     </div>
     <div id="line_white"></div>
     
    <div class="content_body">
    <div class="sub_title">기본정보</div>
    <div class="sub_content">
      <table class="sub_table">
        <tr>
           <td>팝업스토어명칭</td>
           <td><input value="${store.title}"type="text" required name="title" class="sub_link" placeholder="팝업스토어명을 입력하세요"></td>
        </tr>
        <tr>
           <td>카테고리</td>
           <td>
			<c:set var="firstCategory" value="${categoryList[0].category_name}" />
			<c:set var="lastCategory" value="${categoryList[fn:length(categoryList) - 1].category_name}" />
         
			<select id="popup_cg1" name="category_id" class="sub_select" required>
			    <option>카테고리1</option>
			    <c:forEach var="c" items="${cList}">
			        <option value="${c.category_id}" 
			            <c:if test="${c.category_name == firstCategory}">selected</c:if>
			            >${c.category_name}</option>
			    </c:forEach>
			</select>
			
			<select id="popup_cg2" name="category_id" class="sub_select" >
			    <option>카테고리2</option>
			    <c:forEach var="c" items="${cList}">
			        <option value="${c.category_id}" 
			            <c:if test="${c.category_name == lastCategory}">selected</c:if>
			            >${c.category_name}</option>
			    </c:forEach>
			</select>
           
           </td>
        </tr>        
        <tr>
           <td>브랜드</td>
           <td>
           메인<span class="star_red">*</span><input value="${store.brand1}" class="sub_short" required name="brand1" type="text" placeholder="브랜드명을 입력하시오"> 
           콜라보브랜드<input value="${store.brand2}" class="sub_short"type="text" required  name="brand2" placeholder="콜라보  브랜드명을 입력하시오">
           </td>
        </tr>        
        <tr>
           <td>주 타겟 연령대</td>
           <td>
             <select name="age" class="sub_select" required>
             <option value="">연령대</option>
             <option value="어린이"<c:if test="${store.age == '어린이'}"> selected</c:if>>어린이</option>
             <option value="10대"<c:if test="${store.age == '10대'}"> selected</c:if>>10대</option>
             <option value="10~20대"<c:if test="${store.age == '10~20대'}"> selected</c:if>>10~20대</option>
             <option value="20~30대"<c:if test="${store.age == '20~30대'}"> selected</c:if>>20~30대</option>
             <option value="30대~40대"<c:if test="${store.age == '30대~40대'}"> selected</c:if>>30대~40대</option>
             <option value="40대 ~"<c:if test="${store.age == '40대 ~'}"> selected</c:if>>40대 ~</option>
             <option value="전연령층"<c:if test="${store.age == '전연령층'}"> selected</c:if>>전연령층</option>
           </select>
           </td>
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
             <input value="${store.address}"   name="address"  required type="text"  id="roadFullAddr" class="sub_link" placeholder="주소검색 버튼을 눌러주세요" style="width:620px; margin: 0 10px 0 0;">
             <div class="btn3" onclick="searchAddress()" >주소검색</div>
           </div>
           
           </td>
        </tr>
        <tr>
           <td>운영기간</td>
           <td>
           <input value="${store.start_date}" required  onchange="vailddateOperation(this,document.getElementById('pop_end'))"  name="start_date"id="pop_start"class="sub_input_date"type="date" placeholder="시작날짜"> ~
           <input value="${store.end_date}" required  onchange="vailddateOperation(document.getElementById('pop_start'),this)"  name="end_date" id="pop_end"class="sub_input_date"type="date" placeholder="마감날짜">
           
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
         <td><input value="${store.introduction}" required name="introduction"  class="sub_link"  type="text" placeholder="팝업을 소개할 문구를 완성해 보세요">
         <p class="sub_guide" >소개 한줄은 목록상단에 기재되어 고객들에게 안내될 예정입니다</p></td>      
       </tr>
       <tr >
         <td>상세내용</td>      
         <td><textarea name="content" required  id="sub_textarea" placeholder="팝업스토어에 구체적인 내용을 작성하세요" >${store.content}</textarea></td>      
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
 
 <div class="btn_layout">
 <input class="btnful" type="submit" value="수정완료">
  </div>

 
  </main>
  </form>	
</div>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
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
</body>
</html>
