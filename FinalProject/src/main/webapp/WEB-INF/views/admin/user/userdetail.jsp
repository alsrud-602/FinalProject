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
*{
font-family: "Pretendard";
}
body {
    margin: 0; /* 기본 여백 제거 */
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
    margin:100px;
   
}
.headerp{
  font-family: 'Pretendard';
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
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 20px;
    font-family: 'Pretendard';
     padding-left: 10px;  
}

/*---------------------------------------------------*/
/*모달 버튼*/
.modalbutton1{
    white:50px;
    width:100px;
    height: 50px;
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
    width:100px;
    height: 50px;
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

.popcorndetail table th{
}
.popcorndetail table td:hover{
     background: #F5F5FF;
}
.popcorndetail table td{
   border-bottom: 1px solid #D8D8D8;
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
    width : 100px;
    height: 45px;
}
.popcorning{
    background: #FFF9F2;
    border: 1px solid #EECEB0;
    border-radius: 15px;
    width : 100px;
    height: 45px;
}
.popcornminus{
    background: #FFF4F2;
    border: 1px solid #EECEB0;
    border-radius: 15px;
    width : 100px;
    height: 45px;
}
.popcornplus p{
   text-align:center;
   color: #20573D;
   font-family: 'Inter';
   font-size:16px;
   margin-bottom: 0;
   height: 45px;
   margin-top: 7px;
}

.popcorning p{
   color: #CD7B2E;
   font-family: 'Inter';
   font-size:16px;
   margin-bottom: 0;
   height: 45px;
   margin-top: 7px;
}

.popcornminus p{
   text-align:center;
   color: #731912;
   font-family: 'Inter';
   font-size:16px;
   margin-bottom: 0;
   height: 45px;
   margin-top: 7px;
}
.popcorncenter{
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
            <div class="tableborder">${userinfo[0].nikname}</div>
        </td>
    </tr>
    <tr>
        <td>
            <h3>아이디</h3>
            <div class="tableborder">${userinfo[0].id}</div>
        </td>
    </tr>
  <%--   <tr>
        <td>
            <h3>비밀번호</h3>
            <div class="tableborder"  title="${userinfo[0].password}">${userinfo[0].password}</div>
        </td>
    </tr> --%>
    <tr>
        <td>
            <h3>이메일</h3>
            <div class="tableborder">${userinfo[0].email}</div>
        </td>
    </tr>
    <tr>
        <td>
            <h3>전화번호</h3>
            <div class="tableborder">${userinfo[0].phone}</div>
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
	                 <p style="color: #0C5070; font-family: 'Poppins'; font-size:40px; font-weight: 700;">${earn}</p>
	               </div>
	             </div>
	           </td>
	           <td>
	            <div class="popcornlayout2">
	              <div><img src="/images/admin/user/popcornimg1.png"></div>
	              <div>
	                <p style="color: #CB3A31; font-family: 'Poppins';">사용된 팝콘</p>
	                <p style="color: #F29321; font-family: 'Poppins'; font-size:40px; font-weight: 700;">${spented}</p>
	              </div>
	            </div>
	           </td>
	           <td rowspan="2">
	             <div class="popcornlayout3">
	              <div><p>리뷰 상위 순위</p></div>
	              <div class='wrap'>
					  <div class='container'>
					  <canvas id="doughnutChart" width="200" height="200"></canvas>
					  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
					  <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
					  </div>
				 </div>
				 <hr>
	              <div class="popcornlayout3-text1">${userRank}등</div>
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
	              <p style="font-family: 'Poppins'; 'Poppins'; font-size:40px; font-weight: 700;">${totPopCorn}</p></div>
	            </div>
	           </td>
	         </tr>
	       </table>
	     </div>
	     
     </div>
     
	 <p class="headerp">팝콘 내역</p>
	    <!-- 모달을 실행할 버튼 --> 
	  <button type="button" class="modalbutton1" data-bs-toggle="modal" data-bs-target="#exampleModal1">
	    현재 회원 <br> 팝콘 지급하기
	  </button>
	  <button type="button" class="modalbutton2" data-bs-toggle="modal" data-bs-target="#exampleModal2">
	    현재 회원 <br> 팝콘 <span>차감하기</span>
	  </button>
	  
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
		        <form action="/Admin/PlusPopcorn" method="POST">
		        <input id="popcornContentPlus" type="text"   name="content"      placeholder="지급내용(필수기입)">
		        <input id="popcornAmountPlus"  type="number" name="plusPopcorn"  placeholder="ex)100">
		        <input type="hidden" name="userId" value="${userinfo[0].id}">
		        <button type="submit" id="plusPopcornBtn"  class="insertbutton1" data-bs-dismiss="modal" >등록</button>
		        </form>
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
		       <form action="/Admin/MinusPopcorn" method="POST">
		        <input id="popcornContentMinus" type="text"   name="content"       placeholder="차감내용(필수기입)">
		        <input id="popcornAmountMinus" type="number"  name="minusPopcorn"  placeholder="ex)100">
		        <input type="hidden" name="userId" value="${userinfo[0].id}">
		        <button type="submit" id="minusPopcornBtn"  class="insertbutton2" data-bs-dismiss="modal">차감</button>
		        </form>
		    </div>
		  </div>
		</div>
		
		</div>
	  
<div class="popcorndetail">

    <table>
        <tr>
            <th>거래명</th>
            <th>팝콘량</th>
            <th>일자</th>
            <th style="padding-left: 30px; ">상태</th>
        </tr>
        <c:forEach var="log" items="${wallet}">
            <tr>
                <td >${log.content}</td> <!-- 거래명 -->
                <td>
                    <c:choose>
                        <c:when test="${log.earned_points > 0}">
                            <span style="color: green;">+${log.earned_points}</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: red;">-${log.spent_points}</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                
                <td >${log.add_date}</td> <!-- 일자 -->
                
                <td>
                    <div class="popcorncenter">
                        <c:choose>
                            <c:when test="${log.earned_points > 0}">
                                <div class="popcornplus"><p>지급완료</p></div>
                            </c:when>
                            <c:when test="${log.spent_points > 0}">
                                <div class="popcornminus"><p>차감완료</p></div>
                            </c:when>
                            <c:otherwise>
                                <div class="popcorning"><p>대기중</p></div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </td>
                
            </tr>
        </c:forEach>

          <tr>
	           <td>리뷰 작성</td>
	           <td>+200</td>
	           <td>2024-12-16</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcorning"><p>지급대기</p></div>
	             </div>
	           </td>
	         </tr>
         <tr>
          <tr>
	           <td>리뷰 top3</td>
	           <td>+2000</td>
	           <td>2024-12-16</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcorning"><p>지급대기</p></div>
	             </div>
	           </td>
	         </tr>
         <tr>
	           <td>팝콘 팩토리</td>
	           <td>-50</td>
	           <td>2024-12-20</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcorning"><p>차감대기</p></div>
	             </div>
	           </td>
	         </tr>
	         <tr>
	           <td>예약 스토어 노쇼</td>
	           <td>-500</td>
	           <td>2024-12-18</td>
	           <td>
	             <div class="popcorncenter">
	               <div class="popcorning"><p>차감대기</p></div>
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

<canvas id="doughnutChart" width="400" height="400"></canvas>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

<script>

// 서버에서 전달된 데이터
const percentuser = ${percentuser};  // 유저 좋아요 비율
const targetLikes = ${targetLikes}; // 유저 좋아요 수
const totalLikes = ${totalLikes};   // 전체 좋아요 수

// 도넛 차트를 그릴 Canvas 요소
const ctx = document.getElementById('doughnutChart').getContext('2d');
//Chart.js 3.x에서 datalabels 플러그인 등록
Chart.register(ChartDataLabels);

// 도넛 차트 생성
const doughnutChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: [`유저: ${targetLikes}개`, `전체: ${totalLikes}개`],  // 레이블에 유저 좋아요 수와 전체 좋아요 수 표시
    datasets: [{
      label: '좋아요 퍼센트',
      data: [percentuser, 100 - percentuser],  // 유저 좋아요 비율과 나머지 비율
      backgroundColor: ['#45AD5D', '#dedede'],  // 색상 설정
      borderWidth: 1
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',  // 레전드 위치
        labels: {
          font: {
        	family: 'Pretendard',
            weight: 'bold',  // 레전드 글자 굵기 설정
            size: 14,         // 글자 크기 설정
            lineHeight: 1.5   // 레전드 글자 줄 간격 설정
          }
        }
      },
      tooltip: {
        callbacks: {
          label: function(tooltipItem) {
            // 툴팁에서 소수점 2자리까지 퍼센트 추가
            return tooltipItem.label + ': ' + tooltipItem.raw.toFixed(2) + '%';  // 툴팁에서 소수점 2자리로 표시하고 % 추가
          }
        }
      }
    },
    // 데이터 라벨을 추가하여 % 표시
    elements: {
      arc: {
        borderWidth: 0  // 테두리 없애기
      }
    },
    plugins: {
      datalabels: {
        formatter: function(value) {
          return value.toFixed(2) + '%';  // 소수점 2자리 + % 기호
        },
        color: '#000',  // 텍스트 색상
        font: {
          family: 'Pretendard',
          weight: 'bold',  // 글자 굵기 설정
          size: 14         // 글자 크기 설정
        },
        anchor: 'center',
        align: 'center'
      }
    }
  }
});

</script>



</html>
