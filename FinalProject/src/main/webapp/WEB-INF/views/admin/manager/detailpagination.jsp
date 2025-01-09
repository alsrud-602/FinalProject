<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/admin_s.css" />
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <!-- 부트스트랩 -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
 .list-container {
    display: flex;
    flex-wrap: wrap; /* 행을 넘어서 요소를 정렬 */
    gap: 20px; /* 항목 간 간격 */
    margin: 20px 0;
  }

 .list-item {
    display: flex;
    flex-direction: row; /* 가로로 정렬 */
    align-items: flex-start; /* 수직 위쪽 정렬 */
    border: 1px solid #ddd; /* 테두리 */
    border-radius: 8px; /* 모서리 둥글게 */
    padding: 10px;
    width: 48%; /* 두 개씩 정렬 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
  }

  .list-item img {
    width: 80px;
    height: 80px;
    border-radius: 4px; /* 이미지 둥글게 */
    margin-right: 10px; /* 이미지와 텍스트 간격 */
  }

  .list-item .content {
    flex-grow: 1; /* 텍스트가 남은 공간 차지 */
  }

  .list-item .content span {
    display: block;
    font-size: 14px;
    line-height: 1.5;
    margin-bottom: 8px;
  }

  .list-item .action {
    font-size: 12px;
    color: #007a33; 
    font-weight: bold;
    margin-top: 6px; /* 텍스트와 간격 */
    width:70px;
    height:30px;
     line-height: 30px; 
    text-align:center;
    border-radius:25px;
    border: 1px solid #007a33;
  }
  
    .list-item .remote {
    font-size: 12px;
    color: #40c963; /* 녹색 텍스트 */
    font-weight: bold;
    margin-top: 6px; /* 텍스트와 간격 */
    width:70px;
    height:30px;
     line-height: 30px; 
    text-align:center;
    border-radius:25px;
    border: 1px solid green;
    cursor: pointer; /* 커서가 손가락 모양으로 변경됨 */
  }
  
 .chart-container {
            width:700px;
            max-height:500px;
            margin: auto;
            
        }
        


  #box_table2 div {
    background-color: #40c963;
    color: white;
    padding: 5px;
    border-radius: 5px;
    cursor: pointer;
  }
  
.upmenu_div{
    background: white;
    padding : 60px 40px 40px 70px;
    font-family: 'ABeeZee';
    border-radius: 10px;
    

}
 
.upmenu input{
    border: 3px solid black;
    width:300px;
    height: 40px;
    border-radius: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 20px;
    font-family: 'Pretendard';
    padding-left: 10px;
    margin-bottom: 15px; 
}  
.category-name {
    display: inline; /* 인라인 요소로 설정하여 수평으로 나열 */
    margin-right: 5px; /* 각 카테고리 간 간격 */
} 
.categories {
    display: flex; /* 카테고리 이름을 수평으로 나열 */
    flex-wrap: wrap; /* 필요 시 줄 바꿈 */
    margin-left: 10px; /* 다른 내용과 간격 조정 */
}
.resetbutton{
  padding:20px;
  background: white;
}

</style>
</head>
<body>
  
  <div class="container">
  <main>

   <div class="content_box2">
    <p id ="box_title">${CompanyDetail.name}</p>    
    <img src="/images/icon/location.png" style="width:20px; margin-bottom:5px; "  />
    <div style="text-align: center"><p style="width:200px; border: 1px solid gray;">부산광역시 부산진구</p></div>
    
    <hr>
    
 	<div class="upmenu" style="display: flex; ">
		    <div   class="upmenu_div" style="border: 1px solid black; margin-right: 10px;  height: 500px; width: 500px;"> <!-- 너비 조정 -->
              <p>아이디</p>
              <input type="text" style="width: 80%;" placeholder="${CompanyDetail.id}"> 
               <p>사업자코드</p>
               <input type="text" style="width: 80%;" placeholder="${CompanyDetail.code}">
                <p>이메일</p>
                <input type="text" style="width: 80%;" placeholder="${CompanyDetail.email}">
                <p>전화번호</p>
                <input type="text" style="width: 80%;" placeholder="${CompanyDetail.phone}">
        </div>
       		<div style="border: 1px solid black; padding:30px; height:500px;" >   
	    		  	 <div class="chart-container">
       				 <h2>성과</h2>
      				  <canvas id="performanceChart"></canvas>
      				  <p style="text-align:center">순위:n등</p>
      				  <p style="font-size: 14px; color:gray; text-align:center">순위 산정 기준: 팝업 스토어 등록수*100 + 팝업 스토어 좋아요 수 || 10등 이내 시 우수회원 선정 및 메인 배너 광고</p>
   				    </div>
		   </div>
	</div>
		
