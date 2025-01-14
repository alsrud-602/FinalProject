<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <style>
  
   body {
      margin: 0;
      background-color: #121212;
      color: #fff;
    opacity: 0; /* 페이지 로딩 시 숨김 */
    transition: opacity 1s ease-in; /* 서서히 나타나는 효과 */
    }

body.loaded {
    opacity: 1; /* 페이지 로딩 후 나타나게 설정 */
}
    .header {
      display: flex;
      align-items: center;
      padding: 50px 23px;
      
      background-color: #000;
      font-size: 35px;
      color: #fff;
    }
    .content {
      padding: 20px 60px 40px 60px;
}
    .section {
      margin-top: 20px;
      margin-bottom:10px;
      padding: 30px 50px;
      display: flex;
      justify-content: center;
    }
    .section-title {
      font-size: 50px;
      font-weight: bold;
      margin: 10px 0;
      color: #00FF84;
    }
hr{
color: #fff;
margin: 10px 0;
}

.img-size1{
width: 300px;
}
.img-size2{
width: 60px;
}
.img-size3{
width: 32px;
}
.list-header{
display: flex;
justify-content: space-between;
align-items: center;
width:100%;

p {
  font-size: 2.5rem;
  font-weight: 400;
}
}
.like-box{
display: flex;
justify-content: flex-end;
align-items: center;
padding:10px;
border-radius:15px;
&:hover{
background-color: #414141;
 }
} 
.list-box{
width:100%;
padding: 40px 30px 40px 30px;
flex-direction: column;
align-content: flex-start;
} 
.list-footer{
margin-top:160px;
display: flex;
justify-content: flex-end;
gap:5px;
p {
  font-size: 2rem;
  font-weight: 400;
}
} 

.btn-profile{
padding: 20px 100px;
background-color: #00FF84;
color: #121212;
font-size: 3rem;
font-weight: 700;
margin: 100px;
border-radius: 15px;
} 
  </style>
</head>
<body style="padding-top: 0px; ">

<div class="container">
 
  <main>
  
  
 <div class="header">
    <span onclick="backPage()">←</span> &nbsp;&nbsp;
    <h1 style="margin: 0; font-size: 50px; ">관심팝업</h1>
  </div>
  <div class="content">
  
       <div class="section">
      <div class="section-title">북마크 내역</div>
    </div>
    <hr>
    
    <c:choose>
    <c:when test="${not empty BookMarkList}">
     <table>
    <c:forEach var="book" items="${BookMarkList}">
     <tr>
       <td>
         <img class="img-size1"src="/Image/Read?path=${book.image_path}" alt="이미지"/>
       </td>
         
       <td class="list-box">
         <div class="list-header">
           <p><a href="path?store_idx=${book.store_idx}">${book.title}</a></p> 
           <div class="like-box" >
             <img class="img-size2"src="/images/icon/book1.png" onclick="bookmark(this)" 
             data-idx="${book.bookmark_idx}" data-off="/images/icon/book2.png"
             data-status="on"  data-store="${book.store_idx}" alt="북마크"/>
           </div>
         </div>
             
         <div class="list-footer">
           <img class="img-size3"src="/images/icon/calender_modile.png" alt="캘린더"/>&nbsp;
           <p>${book.start_date}</p>
            &nbsp;<p> ~</p> &nbsp;
           <p>${book.end_date}</p>
         </div>
       </td>
     </tr>
</c:forEach>
    
    </table>
    </c:when>    
    <c:otherwise>
      <p style="font-size: 60px; display:flex; justify-content: center;"> 북마크 내역이 없습니다</p>
    </c:otherwise>    
    </c:choose>
   
   
    <div style=" display:flex; justify-content: center; width:100%">
    <a class="btn-profile" href="path?user_idx=${user_idx}">프로필 돌아가기</a>
    </div>
    
    

  
  


      
  
  </div>
  
  
  </main>
  <%@include file="/WEB-INF/include/app-navbar.jsp" %>
</div>	

</body>
<script>
//페이지 로드 완료 후 서서히 나타나게 설정
document.addEventListener("DOMContentLoaded", function() {
    document.body.classList.add('loaded');
});

</script>
  <script>
  function bookmark(element){
	  
    let status = element.getAttribute('data-status'); 
    let bookmark_idx = element.getAttribute('data-idx'); 
    let store_idx = element.getAttribute('data-store'); 
	let user_idx ='${user_idx}';
  console.log('bookmark_idx :'+ bookmark_idx);
  console.log('store_idx :'+ store_idx);
  console.log('status :'+ status);
  console.log('user_idx :'+ user_idx);
	  
	  const content = {
			    user_idx: user_idx, 
			    store_idx: store_idx 
			};
	  
	  if( status == 'off') {
	  fetch(`/Popup/Bookmark/Write`, {
	      method: 'POST', 
	      headers: {
	          'Content-Type': 'application/json', 
	      },
	      body: JSON.stringify(content),
	  })
	  .then(response => {
	      if (!response.ok) {
	          throw new Error(`HTTP error! status: ${response.status}`);
	      }
	      return response;
	  })
	  .then(data => {
	      console.log('data:', data);
	      if (data) {
	          // 서버에서 반환한 데이터 처리
	          console.log('추가 처리 결과:', data);
	          const result = data
	          element.setAttribute('data-status', 'on');
		      element.setAttribute('src', '/images/icon/book1.png');
	      }
	  })
	  .catch(error => {
	      console.error('북마크 내역이 없습니다', error);
	  });

	  }else {
		  
		  const content = {
				    user_idx: user_idx, 
				    store_idx: store_idx 
				};
				
				fetch(`/Popup/Bookmark/DeleteStable`, {
				    method: 'DELETE', 
				    headers: {
				        'Content-Type': 'application/json',
				    },
				    body: JSON.stringify(content),
				})
				.then(response => {
				    if (!response.ok) {
				        throw new Error(`HTTP error! status: ${response.status}`);
				    }
				    return response
				})
				.then(data => {
				    console.log('삭제 상태 data:', data);
	          element.setAttribute('src', element.getAttribute('data-off'));
				    element.setAttribute('data-status', 'off');
				})
				.catch(error => {
				    console.error('리뷰좋아요 내역이 없습니다', error);
				});					  
		  
	  }
	  
  }
  

  
  function backPage() {
	  window.history.back();    
  }

 </script>
</html>






