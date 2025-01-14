<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/admin-common.css" />
<link rel="stylesheet" href="/css/admin_s.css" />
<link rel="stylesheet" href="/css/admin-store-detail-pagination.css" />
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
.action a{
  text-decoration: none;
   color: inherit;
}

</style>
</head>
<body>
    <%@include file="/WEB-INF/include/admin-header.jsp" %>
  <div class="container">
    <%@include file="/WEB-INF/include/admin-slidebar2.jsp" %>
  <main>

   <div class="content_box2">
    <p id ="box_title">키스톤 마케팅</p>    
    <img src="/images/icon/location.png" style="width:20px; margin-bottom:5px; "  />
    <div style="text-align: center"><p style="width:200px; border: 1px solid gray;">부산광역시 부산진구</p></div>
    
    <hr>
    
    <div class="upmenu" style="display: flex; ">
          <div style="border: 1px solid black;  margin-right: 10px;  height: 500px; width: 500px;"> <!-- 너비 조정 -->
              <p>아이디</p>
              <input type="text" style="width: 80%;" value="${CompanyDetail.id}"> 
               <p>사업자코드</p>
               <input type="text" style="width: 80%;"value="${CompanyDetail.code}">
                <p>이메일</p>
                <input type="text" style="width: 80%;"value="${CompanyDetail.email}">
                <p>전화번호</p>
                <input type="text" style="width: 80%;"value="${CompanyDetail.phone}">
        </div>
<div style="border: 1px solid black;">   
    <div class="chart-container">
        <h3 style="text-align: center;">성과</h3>
        <div style="text-align: center; margin-bottom: 2px;">
            <label for="dateRange">기간 선택: </label>
            <select id="dateRange">
                <option value="week">일주일간 (일별)</option>
                <option value="month" selected>한달간 (일별)</option>
                <option value="year">1년간 (월별)</option>
            </select>
        </div>
        <canvas id="performanceChart"></canvas>
        <p style="text-align:center">순위: <span id="rank"></span>등</p>
        <p style="font-size: 14px; color:gray; text-align:center">
            순위 산정 기준: 팝업 스토어 등록수 * 100 + 팝업 스토어 좋아요 수 || 
            10등 이내 시 우수회원 선정 및 메인 배너 광고
        </p>
    </div>
</div>
   </div>
      
<div class="popupsearch" style="padding:50px; margin-top:10px; background: #40c963;">
    <h2 style="color:white;">등록한 팝업스토어</h2>
    <div class="searchform" style="display: flex; gap: 10px; flex-wrap: wrap;">

        <input type="text" class="inputsearch" style="flex: 1; padding: 10px;" placeholder="팝업명을 입력하세요">
        <input type="button" class="buttonsearch"style="flex: 0.1; padding: 10px; background:white;" value="조회">
        <button type="reset"  class="resetbutton">※초기화</button>
    </div>
</div>
      

   <div class="list-container">
     <c:forEach var="popup" items="${CompanyPopupDetail}">
       <div class="list-item" data-store-idx="${popup.store_idx} " data-company-idx="${popup.company_idx}">
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
         <div class="action"><a href="/Admin/Advertise">광고 등록</a></div> <!-- 광고 등록 버튼 -->
       </div>
     </c:forEach>
   </div>

   
   </div>   
   <div id="pagination">
    <%@include file="/WEB-INF/include/admin-store-detail-pagination.jsp" %>
   </div>
      
      
      
     </main>   
   </div>


  
  
<script>
let performanceChart;

const companyIdx = 1;


