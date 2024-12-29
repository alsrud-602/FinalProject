<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
body {
    height:100%;
    margin: 0; /* 기본 여백 제거 */
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
    margin:100px;
    width:1640px;
}

/*---------------------------------------------------*/
/*유저관리*/
.content {
    padding: 20px; /* 콘텐츠에 패딩 추가 */
    background: #E8EEE7;
    margin-left: 30px;
    margin-top: 100px;
    height: 100%;
}

.content table{
    width : 1600px;
    height : 100px;
    font-size: 20px;
    font-family: 'Poppins';
    font-weight: 500;
    padding : 10px;
    background: white;
}
.content table tr:first-child td{
   border-bottom: 3px solid #DFDFDF;
}
.content table td {
    padding : 15px;  
   border-bottom: 2px solid #DFDFDF;
   
}
.content table td a{
  text-decoration: none;
  color:black;
}
.content table tr:not(:first-child):hover{
  background: #EAEAEA;
}

.content h2{
    font-family: 'Pretendard';
    font-size: 40px; 
    padding : 40px 20px 40px 20px;
}
.hr {
    width: 98%; 
    margin: 0 auto; 
    border: 3px solid white;; /* 흰색으로 설정 */
    border-radius: 50px; /* 모서리를 둥글게 */
    margin-bottom: 30px;
}
/*유저 관리 테이블 정렬*/
#sortSelect{
   border: none;
   width:120px; 
}
/*우수회원*/
.good{
    background: #F7FF00;
}
/*평범회원*/
.nomal{
    background: #00522B;
}
/*블랙회원*/
.bad{
    background: #DC3545;
}
.userSelect{
    font-weight: 600;
    border: none;
    border-radius: 30px;
    width: 120px;
    padding:5px;
    text-align: center;
    
}
#usertable{
    width:25px;
    height:25px;
    border-radius: 10px;
}
/*---------------------------------------------------*/
/*모달 버튼*/
.modalbutton1{
    white:50px;
    height: 80px;
    font-size: 14px;
    font-family: 'Pretendard';
    margin-bottom: 10px;
    background: #00FF80;
    border: none;
    border-radius: 15px;
    padding-left: 10px;
    padding-right: 10px;
    font-weight: bold;
    margin-left: 1300px;
}
.modalbutton2{
    white:50px;
    height: 80px;
    font-size: 14px;
    font-family: 'Pretendard';
    margin-bottom: 10px;
    background: #FFAE62;
    border: none;
    border-radius: 15px;
    padding-left: 10px;
    padding-right: 10px;
    font-weight: bold;
}
span{
 color:red;
}
/*-----------------------------------------*/
/*모달 내부*/
.modal-content{
top: 500px; /* 모달의 상단 위치 */
}
#exampleModalLabel1{
    font-family: 'Roboto';
    font-size: 24px;
    font-weight: bold;
    
}
#exampleModalLabel1 span{
    color: #20573D;
}

#exampleModalLabel2{
    font-family: 'Roboto';
    font-size: 24px;
    font-weight: bold;
    
}
#exampleModalLabel2 span{
    color: #731912;
}
.modal-body input[type="text"]{
    background: #29292E;
    color:white;
    width:250px;
    height: 50px;
    margin-right: 5px;
    text-align: center;
}
input[type="number"]{
    background: #29292E;
    color:white;
    width:100px;
    height: 50px;
    text-align: center;
}
.insertbutton1{
    background: #00875F;
    color: white;
    border: none;
    width : 80px;
    height: 50px;
}
.insertbutton2{
    background: #F75A68;
    color: white;
    border: none;
    width : 80px;
    height: 50px;
}
</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container" style="margin-left: 300px;"> 
  
