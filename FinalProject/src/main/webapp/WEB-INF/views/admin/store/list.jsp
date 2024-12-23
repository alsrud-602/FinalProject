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

</style>
</head>
<body>
  
  <div class="container">
  <main>
  <div class="content_box">
     <table id ="box_table">
     <tr>
       <td>  
       <div class="box_layout">
         <div class="box_circle"><img src="/images/icon/store3.png"></div>
         <div class="box_info">
          <p>총 스토어 수</p>
          <p>5,423</p>
          <div class="box_updown">
            <img src="/images/icon/arrowdown.png">
            <div><span class="green">16%</span>이번 달</div>
          </div>
          
         </div>
       </div>
       </td>
       
              <td>  
       <div class="box_layout">
         <div class="box_circle"><img src="/images/icon/profilecheck.png"></div>
         <div class="box_info">
          <p>담당자 계정</p>
          <p>1,893</p>
          <div class="box_updown">
            <img src="/images/icon/arrowup.png">
            <div><span class="red">1%</span>이번 달</div>
          </div>
          
         </div>
       </div>
       </td>
       
        <td>  
       <div class="box_layout">
         <div class="box_circle"><img src="/images/icon/storemarker.png"></div>
         <div class="box_info">
          <p>현재 운영중인 스토어</p>
          <p>192</p>
          
         </div>
       </div>
       </td>

     </tr>
     </table>
  </div>
  
   <hr>
   <div class="content_box2">
    <p id ="box_title">모든 스토어 입점 요청 내역</p>    
   <div class="box_filter">
   <input id="box_search"type="text" placeholder="Search">
   <select id="box_sort">
   <option>최신순</option>
   <option>미승인</option>
   <option>승인</option>
   <option>담당자 요청</option>
   </select>
   </div>
   
   <table id="box_table2">
     <tr>
       <th>기업명</th>
       <th>팝업스토어 명</th>
       <th>요청일</th>
       <th>이메일</th>
       <th>지역</th>
       <th>상태</th>
     </tr>
     <tr>
       <td>스텐리</td>
       <td><a href="/Review/Storeview">스텐리X메시 콜라보 1943 팝업스토어</a></td>
       <td>2024.12.12</td>
       <td>4342@email.come</td>
       <td>서울</td>
       <td>
         <div class="status_green">승인완료</div>
       </td>
     </tr>
     <tr>
       <td>스텐리</td>
       <td>스텐리X메시 콜라보 1943 팝업스토어 특집 한정판도 공개예정</td>
       <td>2024.12.12</td>
       <td>4dddddefdsggggg42@email.com</td>
       <td>서울</td>
       <td>
         <div class="status_red">미승인</div>
       </td>
     </tr>
     <tr>
       <td>스텐리</td>
       <td>침착맨 팝업스토어</td>
       <td>2024.12.12</td>
       <td>4342@email.come</td>
       <td>서울</td>
       <td>
         <div class="status_purple">담당자요청</div>
       </td>
     </tr>
   
   </table>
   <p>페이징 예정</p>
   
   </div>

  </main>	
  </div>
</body>
</html>
  

  

