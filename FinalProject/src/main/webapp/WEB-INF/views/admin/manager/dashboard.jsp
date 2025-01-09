<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>한국 주요 도시 도넛 차트</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>


main {
  padding-top:93px;
  margin-bottom:100px;
  margin-top:0;
}

 body {
  margin: 0;
}

.inner {
  margin:0 auto;
  max-width:1500px;
  display:flex;
  paddig-top:600px;
  height:100%;
  justify-content:space-between;
}

.container {
  background-color:#E8EEE7;
  width:1100px;
  height:100%;
  display:flex;
  flex-direction:column;
  justify-content:center;
  gap:100px;
  margin-top:0;
}

.chart-wrapper {
  width:100%;
  height:500px;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<main>
 	<div class="inner">
 	 <aside>
 	 <%@include file="/WEB-INF/include/admin-slidebartest.jsp" %>
 	 </aside>
 	 <div class="container">
      <div class="chart-wrapper">
       <canvas id="donutChart"></canvas>
	  </div>
	  <div class="chart-wrapper">
	   <canvas id="visitorChart"></canvas>
	  </div>
	  <div class="chart-wrapper">
	   <canvas id="trafficChart"></canvas>
	  </div>
	 </div>
 	</div>
</main>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
<script>
        const ctxdoughnut = document.getElementById('donutChart').getContext('2d');

        const data = {
            labels: ['광주', '부산', '서울', '대구', '울산', '대전', '인천'],
            datasets: [{
                data: [12, 19, 30, 15, 8, 10, 17],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                    'rgba(255, 159, 64, 0.8)',
                    'rgba(199, 199, 199, 0.8)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(199, 199, 199, 1)'
                ],
                borderWidth: 1
            }]
        };

        const options = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: '지역별 스토어 수 분포',
                    font: {size:25}
                }
            }
        };

        new Chart(ctxdoughnut, {
            type: 'doughnut',
            data: data,
            options: options
        });
        
     // 현재 날짜 기준으로 최근 7일간의 날짜 배열 생성
        const dates = [];
        for (let i = 6; i >= 0; i--) {
            const date = new Date();
            date.setDate(date.getDate() - i);
            dates.push(date.toLocaleDateString('ko-KR', { month: 'short', day: 'numeric' }));
        }

        // 방문자 수 데이터 (예시)
        const visitors = [120, 150, 180, 200, 160, 190, 210];

        // 차트 생성
       // 차트 생성
const ctx = document.getElementById('visitorChart').getContext('2d');
new Chart(ctx, {
    type: 'line',
    data: {
        labels: dates,
        datasets: [{
            label: '일일 방문자 수',
            data: visitors,
            borderColor: 'rgb(75, 192, 192)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            fill: true,
            tension: 0.1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '방문자 수',
                    font: {
                        size: 16 // Y축 제목 폰트 크기 조정
                    }
                }
            },
            x: {
                title: {
                    display: true,
                    text: '날짜',
                    font: {
                        size: 16 // X축 제목 폰트 크기 조정
                    }
                }
            }
        },
        plugins: {
            legend: {
                display: true, // 범례 표시 여부
                labels: {
                    font: {
                        size: 14 // 범례 폰트 크기 조정
                    }
                }
            },
            title: {
                display: true,
                text: '일일 방문자 수',
                font:{
                    size : 25 // 제목 폰트 크기 조정
                }
            }
        }
    }
});

//페이지 데이터 (예시)
const pages = ['메인', '검색', '지도', '프로필', '팝콘팩토리', '예약', '스토어 상세페이지'];
const trafficData = [1500, 1200, 800, 600, 400, 600, 800];

// 차트 생성
const ctxbar = document.getElementById('trafficChart').getContext('2d');
new Chart(ctxbar, {
    type: 'bar',
    data: {
        labels: pages,
        datasets: [{
            label: '페이지별 트래픽',
            data: trafficData,
            backgroundColor: [
                'rgba(255, 99, 132, 0.7)',
                'rgba(54, 162, 235, 0.7)',
                'rgba(255, 206, 86, 0.7)',
                'rgba(75, 192, 192, 0.7)',
                'rgba(153, 102, 255, 0.7)'
            ],
            borderColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 206, 86)',
                'rgb(75, 192, 192)',
                'rgb(153, 102, 255)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '트래픽 수'
                }
            },
            x: {
                title: {
                    display: true,
                    text: '페이지'
                }
            }
        },
        plugins: {
            legend: {
                display: false
            },
            title: {
                display: true,
                text: '페이지별 트래픽 현황',
                font: {size:25}
            }
        }
    }
});
</script>
</body>
</html>
