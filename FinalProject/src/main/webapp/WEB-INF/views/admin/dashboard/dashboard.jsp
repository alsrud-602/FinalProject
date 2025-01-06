<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>한국 주요 도시 도넛 차트</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="/css/admin-common.css" />
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
  margin-left: 5%;
  width:100%;
  display:flex;
  paddig-top:600px;
  height:100%;
}
aside{
margin-right: 20%;
}
.container {
  background-color:#E8EEE7;
  width:1400px;
  height:100%;
  display:flex;
  flex-direction:column;
  justify-content:center;
  gap:100px;
  margin-top:0;
  padding: 20px;
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
       <canvas id="donutChart"width="400" height="400"></canvas>
	  </div>
	  <div class="chart-wrapper">
	   <canvas id="visitorChart"></canvas>
	  </div>
	  <div class="chart-wrapper">
	   <canvas id="mainTrafficChart"></canvas>
	  </div>
	  <div class="chart-wrapper">
	   <canvas id="businessTrafficChart"></canvas>
	  </div>
	 </div>
 	</div>
</main>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
<script>
//도넛 차트 생성 함수
function createDonutChart(cities, storeCounts) {
    const ctxdoughnut = document.getElementById('donutChart').getContext('2d');

    // 총 스토어 수 계산
    const totalStores = storeCounts.reduce((acc, count) => acc + count, 0);

    // 퍼센트 계산
    const percentages = storeCounts.map(count => (count / totalStores * 100).toFixed(2));

    const chartData = {
        labels: cities,
        datasets: [{
            data: storeCounts,
            backgroundColor: [
                'rgba(255, 99, 132, 0.8)',  // 빨간색
                'rgba(54, 162, 235, 0.8)',   // 파란색
                'rgba(255, 206, 86, 0.8)',    // 노란색
                'rgba(75, 192, 192, 0.8)',    // 청록색
                'rgba(153, 102, 255, 0.8)',   // 보라색
                'rgba(255, 159, 64, 0.8)',     // 오잉지색
                'rgba(199, 199, 199, 0.8)',     // 회색
                'rgba(255, 99, 71, 0.8)',      // 토마토색
                'rgba(0, 128, 0, 0.8)',        // 초록색
                'rgba(255, 165, 0, 0.8)',      // 주황색
                'rgba(128, 0, 128, 0.8)',      // 자주색
                'rgba(0, 255, 255, 0.8)',      // 밝은 청록색
                'rgba(128, 128, 0, 0.8)',      // 올리브색
                'rgba(0, 0, 255, 0.8)',        // 파란색
                'rgba(255, 20, 147, 0.8)',     // 딸기색
                'rgba(135, 206, 235, 0.8)',    // 하늘색
                'rgba(255, 105, 180, 0.8)'     // 핑크색
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',  // 빨간색
                'rgba(54, 162, 235, 1)',   // 파란색
                'rgba(255, 206, 86, 1)',    // 노란색
                'rgba(75, 192, 192, 1)',    // 청록색
                'rgba(153, 102, 255, 1)',   // 보라색
                'rgba(255, 159, 64, 1)',     // 오잉지색
                'rgba(199, 199, 199, 1)',     // 회색
                'rgba(255, 99, 71, 1)',      // 토마토색
                'rgba(0, 128, 0, 1)',        // 초록색
                'rgba(255, 165, 0, 1)',      // 주황색
                'rgba(128, 0, 128, 1)',      // 자주색
                'rgba(0, 255, 255, 1)',      // 밝은 청록색
                'rgba(128, 128, 0, 1)',      // 올리브색
                'rgba(0, 0, 255, 1)',        // 파란색
                'rgba(255, 20, 147, 1)',     // 딸기색
                'rgba(135, 206, 235, 1)',    // 하늘색
                'rgba(255, 105, 180, 1)'     // 핑크색
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
                text: '시도별 스토어 수 분포도',
                font: { size: 25 }
            },
            tooltip: {
                callbacks: {
                    label: function(tooltipItem) {
                        const count = tooltipItem.raw; // 개수
                        const percentage = percentages[tooltipItem.dataIndex]; // 퍼센트
                        return `\${tooltipItem.label}: \${count}개 (\${percentage}%)`; // 개수 및 퍼센트 표시
                    }
                }
            }
        }
    };

    new Chart(ctxdoughnut, {
        type: 'doughnut',
        data: chartData,
        options: options
    });
}

// Ajax 요청으로 데이터 가져오기
fetch('/Admin/getPopupList')
    .then(response => response.json())
    .then(data => {
        // cities와 storeCounts 초기화
       const cities = data.map(item => item.CITY); // 대문자 CITY 사용
		const storeCounts = data.map(item => item.STORE_COUNT); // 대문자 STORE_COUNT 사용

        // 차트 생성 함수 호출
        createDonutChart(cities, storeCounts);
    })
    .catch(error => console.error('Error fetching data:', error));
    
    </script>
    
<script>

fetch('/Stats/recent-week-visitors')
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        const dates = Object.keys(data);
        const visitors = Object.values(data);

        const formattedDates = dates.map(date => {
		    const d = new Date(date);
		    return d.toLocaleDateString('ko-KR', { year: 'numeric', month: 'short', day: 'numeric' });
		});

        // 차트 생성
        const ctx = document.getElementById('visitorChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: formattedDates,
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
                            font: { size: 16 }
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: '날짜',
                            font: { size: 16 }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        labels: { font: { size: 14 } }
                    },
                    title: {
                        display: true,
                        text: '최근 한달간 방문자 수',
                        font: { size: 25 }
                    }
                }
            }
        });
    })
    .catch(error => {
        console.error('Error fetching recent-week visitors:', error);
    });
