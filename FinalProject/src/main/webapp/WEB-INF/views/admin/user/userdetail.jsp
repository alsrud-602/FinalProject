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
   
}
.headerp{
  font-family: 'ABeeZee';
  font-size: 30px;
  margin-top: 20px;
  margin-left: 45px;
}


/*---------------------------------------------------*/
/*유저관리*/
.content {
    flex: 1; /* 남은 공간을 차지하도록 설정 */
    padding: 20px; /* 콘텐츠에 패딩 추가 */
    background: #E8EEE7;
    margin-left: 30px;
    width:1600px;
    height: 100%;
    margin-top: 100px;
    
}

h2{
    font-family: 'Pretendard';
    padding : 40px 20px 40px 20px;
}
.hr {
    width: 98%; 
    margin: 0 auto; 
    border: 3px solid white;; /* 흰색으로 설정 */
    border-radius: 50px; /* 모서리를 둥글게 */
    margin-bottom: 30px;
}
/*---------------------------------------------------*/
/*유저+팝콘*/
.userdetail{
    display: flex;
}

/*---------------------------------------------------*/
/*유저 상세 정보*/
.user{
    border: 1px solid black;
    background: white;
    padding : 40px;
    font-family: 'ABeeZee';
    border-radius: 10px;
    margin-top: 40px;
    margin-left: 45px;
}
h3{
    font-size: 19px;
    font-weight: 600;
    padding-bottom: 10px;
    margin-top: 10px;
}
.tableborder{
    border: 1px solid black;
    width:300px;
    height: 40px;
    border-radius: 10px;
}
/*---------------------------------------------------*/
/*팝콘*/
.popcorn{
    margin-top: 120px;  
}
.popcornlayout {
    display: flex; 
    align-items: center;
    border : 1px solid black;
    background: white;
    border: none;  
    width : 350px;
    height : 180px;
    margin-left: 50px;
    margin-right: 20px; 
    border-radius: 5px;
}
.popcornlayout2 {
    display: flex; 
    align-items: center;
    border : 1px solid black;   
    background: white;
    border: none;   
    width : 350px;
    height : 180px;
    margin-right: 20px;     
    border-radius: 5px;
}
.popcornlayout3 { 
    align-items: center;
    border : 1px solid black;   
    background: white;
    border: none;   
    width : 250px;
    height : 380px; 
    margin-top: 10px;   
    border-radius: 5px;
}
.popcornlayout4 { 
    display: flex; 
    align-items: center;
    border : 1px solid black;
    background: white;
    border: none;  
    width : 720px;
    height : 180px;
    margin-left: 50px;
    border-radius: 5px;
}
.popcorn img{
    margin-left:20px;
    margin-right:20px;
    width : 100px;
    height: 100px;
}
.popcorn p{
    font-family:'Poppins';
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 0px;
}
.popcornlayout3-text1{
    font-family:'Poppins';
    font-size: 16px;
    color:#666666;
    text-align: center;
    margin-top: 40px;
}
.popcornlayout3-text2{
    font-family:'Poppins';
    font-size: 16px;
    color:#666666;
    text-align: center;
}
/*---------------------------------------------------*/
/*팝콘내역*/
.popcorndetail table{
    border: 1px solid #D8D8D8;
    margin-left: 50px;
    width : 1450px;
    height : 500px;
    font-family: 'Inter';
    font-size: 20px;
    font-weight: 550;
}
.popcorndetail table td:hover{
     background: #F5F5FF;
}
.popcorndetail table td{
   border-bottom: 1px solid #D8D8D8;
   text-align: center;
   background: white;
}
.popcorndetail table tr:first-child td{
    background: #F5F5F5;
    
}
.popcornlayout3 p{
    font-family: 'Poppins';
    font-size: 22px;
    text-align: center;
    padding-top: 20px;
}
.popcornplus{
    background:#F1FFF8;
    border: 1px solid #B8DBCA;
    border-radius: 15px;
    width : 200px;
    height: 45px;
}
.popcorning{
    background: #FFF9F2;
    border: 1px solid #EECEB0;
    border-radius: 15px;
    width : 200px;
    height: 45px;
}
.popcornminus{
    background: #FFF4F2;
    border: 1px solid #EECEB0;
    border-radius: 15px;
    width : 200px;
    height: 45px;
}
.popcornplus p{
   text-align:center;
   color: #20573D;
   font-family: 'Inter';
   margin-bottom: 0;
   height: 45px;
   margin-top: 7px;
}

.popcorning p{
   color: #CD7B2E;
   font-family: 'Inter';
   margin-bottom: 0;
   height: 45px;
   margin-top: 7px;
}

.popcornminus p{
   color: #731912;
   font-family: 'Inter';
   margin-bottom: 0;
   height: 45px;
   margin-top: 7px;
}
.popcorncenter{
   display: flex; 
   justify-content: center; 
   align-items: center; 
   height: 100%;
}
/*---------------------------------------------------*/
/*도넛차트*/
.wrap {
  position: relative;
  padding: 2%;
  display: flex; /* Flexbox 사용 */
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
  height: 50%; /* 필요에 따라 높이 조정 */
}

.container {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
}

.chart {
  position: relative;
  width: 160px;
  height: 160px;
  border-radius: 50%;
  transition: 0.3s;
}

