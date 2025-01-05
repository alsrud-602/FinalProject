<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#btn5{
padding: 10px 20px;
background: #121212;
color: white;
border-radius: 5px;
font-size: 20px;
cursor: pointer;
}
.imageSize{
width: 250px;
height: 250px;
}
.image_box{

display: flex;
flex-direction: column; 
align-items: center; 
justify-content: center;

}
.image_name{
font-size: 18px;
font-weight: 600;
padding: 8px;
background: #E4E4E4;
margin: 5px;
border-radius: 10px;
}
#image_display{
display: flex;
gap:10px;
padding:20px;
}
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container">
  <%@include file="/WEB-INF/include/admin-slidebar2.jsp" %>

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
           <td>${store.address}</td>
        </tr>
        <tr>
           <td>운영기간</td>
           <td>${store.start_date} ~ ${store.end_date}</td>
        </tr>        
        <tr>
           <td>영업시간</td>
           <td class="table_padding1">
            <div class="sub_day">
               <p>월</p><p>${store.smon} &nbsp; - &nbsp; ${store.emon}</p>
            </div>
            <div class="sub_day">
               <p>화</p><p>${store.stue} &nbsp; - &nbsp; ${store.etue}</p>
            </div>            
            <div class="sub_day">
               <p>수</p><p>${store.swed} &nbsp; - &nbsp; ${store.ewed}</p>
            </div>            
            <div class="sub_day">
               <p>목</p><p>${store.sthu} &nbsp; - &nbsp; ${store.ethu}</p>
            </div>            
            <div class="sub_day">
               <p>금</p><p>${store.sfri} &nbsp; - &nbsp; ${store.efri}</p>
            </div>            
            <div class="sub_day">
               <p>토</p><p>${store.ssat} &nbsp; - &nbsp; ${store.esat}</p>
            </div>            
            <div class="sub_day">
               <p>일</p><p>${store.ssun} &nbsp; - &nbsp; ${store.esun}</p>
            </div>            
             <div class="sub_p">
             <p>${store.onotes}</p>
             </div>
           </td>
        </tr>        
        <tr>
           <td>홈페이지 링크</td>
           <td>
             <div class="sub_p">
             <p><a href="${store.homepage}">${store.homepage}</a></p>
             </div>
           </td>
        </tr>        
        <tr>
           <td>SNS 링크</td>
           <td>
             <div class="sub_p">
             <p><a href="${store.sns}">${store.sns}</a></p>
             </div>
           </td>
        </tr>        
        <tr>
           <td>해시태그</td>
           <td>
           <div class="sub_flex">
           <c:forEach var="tag" items="${tagList}" >
             <div class="sub_hash_div">${tag.tag_name}</div>
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
         <td>
           <div class="sub_p">
             <p>${store.introduction}</p>
           </div>
         </td>      
       </tr>
       <tr >
         <td>상세내용</td>      
         <td >
         <div class="sub_textarea">${store.content}</div>
         </td>      
       </tr>
       <tr>
         <td>팝업환경</td>      
         <td>
           ${store.parking}&nbsp;&nbsp;${store.fare}&nbsp;&nbsp;${store.age_limit}&nbsp;&nbsp;${store.shooting}     
         </td>      
       </tr>
       <tr>
         <td>홍보이미지</td>
         <td>
         <div id ="image_display">
         <c:forEach var="image" items="${imageList}">       
         <div class="image_box">
          <img src="/Image/Read?path=${image.image_path}"alt="${image.imagename}" class="imageSize">
          <div class="image_name">${image.imagename}</div>
          </div>
         </c:forEach>
         </div>
         </td>
       </tr>
      
      </table>
    </div>
 </div>
 
 <div class="btn_layout">
 <a class="btnful" id="btn_green" href="#" onclick="Approval(event)" data-status="승인">승인하기</a>
 <a class="btnful" id="btn_red" href="#" onclick="Approval(event)" data-status="불가">승인거부</a>
 <a class="btnful" id="btn_white" href="/Admin/Store/UpdateForm?store_idx=${store.store_idx}">수정하기</a>
 <a class="btnful" id="btn_blue" href="#">담당자 요청 조회</a>
 <a class="btnful" id="btn_black" href="#"onclick="banUpdate(event)" data-ban="${store.ban}">스토어 삭제</a>
 </div> 
  </main>	
</div>

<!-- 모달 배경 -->
<div id="modalBg" class="modal-bg">
    <!-- 모달 창 -->
    <div id="reserveModal" class="modal">
    <div class="modal_layout_header">
       <h2>요청 내역</h2>

