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
    margin: 0; /* 기본 여백 제거 */
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
    margin:100px;
    max-width: 1700px;
}
.content{
  width:1200px;
  background: #ccc;
}
/*-----------------------------------------*/
/*메뉴바*/
.slidebar {
    background: #353535;
    width: 300px;
    height: 420px; /* 필요에 따라 조정 */
    font-family: 'Pretendard';
    font-weight: 800;
    font-size: 18px;
    border-radius: 15px;
    color: white;
    padding : 30px 50px 50px 50px;
    margin-top: 100px;
    
    
}

.admin-slide {
    
    width : 180px;
    height: 40px;
    text-align: left;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
}

.admin-slide:hover {
    background: #EAFFDC;
}

.admin {
    background: #00522B;
    padding: 20px;
    border-radius: 15px;
    width:180px;
    height:120px;
    text-align: center;
    font-family: 'Pretendard';
    font-size: 24px;
    
}

.admin-slidesite {
    width:100px;
    height:30px;
    margin-left: 80px;
}

.admin-slidesite img {
    margin-right: 10px; /* 이미지와 텍스트 사이의 여백 */
}
.admin-slide-href{
    text-decoration: none; /* 링크 장식 제거 */
    color: white; /* 글자 색상 */
    font-size: 12px;
}


</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>


	<div class="container"> 
	<%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
	  
	     <div class="content">
	     <h2>테스트</h2>
	       <table>
	         <tr>
	           <td>1</td>
	           <td>1</td>
	           <td>1</td>
	         </tr>
	       </table>
	     </div>
	</div>
	
	
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
<script>
$(function(){
	$('.headercheckbox').on('click', function() { // 체크박스 전체선택, 전체해제
		alert("ok")
	});
})
</script>
</html>