// 날짜 범위 계산 (일주일, 한달, 1년)
const calculateDateRange = (range) => {
    const now = new Date();

    let startDate;
    switch (range) {
        case 'week':
            startDate = new Date(now);
            startDate.setDate(now.getDate() - 7);
            break;
        case 'month':
            startDate = new Date(now);
            startDate.setMonth(now.getMonth() - 1);
            break;
        case 'year':
            startDate = new Date(now);
            startDate.setFullYear(now.getFullYear() - 1);
            break;
        default:
            startDate = new Date(now);
            startDate.setMonth(now.getMonth() - 1);
            break;
    }

    // 날짜를 yyyy-MM-dd 형식으로 포맷
    const formatDate = (date) => {
        const year = date.getFullYear();
        const month = (date.getMonth() + 1).toString().padStart(2, '0');
        const day = date.getDate().toString().padStart(2, '0');
        return `${year}-${month}-${day}`;
    };

    // 시작일과 종료일 계산
    return {
        startDate: formatDate(startDate),
        endDate: formatDate(now)
    };
};
// 차트 업데이트 함수
// 차트 업데이트 함수
const updateChart = (data) => {
    const labels = Object.keys(data.storeCounts);  // 날짜(혹은 월) 기준 라벨
    const storeData = Object.values(data.storeCounts);  // 팝업 스토어 등록수
    const likeData = Object.values(data.likeCounts);  // 팝업 스토어 좋아요 수

    // 날짜 기준으로 데이터를 정렬
    const sortedData = labels.map((label, index) => {
        return { label, storeData: storeData[index], likeData: likeData[index] };
    }).sort((a, b) => new Date(a.label) - new Date(b.label)); // 날짜를 기준으로 정렬

    // 정렬된 데이터를 다시 labels, storeData, likeData로 분리
    const sortedLabels = sortedData.map(item => item.label);
    const sortedStoreData = sortedData.map(item => item.storeData);
    const sortedLikeData = sortedData.map(item => item.likeData);

    // 기존 차트가 있으면 삭제 후 새로 생성
    if (performanceChart) {
        performanceChart.destroy();
    }

    const ctx = document.getElementById('performanceChart').getContext('2d');
    performanceChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: sortedLabels,  // 정렬된 날짜 라벨
            datasets: [
                {
                    label: '팝업스토어 등록 수',
                    data: sortedStoreData,
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    tension: 0.4,
                    borderWidth: 2,
                    pointStyle: 'circle',
                    pointRadius: 5,
                },
                {
                    label: '팝업스토어 좋아요 수',
                    data: sortedLikeData,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    tension: 0.4,
                    borderWidth: 2,
                    pointStyle: 'circle',
                    pointRadius: 5,
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: true, position: 'top' },
                tooltip: { enabled: true }
            },
            scales: {
                x: { grid: { display: false } },
                y: {
                    beginAtZero: true,
                    position: 'left',
                    grid: { color: 'rgba(200, 200, 200, 0.3)' },
                    ticks: { stepSize: 100 },
                },
            }
        }
    });
};
document.addEventListener('DOMContentLoaded', function() {
    const { startDate, endDate } = calculateDateRange('week'); // 기본 기간 설정 (한달)
    fetchPerformanceData(startDate, endDate);  // 기본 데이터 요청
    fetchStorePerformanceRank(companyIdx, startDate, endDate);  // 기본 순위 요청
});

//기간 선택 이벤트
document.getElementById('dateRange').addEventListener('change', (e) => {
    const selectedRange = e.target.value; // 선택된 기간 값
    let startDate = '';
    let endDate = '';
    
    // 날짜 범위 계산
    const now = new Date();
    
    if (selectedRange === 'week') {
        // 일주일간 (일별)
        startDate = new Date(now);
        startDate.setDate(now.getDate() - 7); // 7일 전
        endDate = now;
    } else if (selectedRange === 'month') {
        // 한달간 (일별)
        startDate = new Date(now);
        startDate.setMonth(now.getMonth() - 1); // 한 달 전
        endDate = now;
    } else if (selectedRange === 'year') {
        // 1년간 (월별)
        startDate = new Date(now);
        startDate.setFullYear(now.getFullYear() - 1); // 1년 전
        endDate = now;
    }

    // 날짜를 'YYYY-MM-DD' 형식으로 변환
    const formattedStartDate = startDate.toISOString().split('T')[0];
    const formattedEndDate = endDate.toISOString().split('T')[0];

    // 서버에서 새 데이터 요청
    fetchPerformanceData(formattedStartDate, formattedEndDate);
    // 순위 계산을 위한 API 호출
    fetchStorePerformanceRank(companyIdx, formattedStartDate, formattedEndDate);
});

const fetchPerformanceData = (startDate, endDate) => {
    axios.get(`/Admin/daily-performance/\${companyIdx}`, {
        params: {
            startDate: startDate,  // 시작 날짜
            endDate: endDate  // 종료 날짜
        }
    })
    .then(response => {
        const data = response.data;

        // 서버에서 가져온 데이터로 차트 업데이트
        updateChart(data);
        
    })
    .catch(error => {
        console.error('Error fetching performance data:', error);

    });

});


};
const fetchStorePerformanceRank = (companyIdx, startDate, endDate) => {
    axios.get(`/Admin/Store/PerformanceRank/\${companyIdx}`, {
        params: { startDate: startDate, endDate: endDate }
    })
    .then(response => {
        const rank = response.data.rank || 'n';
        // 순위 업데이트
        document.getElementById('rank').innerText = `\${rank}`;
    })
    .catch(error => {
        console.error('Error fetching performance rank:', error);
    });
};

</script>
<script>
$(function(){
    $('.buttonsearch').on('click', function(){
        let company_idx = ${CompanyDetail.company_idx}; // JSP 표현식으로 company_idx를 가져옴
        let search = $('.inputsearch').val();
        
        window.location.href = "/Admin/Detailpagination?company_idx=" + company_idx + "&search=" + encodeURIComponent(search);
    });
});
$(function(){
   $('.resetbutton').on('click',function(){
      let company_idx = ${CompanyDetail.company_idx}
      window.location.href = "/Admin/Detail?company_idx="+company_idx;
   })
})
$(function(){
    $('.remote').on('click', function(){
        let store_idx = $(this).data('store-idx'); // data-store-idx에서 값 가져오기
         window.location.href = "/Users/Info?store_idx=" + store_idx; // URL로 이동
    });
});

</script>
    <%@include file="/WEB-INF/include/admin-footer.jsp" %>
</body>
</html>
  