<%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
  
 
    <div class="content">
      <h2>유저 관리</h2>
      <div class="hr"></div>
      
      <!-- 모달을 실행할 버튼 --> 
	  <button type="button" class="modalbutton1" data-bs-toggle="modal" data-bs-target="#exampleModal1">
	    선택한 회원 <br> 팝콘 지급하기
	  </button>
	  <button type="button" class="modalbutton2" data-bs-toggle="modal" data-bs-target="#exampleModal2">
	    선택한 회원 <br> 팝콘 <span>차감하기</span>
	  </button>

      
      <table>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="headercheckbox" onclick='selectAll(this)'/></td>
          <td>
	          닉네임
	          <select id="sortSelect" onchange="sortTable('nikname')">
	          <option value=""></option>
	          <option value="asc">asc</option>
	          <option value="desc">desc</option>
	        </select>
          </td>
          <td>
          아이디
          <select id="sortSelect" onchange="sortTable('id')">
            <option value=""></option>
            <option value="asc">asc</option>
            <option value="desc">desc</option>
        </select>
          </td>
          <td>가입일</td>
          <td>상태</td>
          <td>상세보기</td>
        </tr>
          
    <tbody>
        <!-- 사용자 목록을 출력 -->
        <c:forEach var="user" items="${allusers}">
            <tr>
             <td><input type="checkbox" id="usertable" name="usertable" class="headercheckbox" onclick='select(this)'/></td>
                <td>${user.nikname}</td>
                <td>${user.id}</td>
                <td>${user.cdate}</td>
                <td>
                    <div>
                        <select class="userSelect">
                            <option value="good" ${user.status == '우수회원' ? 'selected' : ''}>우수회원</option>
                            <option value="nomal" ${user.status == '일반회원' ? 'selected' : ''}>일반회원</option>
                            <option value="bad" ${user.status == 'blocked' ? 'selected' : ''}>차단됨</option>
                        </select>
                    </div>
                </td>
                <td><a href="/Admin/Userdetail">상세보기</a></td>
            </tr>
        </c:forEach>
    </tbody>
    </table>
      

		<!-- 모달 -->
		<!-- 지급하기 -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel1">팝콘 <span>지급하기</span></h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <input type="text" placeholder="지급내용(필수기입)">
		        <input type="number" placeholder="ex)100">
		        <button type="button" class="insertbutton1" data-bs-dismiss="modal">등록</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 차감하기 -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel2">팝콘 <span>차감하기</span></h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <input type="text" placeholder="차감내용(필수기입)">
		        <input type="number" placeholder="ex)100">
		        <button type="button" class="insertbutton2" data-bs-dismiss="modal">차감</button>
		    </div>
		  </div>
		</div>
		
		</div>
      
 
    </div>
  
</div>
</body>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
<script>

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('usertable');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

</script>
<script>
$(function() {
    // 회원별 색깔
    $('.userSelect').each(function() {
        var value = $(this).val(); 
        updateBackgroundColor($(this), value); 
    });

    $('.userSelect').on('change', function() {
        var value = $(this).val(); 
        updateBackgroundColor($(this), value); 
        updateFontColor($(this), value); 
    });
    
    function updateBackgroundColor(selectElement, value) {
        if (value == 'good') {
            selectElement.css('background-color', '#F7FF00'); // 우수회원: 노란색
            selectElement.css('color', 'black');
        } else if (value == 'nomal') {
            selectElement.css('background-color', '#00522B'); // 일반회원: 녹색
            selectElement.css('color', 'white');
        } else if (value == 'bad') {
            selectElement.css('background-color', '#DC3545'); // 차단됨: 빨간색
            selectElement.css('color', 'white'); // 차단됨: 빨간색
        } else {
            selectElement.css('background-color', ''); // 기본: 하양 
        }
    }
    
    function updateFontColor(selectElement, value) {
        if (value == 'good') {
            selectElement.css('color', 'black');
        } else if (value == 'nomal') {
            selectElement.css('color', 'white');
        } else if (value == 'bad') {
            selectElement.css('color', 'white'); // 차단됨: 빨간색
        } else {
        }
    }
});




</script>
</html>