span.center {
  background: #fff;
  
  position: absolute;
  top: 50%;
  left: 50%;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  text-align: center;
  line-height: 120px;
  font-size: 15px;
  transform: translate(-50%, -50%); //가운데 위
}

</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container" style="margin-left: 300px;"> 
  <%@include file="/WEB-INF/include/admin-slidebar.jsp" %>

      <div>
    <div class="content">
      <h2 style="font-size: 40px; ">유저 상세 정보</h2>
      <div class="hr"></div>      
    
    <div class="userdetail">
	    <div class="user">
	    <table>
	         <tr>
	          <td>
	             <h3>닉네임</h3>
	             <div class="tableborder"></div>
	          </td>
	         </tr>
	         <tr>
	          <td>
	             <h3>아이디</h3>
	             <div class="tableborder"></div>
	          </td>
	         </tr>
	         <tr>
	          <td>
	             <h3>비밀번호</h3>
	             <div class="tableborder"></div>
	          </td>
	         </tr>
	         <tr>
	          <td>
	             <h3>이메일</h3>
	             <div class="tableborder"></div>
	          </td>
	         </tr>
	         <tr>
	          <td>
	            <h3>전화번호</h3>
	            <div class="tableborder"></div>
	          </td>
	         </tr>
	       </table>
	     </div>
	     
	     <div class="popcorn">
	       <table class="test">
	         <tr>
	           <td>
	             <div class="popcornlayout">
	               <div><img src="/images/admin/user/popcorncharater.png"></div>
	               <div>
	                 <p style="color: #26A3DD; font-family: 'Poppins';">얻은 팝콘</p>
	                 <p style="color: #0C5070; font-family: 'Poppins'; font-size:40px; font-weight: 700;">1000</p>
	               </div>
	             </div>
	           </td>
	           <td>
	            <div class="popcornlayout2">
	              <div><img src="/images/admin/user/popcornimg1.png"></div>
	              <div>
	                <p style="color: #CB3A31; font-family: 'Poppins';">사용된 팝콘</p>
	                <p style="color: #F29321; font-family: 'Poppins'; font-size:40px; font-weight: 700;">1000</p>
	              </div>
	            </div>
	           </td>
	           <td rowspan="2">
	             <div class="popcornlayout3">
	              <div><p>리뷰 상위 순위</p></div>
	              <div class='wrap'>
					  <div class='container'>
					    <div class="chart doughnut1"><span class="center">45%</span></div>
					  </div>
				 </div>
	              <div class="popcornlayout3-text1">*100등</div>
	              <div class="popcornlayout3-text2">*3등안에 들 시 팝톤 2000개 지급 <br>좋아요 개수 기준</div>
	              </div>
	           </td>
	         </tr>
	         <tr>
	           <td colspan="2">
	            <div class="popcornlayout4">
	              <div><img src="/images/admin/user/popcornimg2.png"></div>
	              <div>
	              <p style="font-family: 'Poppins';">잔여 팝콘</p>
	              <p style="font-family: 'Poppins'; 'Poppins'; font-size:40px; font-weight: 700;">10000</p></div>
	            </div>
	           </td>
	         </tr>
	       </table>
	     </div>
	     
     </div>
     
	       <p class="headerp">팝콘 내역</p>
	     <div class="popcorndetail">
	       <table>
	         <tr>
	           <td>거래명</td>
	           <td>팝콘량</td>
	           <td>일자</td>
	           <td>상태</td>
	         </tr>
	         <tr>
	           <td>팝콘 팩토리</td>
	           <td>-50</td>
	           <td>2024-12-20</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcornminus"><p>차감</p></div>
	             </div>
	           </td>
	         </tr>
	         <tr>
	           <td>예약 스토어 노쇼</td>
	           <td>-500</td>
	           <td>2024-12-18</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcornminus"><p>차감</p></div>
	             </div>
	           </td>
	         </tr>
	         <tr>
	           <td>리뷰 top3</td>
	           <td>+2000</td>
	           <td>2024-12-16</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcorning"><p>지급중</p></div>
	             </div>
	           </td>
	         </tr>
	         <tr>
	           <td>리뷰작성</td>
	           <td>+200</td>
	           <td>2024-12-14</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcornplus"><p>지급완료</p></div>
	             </div>
	           </td>
	         </tr>
	         <tr>
	           <td>팝콘 팩토리</td>
	           <td>-500</td>
	           <td>2024-12-13</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcornminus"><p>차감</p></div>
	             </div>
	           </td>
	         </tr>
	         <tr>
	           <td>가입 보상</td>
	           <td>+1000</td>
	           <td>2024-12-12</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcornplus"><p>지급완료</p></div>
	             </div>
	           </td>
	         </tr>
	       </table>
	     </div>
     
   </div>
 </div>
  
</div>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
</body>
<script>
const chart1 = document.querySelector('.doughnut1');


const makeChart = (percent, classname, color) => {
  let i = 1;
  let chartFn = setInterval(function() {
    if (i < percent) {
      colorFn(i, classname, color);
      i++;
    } else {
      clearInterval(chartFn);
    }
  }, 10);
}

const colorFn = (i, classname, color) => {
  classname.style.background = "conic-gradient(" + color + " 0% " + i + "%, #dedede " + i + "% 100%)";
}



makeChart(45, chart1, '#45AD5D');

</script>
</html>