<div class="dropdown">

    <div class="dropdown-toggle" id="dropdown-toggle">
      리스트를 확인후 요청을 처리하세요 <img src="/images/icon/select.png">
    </div>

   
    <div class="dropdown-menu" id="dropdown-menu">
        <c:choose>
            <c:when test="${not empty requestList}">
                <c:forEach var="request" items="${requestList}" varStatus="status">
                    <div class="custom-option" data-value="${status.index}">
                        <div class="option_left-align" data-idx="${request.request_idx}">${request.field}</div>
                        <div class="option_right-align">
                            <c:choose>
                                <c:when test="${request.status == '미완'}">
                                    <div class="status-pre">미완</div>
                                </c:when>
                                <c:when test="${request.status == '완료'}">
                                    <div class="status-con">완료</div>
                                </c:when>
                            </c:choose>
                            <div class="option_date">${request.cdate}</div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="custom-option">
                    <div class="option_left-align"> 요청 내역 없음</div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    
  </div>


       <img id="btnClose" src="/images/icon/delete2.png" alt="삭제">
    </div>
    
     <div class="size_box2"></div>
     <div class="modal_box">
     

      <h2>요청 내역</h2>
      <div class="modal_area">요청내역없음
        </div>
     <div class="modal_box">
      <h2>답변하기</h2>
      <textarea class="model_textarea" rows="" cols="" placeholder="요청처리에 대한 답변을 입력하세요">답변없음</textarea>
     </div>
      <input type="hidden" value="" id="modal_idx"/>
      <div class="modal_layout_confirm" >
      <div id="btn5" onclick="requestConfirm()">확인</div>
      </div>
      
    </div>
  </div>
</div>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
</body>
<script>
let store_idx = ${store.store_idx}; // store_idx 값 설정
//승인 거부 RESTAPI
function Approval(event) {
    event.preventDefault(); 
    let status = event.target.getAttribute('data-status');
 console.log(status);
    // fetch 요청 보내기
    fetch('/Approval/Update', {
        method: 'POST', 
        headers: {  'Content-Type': 'application/json' },
        body: JSON.stringify({ store_idx: store_idx, status: status }) 
    })
    .then(response => response.json())
    .then(data => {
        if (data && data.message) {
            alert(data.message + ' 처리 되었습니다');
        }
    })
    .catch(error => {
        console.error('Error:', error); // 에러 처리
    });
}
//삭제 RESTAPI
function banUpdate(event) {
    event.preventDefault(); 
    let banStatus = event.target.getAttribute('data-ban'); 
    
    // banStatus가 'N'이면 'Y'로, 'Y'이면 'N'으로 변경
    let newBanStatus = (banStatus === 'N') ? 'Y' : 'N';

    console.log('Current ban status:', banStatus);
    console.log('New ban status:', newBanStatus);

    // fetch 요청 보내기
    fetch('/Approval/Ban', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ store_idx: store_idx, ban: newBanStatus }) 
    })
    .then(response => response.json())
    .then(data => {
        if (data && data.status) { 
        	
        	 let ban = (data.status === 'N') ? '삭제해제' : '삭제';
            alert(ban + ' 처리 되었습니다');
            // a 태그의 data-ban 속성 업데이트
            event.target.setAttribute('data-ban', newBanStatus);
        }
    })
    .catch(error => {
        console.error('Error:', error); // 에러 처리
    });
}



//예약하기 버튼 클릭 시 모달 열기
document.getElementById('btn_blue').addEventListener('click', function() {
    document.getElementById('modalBg').style.display = 'block';
});

// 모달 닫기 버튼
document.getElementById('btnClose').addEventListener('click', function() {
    document.getElementById('modalBg').style.display = 'none';
});

const dropdownToggle = document.getElementById('dropdown-toggle');
const dropdownMenu = document.getElementById('dropdown-menu');
const options = document.querySelectorAll('.custom-option');

// 드롭다운 메뉴 보이기
dropdownToggle.addEventListener('click', () => {
  dropdownMenu.classList.toggle('show');
});

// 드롭다운 메뉴 안보이기
document.addEventListener('click', (e) => {
  if (!e.target.closest('.dropdown')) {
    dropdownMenu.classList.remove('show');
  }
});

// 드롭다운 리스트 클릭시 이동 코딩 
options.forEach(option => {
  option.addEventListener('click', () => {
      const selectedText = option.querySelector('.option_left-align').textContent;

      const requestIdx = option.querySelector('.option_left-align').getAttribute('data-idx');
      
     dropdownToggle.textContent = selectedText; 
    
     
     // fetch 요청 보내기
     fetch('/Request/Request', {
         method: 'POST', 
         headers: { 'Content-Type': 'application/json' },
         body: JSON.stringify({ request_idx: requestIdx }) 
     })
     .then(response => response.json())
     .then(data => {
         if (data && data.rDto) {      	
        	 let request = data.rDto;
     const modalArea = document.querySelector('.modal_area');
     modalArea.textContent = request.content;
     const textarea = document.querySelector('.model_textarea');
     textarea.value = request.response;    
     const requesthidden = document.querySelector('#modal_idx');
     requesthidden.value = requestIdx;    
           
        }
     })
     .catch(error => {
         console.error('Error:', error); // 에러 처리
     });          
     
     
    dropdownMenu.classList.remove('show'); 
    
  });
});

//답변 restAPI
function requestConfirm(){
   const request_idx = document.querySelector('#modal_idx').value;
   const response = document.querySelector('.model_textarea').value;
	
   console.log(request_idx);
   console.log(response);
   
   // fetch 요청 보내기
   fetch('/Request/Response', {
       method: 'POST', 
       headers: { 'Content-Type': 'application/json' },
       body: JSON.stringify({ response: response, request_idx: request_idx }) 
   })
   .then(response => response.json())
   .then(data => {
       if (data && data.msg) {      	
      	 let msg = data.msg;
          alert('답변완료 했습니다');
          document.querySelector('.model_textarea').value = msg;
         
      }
   })
   .catch(error => {
       console.error('Error:', error); // 에러 처리
   });
	
}

</script>
</html>
