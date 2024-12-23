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
#view_header  {
p:first-child {
font-size: 26px;
font-weight: 700;
}
}
.sub_short{
width: 250px;        
height: 43px;         
border: 1px solid #9A9A9A;
box-sizing: border-box; 
font-size: 16px; 
padding-left: 10px;
margin: 0 10px;
}
.sub_input_date{
width: 150px;        
height: 43px;         
border: 1px solid #9A9A9A;
box-sizing: border-box; 
font-size: 16px; 
padding-left: 10px;
margin: 0 10px;
}
</style>
</head>
<body>
<div class="container">
  <main>


     <div id="view_header">
     <p>키스톤 마케팅</p>
     <p>부산광역시 부산진구</p>
     </div>
     <div id="line_white"></div>
     
    <div class="content_body">
    <div class="sub_title">기본정보</div>
    <div class="sub_content">
      <table class="sub_table">
        <tr>
           <td>팝업스토어명칭</td>
           <td><input class="sub_link"type="text" placeholder="팝업스토어 이름을 입력하시오"></td>
        </tr>
        <tr>
           <td>카테고리</td>
           <td>
             <select class="sub_select">
             <option>카테고리1</option>
             <option>잡화</option>
             <option>스포츠</option>
           </select>
             <select class="sub_select">
             <option>카테고리2</option>
             <option>잡화</option>
             <option>스포츠</option>
           </select>
           
           </td>
        </tr>        
        <tr>
           <td>브랜드</td>
           <td>
           메인<input class="sub_short"type="text" placeholder="브랜드명을 입력하시오"> 
           콜라보브랜드<input class="sub_short"type="text" placeholder="콜라보  브랜드명을 입력하시오">
           </td>
        </tr>        
        <tr>
           <td>주 타겟 연령대</td>
           <td>
             <select class="sub_select">
             <option>연령대</option>
             <option>어린이</option>
             <option>10대</option>
             <option>10~20대</option>
             <option>20~30대</option>
             <option>30대~40대</option>
             <option>40대 ~</option>
             <option>전연령층</option>
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
           <td><input class="sub_link"type="text" placeholder="상세정보"></td>
        </tr>
        <tr>
           <td>운영기간</td>
           <td>
           <input class="sub_input_date"type="date" placeholder="시작날짜"> ~
           <input class="sub_input_date"type="date" placeholder="마감날짜">
           
           </td>
        </tr>        
        <tr>
           <td>영업시간</td>
           <td>
            <c:forEach var="entry" items="${daysOfWeek}">
            <div class="sub_day">
               <p>${entry.value}</p>
               <input type="time" id="${entry.key}_START" class="time_start" 
                onchange="validateTimes(this,document.getElementById('${entry.key}_END') )">
               <p>-</p>&nbsp;&nbsp;
               <input type="time" id="${entry.key}_END" class="time_end" 
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
             <input class="sub_note"type="text" placeholder="특이사항이 있으면 남겨주세요">
             </div>
           </td>
        </tr>        
        <tr>
           <td>홈페이지 링크</td>
           <td><input class="sub_link"type="text" placeholder="홈페이지 링크를 복사해 주세요"></td>
        </tr>        
        <tr>
           <td>SNS 링크</td>
           <td><input class="sub_link"type="text" placeholder="SNS 링크를 복사해 주세요"></td>
        </tr>        
        <tr>
           <td>해시태그</td>
           <td>
           <input type="text" id="inputHash" onkeydown="checkEnter(event)" placeholder="#없이 입력 후 ENTER로 해쉬태그를 입력하세요">
           <div class="sub_flex">
             <div class="sub_hash">굿즈판매<span onclick="deleteHash(this)"><img src="/images/icon/delete2.png"></span></div>
             <div class="sub_hash">포토부스<span onclick="deleteHash(this)"><img src="/images/icon/delete2.png"></span></div>
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
         <td><input class="sub_link"  type="text" placeholder="팝업을 소개할 문구를 완성해 보세요">
         <p class="sub_guide" >소개 한줄은 목록상단에 기재되어 고객들에게 안내될 예정입니다</p></td>      
       </tr>
       <tr >
         <td>상세내용</td>      
         <td><textarea id="sub_textarea" placeholder="팝업스토어에 구체적인 내용을 작성하세요" ></textarea></td>      
       </tr>
       <tr>
         <td>팝업환경</td>      
         <td>
           <select class="sub_select">
             <option>주차정보</option>
             <option>주차불가</option>
             <option>주차가능</option>
           </select>
           <select class="sub_select">
             <option>요금</option>
             <option>무료</option>
             <option>유료</option>
           </select>
           <select class="sub_select">
             <option>연령제한</option>
             <option>19세 이상</option>
             <option>15세 이상</option>
             <option>전 연령 가능</option>
             <option>노키즈 존</option>
           </select>
           <select class="sub_select">
             <option>사진촬영여부</option>
             <option>촬영 가능</option>
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
 
 <div class="cover_layout">
 <input class="btn2" type="submit" value="수정완료">
  </div>

 
  </main>	
</div>
<script>
function validateTimes(startInput, endInput) {
    const startTime = startInput.value;
    const endTime = endInput.value;

    if (startTime && endTime && startTime >= endTime) {
        alert("종료 시간은 시작 시간보다 나중이어야 합니다.");
        endInput.value = ""; // 종료 시간 초기화
        //startInput.value="";
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
			const divHashInput = `<div class="sub_hash">\${hashValue}<span onclick="deleteHash(this)"><img src="/images/icon/delete2.png"></span></div>`
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
</script>
</body>
</html>