<div class="popupsearch" style="padding:50px; margin-top:10px; background: #40c963;">
    <h2 style="color:white;">등록한 팝업스토어list</h2>
    <div class="searchform" style="display: flex; gap: 10px; flex-wrap: wrap;">
        <input type="text" class="inputsearch" style="flex: 1; padding: 10px;" placeholder="팝업명을 입력하세요">
        <input type="button" class="buttonsearch" style="flex: 0.1; padding: 10px; background:white;" value="조회">
        <button type="reset"  class="resetbutton" >※초기화</button>
    </div>
</div>
		
	<div class="list-container">
	  <c:forEach var="popup" items="${CompanyPopupDetail}">
	    <div class="list-item" data-store-idx="${popup.store_idx}">
	      <img src="/image/read?path=${popup.image_path}" alt="Store Image" >
	      <div class="content">
		    <span>${popup.brand1}</span> <!-- 브랜드 이름 -->
		    <span>${popup.title}</span> <!-- 팝업 제목 -->
		    
		    <!-- 카테고리 리스트 출력 -->
		    <div class="categories">
		        <c:forEach var="category" items="${finalCategoryList}">
		            <c:if test="${category.store_idx == popup.store_idx}">
		                <span class="category-name">${category.category_name}</span> <!-- 카테고리 이름 -->
		            </c:if>
		        </c:forEach>
		    </div>
		    
		    <div class="remote" data-store-idx="${popup.store_idx}">Remote</div> <!-- 원격 조작 관련 정보 -->
		</div>
	      <div class="action">광고 등록</div> <!-- 광고 등록 버튼 -->
	    </div>
	  </c:forEach>
	</div>
   
   </div>	
		
		
		
     </main>	
   </div>


  
  
  <script>
  const ctx = document.getElementById('performanceChart').getContext('2d');

  const data = {
      labels: ['Oct 2021', 'Nov 2021', 'Dec 2021', 'Jan 2022', 'Feb 2022', 'Mar 2022'],
      datasets: [
          {
              label: '팝업스토어 등록 수',
              data: [4, 6, 8, 10, 9, 7],
              borderColor: 'rgba(255, 99, 132, 1)',
              backgroundColor: 'rgba(255, 99, 132, 0.2)',
              tension: 0.4,
              borderWidth: 2,
              yAxisID: 'y2',
              pointStyle: 'circle',
              pointRadius: 5,
          },
          {
              label: '팝업스토어 좋아요 수',
              data: [700, 650, 720, 680, 700, 750],
              borderColor: 'rgba(54, 162, 235, 1)',
              backgroundColor: 'rgba(54, 162, 235, 0.2)',
              tension: 0.4,
              borderWidth: 2,
              yAxisID: 'y', 
              pointStyle: 'circle',
              pointRadius: 5,
          }
      ]
  };

  const options = {
          responsive: true,
          plugins: {
              legend: {
                  display: true,
                  position: 'top',
              },
              tooltip: {
                  enabled: true,
              }
          },
          scales: {
              x: {
                  grid: {
                      display: false,
                  }
              },
              y: {
                  beginAtZero: true,
                  position: 'left',
                  grid: {
                      color: 'rgba(200, 200, 200, 0.3)',
                  },
                  ticks: {
                      stepSize: 100 // 왼쪽 축의 단위 (100씩 증가)
                  },
                  title: {
                      display: true,
                  }
              },
              y2: {
                  beginAtZero: true,
                  position: 'right',
                  grid: {
                      drawOnChartArea: false, // 오른쪽 축의 선을 차트 위에 그리지 않음
                  },
                  ticks: {
                      stepSize: 2, // 오른쪽 축의 단위 (1씩 증가)
                  },
                  title: {
                      display: true,
                  }
              }
          }
      };

      const performanceChart = new Chart(ctx, {
          type: 'line',
          data: data,
          options: options
      });
  </script>
</body>
<script>
$(function(){
    $('.remote').on('click', function(){
        let store_idx = $(this).data('store-idx'); // data-store-idx에서 값 가져오기
         window.location.href = "/Users/Info?store_idx=" + store_idx; // URL로 이동
    });
});
$(function(){
    $('.buttonsearch').on('click', function(){
        //let store_idx = $(this).data('store-idx'); // data-store-idx에서 값 가져오기
        let search = $('.inputsearch').val();
        let filter = $('.category option:selected').val();
        alert(search)
        alert(filter)
        window.location.href = "/Admin/detailpagination?search=" + encodeURIComponent(search) + "&filter=" + encodeURIComponent(filter);
        
    });
});
$(function(){
	$('.resetbutton').on('click',function(){
		let company_idx = ${CompanyDetail.company_idx}
		window.location.href = "/Admin/Detail?company_idx="+company_idx;
	})
})
</script>
</html>
  

  

