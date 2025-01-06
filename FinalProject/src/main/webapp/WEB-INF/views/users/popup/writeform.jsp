<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet"  href="/css/popupdetail.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>

<style>
.sub_box {
border: 1px solid #fff;
display: flex;
justify-content: space-around;
align-items: center;
gap:20px;
width:280px;
font-size: 18px;

p:first-child {
color: #fff;
}  
p:nth-child(2) {
color: #00FF84;	
}
}
.review_textarea {
width:1100px;
height:400px;
background: #121212; 
color: white;
padding: 20px;
font-size: 16px;
}
.content_title_white{
display:flex;
justify-content:flex-start;
align-items:center;
gap:200px;
p:first-child {
color: #fff;
font-size: 24px;
font-weight: 700px;
margin-bottom: 10px;
} 
select{
color: #fff;
font-size: 20px;
border: 1px solid #fff;
padding: 10px;
border-radius: 10px;
width: 200px;
background: #121212;
}
}
.btn_layout{
display:flex;
justify-content: flex-end;
margin: 20px 10px 10px 10px;
}
/*사진첨부 -btn*/
.btn4 {
width: 90px;
height: 40px;
font-size: 16px;
color: #121212;
font-weight: 600;


}
/*submit -btn*/
.btn5{
width: 200px;
height: 60px;
font-size: 22px; 
font-weight: 600;
color: white;
background: #121212;
border: 1px solid #fff;
&:hover{
background: #767676;
}

}
.btn_layout2{
display:flex;
justify-content: center;
margin-bottom: 30px;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<div class="container">
  <img id="icon_back" src="/images/icon/back.png" alt="뒤로가기" onclick="goBack()" >
  <main>
	
	 <div class='title'>
   
      <div class="title_header"> 
        <div class="title_category">
        <c:forEach var="st" items="${storetag}">
        ${st.category_name}>
        </c:forEach>
        ${storedetail.age}
        </div> 

      </div>
      <p class="title_name">${storedetail.title}</p>
      <p class="title_subname"> ${storedetail.introduction}</p>
      <div class="title_adress">
        <img src="/images/icon/map1.png">&nbsp;<p>${storedetail.address}</p>&nbsp;&nbsp;<p>|</p>&nbsp;&nbsp;
        <c:if test="${not empty storedetail.brand1}">
          <img src="/images/icon/store.png">&nbsp;<p>${storedetail.brand1}&nbsp;&nbsp;&nbsp;</p>
        </c:if>
        <c:if test="${not empty storedetail.brand2}">
          <img src="/images/icon/store.png">&nbsp;<p>${storedetail.brand2}</p>
        </c:if>
      </div>
      </div>
      
      <form action="/Users/Write" method="POST">
      <input type="hidden" name="user_idx" value="${user.userIdx}">
      <input type="hidden" name="store_idx" value="${storedetail.store_idx}">
      <div class="date_line">
      <div class="sub_box"><p>현재리뷰수</p><p>${totalcount.review_idx}</p></div>
      <div class="sub_box"><p>평균 평점</p><p>${totalcount.score}</p></div>
      <div class="sub_box"><p>좋아요</p><p>${totalcount.like}</p></div>
      <div class="sub_box"><p>조회수</p><p>${totalcount.hit}</p></div>     
      </div>
    
      <div class="review_header">
	    <div class="review_title">
	      <p>리뷰 쓰기</p>
	    </div>
	  </div>
	  
   <div class="content">
  <div class="content_title_white"><p>평점</p>
  <select name="score">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  </select>
  
  </div>
    </div>
	  
	  <div class="content">
  <div class="content_title_white"><p>내용</p></div>
  <textarea class="review_textarea" name="content">방문하신 팝업스토어는 어떠셨나요? 솔직한 후기를 남겨주세요!</textarea>
    </div>
    <div class="btn_layout">
  <button class="btn4">사진첨부</button>
  </div>

	  <div class="content">
  <div class="content_title_white"><p>사진</p>
  <div>344223.pdf</div>
  </div>
  
    </div>	  
	<div class="sizebox"></div>
	<div class="btn_layout2">
	<input type="submit" class="btn5" value="작성완료">
	</div>
	</form>
  </main>	
</div>
<script>
function goBack() {
    window.history.back();  // 이전 페이지로 돌아가기
}
</script>

</body>
</html>






