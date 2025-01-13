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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
body {
    height:100%;
    height:100%;
    margin: 0; /* 기본 여백 제거 */
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
    margin: 100px 30px; /* 상하 100px, 좌우 30px */
    width:1640px;
    
}

/*---------------------------------------------------*/
/*담당자 관리*/
.content {
    padding: 20px; /* 콘텐츠에 패딩 추가 */
    background: #E8EEE7;
    margin-left: 30px;
    margin-top: 100px;
    height: 100%;
}

.content table{
    width : 1500px;
    height : 100px;
    font-size: 20px;
    font-family: 'Poppins';
    font-weight: 500;
    padding : 10px;
    margin: 10px 40px 40px 40px;
    background: white;
}
.content table tr:first-child td{
   border-bottom: 3px solid #DFDFDF;
}
.content table td {
   padding : 15px 15px 15px 25px;  
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
    padding : 40px 20px 30px 20px;
}
.hr {
    width: 98%; 
    margin: 0 auto; 
    border: 3px solid white;; /* 흰색으로 설정 */
    border-radius: 50px; /* 모서리를 둥글게 */
    margin-bottom: 60px;
}
/*------------------------*/
/*검색창*/
.headerflex{
  display: flex;
}
.adminsearch-container {
    display: flex;
    align-items: center;
    background-color: #F8F9FA; /* 연한 배경색 */
    border-radius: 25px; /* 둥근 모서리 */
    padding: 5px 10px; /* 패딩 */
    width: 350px; /* 원하는 너비 */
    height:80px;
    margin-top: 20px;
    margin-left: 850px;
}

.adminsearch-input {
    border: none; /* 테두리 없음 */
    outline: none; /* 포커스 시 테두리 없음 */
    flex: 1; /* 남은 공간을 채우기 */
    padding: 10px; /* 패딩 */
    font-size: 16px; /* 글자 크기 */
    border-radius: 25px; /* 둥근 모서리 */
}

.adminsearch-button {
    background: none; /* 배경 없음 */
    border: none; /* 테두리 없음 */
    cursor: pointer; /* 커서 변화 */
}

.adminsearch-icon {
    width: 20px; /* 아이콘 너비 */
    height: 20px; /* 아이콘 높이 */
}
/*담당자 관리 테이블 정렬*/
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

.adinsert{
    background: #28A745;
    font-weight: 600;
    width: 120px;
    padding:5px;
    border-radius: 10px;
    text-align: center;
    border-bottom: 2px solid black;
}

</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container" style="margin-left: 300px;"> 
  
<%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
  
 
    <div class="content">
       <div class="headerflex">
	      <h2>스토어 담당자 관리</h2>
	      <div class="adminsearch-container">
		    <input type="text" placeholder="담당자 이름을 검색하세요" class="adminsearch-input">
		    <button class="adminsearch-button">
		        <img src="/images/admin/store/admin-search.png" alt="검색" class="adminsearch-icon">
		    </button>
		  </div>
		</div>
      <div class="hr"></div>
      
      
      <table>
        <tr>
          <td>
	          이름
	          <select id="sortSelect">
	          <option value=""></option>
	          <option value="asc">asc</option>
	          <option value="desc">desc</option>
	        </select>
          </td>
          <td>
          가입일
          <select id="sortSelect">
            <option value=""></option>
            <option value="asc">asc</option>
            <option value="desc">desc</option>
        </select>
          </td>
          <td>등록한 스토어 수</td>
          <td>상태</td>
          <td>광고 관리</td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>2</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>3</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="nomal">nomal</option>
		            <option class="good">우수회원</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="bad">blocked</option>
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="bad">blocked</option>
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="nomal">nomal</option>
		            <option class="good">우수회원</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        <tr>
          <td>대원스토어</td>
          <td>2024.12.13</td>
          <td>1</td>
          <td>
	          <div>
		          <select class="userSelect">
		            <option class="good">우수회원</option>
		            <option class="nomal">nomal</option>
		            <option class="bad">blocked</option>
		          </select>
		      </div>
          </td>
          <td>
          <div class="adinsert"><a href="/">광고등록</a></div>
          </td>
        </tr>
        
        
        
        
      </table>

      
 
    </div>
  
</div>
</body>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
<script>
$(function(){
	$('.adminsearch-icon').on('click',function(){
		alert("ok");
	})
})
</script>

<script>
$(function() {
    // 페이지 로드 시 각 .userSelect 요소의 첫 번째 옵션의 값을 확인
    $('.userSelect').each(function() {
        var insert = $(this).find('option:first').text(); 
        if (insert == '우수회원') {
            $(this).css('background-color', '#F7FF00'); // '우수회원'일 경우 배경색을 노란색으로
        } else if (insert == 'nomal') {
            $(this).css('background-color', '#00522B'); // 'nomal'일 경우 배경색을 어두운 녹색으로
        } else if (insert == 'blocked') {
            $(this).css('background-color', '#DC3545'); // 'blocked'일 경우 배경색을 빨간색으로
        } 
    });

    // 선택된 옵션에 따라 색상 변경
    $('.userSelect').on('change', function() {
        var value = $(this).val();
        if (value == '우수회원') {
            $(this).css('background-color', '#F7FF00'); // 현재 선택된 요소의 배경색 변경
        } else if (value == 'nomal') {
            $(this).css('background-color', '#00522B'); // 현재 선택된 요소의 배경색 변경
        } else if (value == 'blocked') {
            $(this).css('background-color', '#DC3545'); // 현재 선택된 요소의 배경색 변경
        }
    });
});
</script>
</html>