</script>
<script>
    // 페이지 데이터
    const pages = ['메인', '검색', '지도', '프로필', '팝콘팩토리', '예약', '스토어 상세페이지', '회원가입 및 로그인'];
    
    // AJAX 요청으로 페이지 트래픽 데이터 가져오기
    fetch('/Stats/mainTraffic')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            const trafficData = pages.map(page => data[page] || 0); // 페이지별 트래픽 데이터

            // 차트 생성
            const ctxbar = document.getElementById('mainTrafficChart').getContext('2d');
            new Chart(ctxbar, {
                type: 'bar',
                data: {
                    labels: pages,
                    datasets: [{
                        label: '페이지별 트래픽',
                        data: trafficData,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.7)', // 핑크
                            'rgba(54, 162, 235, 0.7)', // 블루
                            'rgba(75, 192, 192, 0.7)', // 청록색
                            'rgba(255, 206, 86, 0.7)', // 노란색
                            'rgba(153, 102, 255, 0.7)', // 보라색
                            'rgba(255, 159, 64, 0.7)', // 오렌지색
                            'rgba(201, 74, 224, 0.7)', // 자주색
                            'rgba(255, 99, 71, 0.7)'   // 토마토색
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)', // 핑크
                            'rgb(54, 162, 235)', // 블루
                            'rgb(75, 192, 192)', // 청록색
                            'rgb(255, 206, 86)', // 노란색
                            'rgb(153, 102, 255)', // 보라색
                            'rgb(255, 159, 64)', // 오렌지색
                            'rgb(201, 74, 224)', // 자주색
                            'rgb(255, 99, 71)'   // 토마토색
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
                            text: '메인 페이지별 트래픽 현황',
                            font: {size: 25}
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching traffic data:', error);
        });
</script>
<script>
// 페이지 데이터
const bpages = ['관리', '사전예약 운영', '현장 운영', '현장 대기 운영', '관리자 요청', '회원가입 및 로그인'];

// AJAX 요청으로 페이지 트래픽 데이터 가져오기
fetch('/Stats/businessTraffic')
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        const trafficData = bpages.map(page => data[page] || 0); // 페이지별 트래픽 데이터

        // 차트 생성
        const ctxbar = document.getElementById('businessTrafficChart').getContext('2d');
        new Chart(ctxbar, {
            type: 'bar',
            data: {
                labels: bpages,
                datasets: [{
                    label: '페이지별 트래픽',
                    data: trafficData,
                    backgroundColor: [
                        'rgba(255, 165, 0, 0.7)',  // 주황색
                        'rgba(30, 144, 255, 0.7)', // 도넛블루
                        'rgba(34, 139, 34, 0.7)',  // 다크 그린
                        'rgba(255, 20, 147, 0.7)',  // 딥 핑크
                        'rgba(148, 0, 211, 0.7)',   // 보라색
                        'rgba(255, 105, 180, 0.7)'  // 핫핑크
                    ],
                    borderColor: [
                        'rgb(255, 165, 0)',         // 주황색
                        'rgb(30, 144, 255)',        // 도넛블루
                        'rgb(34, 139, 34)',         // 다크 그린
                        'rgb(255, 20, 147)',        // 딥 핑크
                        'rgb(148, 0, 211)',         // 보라색
                        'rgb(255, 105, 180)'        // 핫핑크
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
                        text: '스토어 운영자 페이지별 트래픽 현황',
                        font: {size: 25}
                    }
                }
            }
        });
    })
    .catch(error => {
        console.error('Error fetching traffic data:', error);
    });
</script>
</body>
</html>
