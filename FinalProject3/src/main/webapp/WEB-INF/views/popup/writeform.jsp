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
        <div class="title_category">잡화 > 스포츠 > 2030대</div> 

      </div>
      <p class="title_name">스텐리 1943 기념 팝업스토어</p>
      <p class="title_subname"> 드디어 상륙! 스탠리와 메시의 콜라보 팝업스토어가 떴다!</p>
      <div class="title_adress">
        <img src="/images/icon/map1.png">&nbsp;<p>서울 성동구 성수이로 134-2</p>&nbsp;&nbsp;<p>|</p>&nbsp;&nbsp;
        <img src="/images/icon/store.png">&nbsp;<p>스텐리</p>
      </div>
      </div>
      
      <form action="">
      <div class="date_line">
      <div class="sub_box"><p>현재리뷰수</p><p>20</p></div>
      <div class="sub_box"><p>평균 평점</p><p>20</p></div>
      <div class="sub_box"><p>좋아요</p><p>20</p></div>
      <div class="sub_box"><p>조회수</p><p>20</p></div>     
      </div>
    
      <div class="review_header">
	    <div class="review_title">
	      <p>리뷰 쓰기</p>
	    </div>
	  </div>
	  
   <div class="content">
  <div class="content_title_white"><p>평점</p>
  <select>
  <option >1</option>
  <option >2</option>
  <option >3</option>
  <option >4</option>
  <option >5</option>
  </select>
  
  </div>
    </div>
	  
	  <div class="content">
  <div class="content_title_white"><p>내용</p></div>
  <textarea class="review_textarea">방문하신 팝업스토어는 어떠셨나요? 솔직한 후기를 남겨주세요!</textarea>
    </div>
    <div class="btn_layout">
  <button class="btn4">사진첨부</button>
  </div>

	  <div class="content">
  <div class="content_title_white"><p>내용</p>
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






