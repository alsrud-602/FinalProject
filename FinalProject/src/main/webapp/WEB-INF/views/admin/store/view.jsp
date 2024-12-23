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
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container">
  <%@include file="/WEB-INF/include/admin-slidebar.jsp" %>

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
           <td>메시X스텐리1942 콜라보 팝업스토어</td>
        </tr>
        <tr>
           <td>카테고리</td>
           <td>잡화 | 스포츠</td>
        </tr>        
        <tr>
           <td>브랜드</td>
           <td>스텐리 | 메시</td>
        </tr>        
        <tr>
           <td>주 타겟 연령대</td>
           <td>2030세대</td>
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
           <td>서울특별시 성동구 성수동 132-2</td>
        </tr>
        <tr>
           <td>운영기간</td>
           <td>2024-12-12 ~ 2024-12-25</td>
        </tr>        
        <tr>
           <td>영업시간</td>
           <td class="table_padding1">
            <div class="sub_day">
               <p>월</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>
            <div class="sub_day">
               <p>화</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>            
            <div class="sub_day">
               <p>수</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>            
            <div class="sub_day">
               <p>목</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>            
            <div class="sub_day">
               <p>금</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>            
            <div class="sub_day">
               <p>토</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>            
            <div class="sub_day">
               <p>일</p><p>11:00 &nbsp; - &nbsp; 12:00</p>
            </div>            
             <div class="sub_p">
             <p> * 팝업특성상 운영시간은 유동적으로 변동될 수 있습니다</p>
             </div>
           </td>
        </tr>        
        <tr>
           <td>홈페이지 링크</td>
           <td>
             <div class="sub_p">
             <p>http://localhost:9090/Review/Storeview</p>
             </div>
           </td>
        </tr>        
        <tr>
           <td>SNS 링크</td>
           <td>
             <div class="sub_p">
             <p>http://localhost:9090/Review/Storeview</p>
             </div>
           </td>
        </tr>        
        <tr>
           <td>해시태그</td>
           <td>
           <div class="sub_flex">
             <div class="sub_hash_div">굿즈판매</div>
             <div class="sub_hash_div">포토부스</div>
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
             <p>스텐리x메시 드디어 서울에 착륙!!</p>
           </div>
         </td>      
       </tr>
       <tr >
         <td>상세내용</td>      
         <td >
         <div class="sub_textarea"> 형형색색의 텐트와 화려한 벨벳 커튼
다양한 캐릭터들이 펼치는 화려한 쇼를 만날 수 있는 움직이는 대극장이 더현대 서울에서 펼처집니다.
사운즈 포레스트를 수 놓은 웅장한 무대 위, 발 딛는 곳곳이 포토존이 이곳에서 잊지 못할 환상의 경험을 즐길 준비가 됬나요??</div>
         </td>      
       </tr>
       <tr>
         <td>팝업환경</td>      
         <td>
           주차불가&nbsp;&nbsp; 무료&nbsp;&nbsp; 노키즈존&nbsp;&nbsp; 촬영가능      
         </td>      
       </tr>
       <tr>
         <td>홍보이미지</td>
         <td>
          <div class="file_shape">retdsfe.pdf</div>
         
         </td>
       </tr>
      
      </table>
    </div>
 </div>
 
 <div class="btn_layout">
 <a class="btnful" id="btn_green" href="#">승인하기</a>
 <a class="btnful" id="btn_red" href="#">승인거부</a>
 <a class="btnful" id="btn_white" href="/Review/Storeupdate">수정하기</a>
 <a class="btnful" id="btn_blue" href="#">담당자 요청 조회</a>
 <a class="btnful" id="btn_black" href="#">스토어 삭제</a>
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
      <div class="custom-option" data-value="1">
        <div class="option_left-align">팝업명 변경</div>
        <div class="option_right-align">
          <div class="status-pre">미완</div>
          <div class="option_date">2024.12.13</div>
        </div>
      </div>
      <div class="custom-option" data-value="2">
        <div class="option_left-align">다른 작업</div>
        <div class="option_right-align">
          <div class="status-con">완료</div>
          <div class="option_date">2024.12.14</div>
        </div>
      </div>
    </div>
  </div>


       <img id="btnClose" src="/images/icon/delete2.png" alt="삭제">
    </div>
    
     <div class="size_box2"></div>
     <div class="modal_box">
     

      <h2>요청 내역</h2>
      <div class="modeal_area">요청 수락해주세요요청 
수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요요청 수락해주세요
        </div>
     <div class="modal_box">
      <h2>답변하기</h2>
          <textarea class="model_textarea" rows="" cols="" placeholder="요청처리에 대한 답변을 입력하세요">답변입력하기</textarea>
     </div>
     
      <div class="modal_layout_confirm" >
      <div id="btn5" onclick="requestConfirm()">확인</div>
      </div>
      
    </div>
  </div>
</div>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
</body>
<script>
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
      dropdownToggle.textContent = selectedText; 
    dropdownMenu.classList.remove('show'); // Close dropdown
  });
});

function requestConfirm(){
	//restAPI 로 구현 하기~
	
}

</script>
</html>
