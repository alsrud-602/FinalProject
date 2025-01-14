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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
.btn4{
box-sizing: border-box; 
font-size: 20px;
background: #00FF84;
    border: 1px solid #9A9A9A; 
    padding:10px;
    border-radius:5px;
&:hover{
background: #DFDFDF;
} 
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
.sub_flex2{
display:flex;
justify-content: flex-end;
margin: 20px;
}
.delete-button{
margin: 0px 10px;
cursor: pointer;

}
.file-item{
padding:6px;
border: 1px solid #9A9A9A;
background: #DFDFDF;
margin: 5px;
display: inline-block;
font-size:16px;
font-weight: 500px; 
border-radius: 5px;
color: #121212;
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
      
      <form action="/Users/Update" method="POST"  enctype="multipart/form-data">
      <input type="hidden" name="user_idx" value="${useridx}">
      <input type="hidden" name="review_idx" value="${review_idx}">
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
  <option value="${ReviewDetail.score}">${ReviewDetail.score}</option>
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
  <textarea class="review_textarea" name="content">${ReviewDetail.content}</textarea>
    </div>

		 <div class="sub_flex2">
		    <label for="file-input" class="btn4">
		        파일 선택
		    </label>
           <input id="file-input" name="upfile" type="file" accept=".jpg, .jpeg, .png" style="display: none;" multiple  />
         </div>
     <div class="content">
       <div >
         <c:forEach var="img" items="${imageList}">
        <div class="file-item"><span>${img.imagename}</span>&nbsp;<a class="deleteImage" href="/DeleteImageReveiw?is_idx=${img.is_idx}">x</a></div>   
        </c:forEach>
       </div>
    <div id="file-name-container">
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
function goBack() {
    window.history.back();  // 이전 페이지로 돌아가기
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

</script>

</body>
</html>






