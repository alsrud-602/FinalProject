<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>POP CORN.biz - 운영</title>
    <link rel="stylesheet" href="/css/common-company.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style type="text/css">
    body{
    
    }
	main {
		margin: 0;
		padding: 20px 20px 20px 0;
		width: 1200px;
		position: absolute;
		left: 50%; 
		transform: translateX(-50%); 
		margin-bottom: 93px;
	}
	
	/* 제목 */
	.title {
		border: 2px solid #9A9A9A;
		margin-top: 30px;
		padding: 40px 50px 30px 50px;
	}
	
	p {
		color: #757575;
		font-size: 20px;
		font-weight: bold;
		margin: 0px;
	}
	
	.title_header {
		display: flex;
		justify-content: space-between;
	}
	
	.title_category {
		color: #757575;
		font-size: 16px;
		font-weight: 600;
	}
	
	.title_name {
		color: #000000;
		font-size: 34px;
		font-weight: 700;
	}
	
	.title_subname {
		color: #000000;
		font-size: 20px;
		font-weight: 600;
	}
	
	.title_icon {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		color: white;
		font-size: 16px;
		font-weight: 600;
		gap: 4px; img { width : 30px;
		height: 30px;
		}
	
	}
	.title_adress {
		margin-top: 5px;
		display: flex;
		justify-content: flex-start;
		color: #757575;
		font-size: 16px;
		font-weight: 600;
	}
	
	.tags {
		margin-top: 12px;
		display: flex;
		justify-content: flex-start;
		gap: 8px;
	}
	
	.tag_option {
		border: 1px solid #121212;
		border-radius: 5px;
		background: white;
		color: #121212;
		font-size: 16px;
		font-weight: 800;
		padding: 5px 7px;
	}
	
	.title_click {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		color: white;
		font-size: 16px;
		font-weight: 600;
		gap: 4px; div { padding : 10px;
		display: flex;
		gap: 4px;
		align-items: center;
		border-radius: 5px;
		border: 1px solid #ffffff;
		}
	
		img {
			width: 20px;
			height: 20px;
		}
	
	}
	.title_footer {
		display: flex;
		justify-content: space-between;
	}
	/* ------------------------------------------ */
	
	/* 정보 */
.info {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    margin: 50px 0; /* 상하 여백 */
}

.frame-496 {
    display: flex;
    justify-content: space-around; /* 요소 사이의 간격을 균등하게 */
    width: 100%; /* 전체 너비 */
}

.frame-490,
.frame-492,
.frame-497,
.frame-498 {
    background: #e3e3e3;
    border: 2px solid #9a9a9a;
    width: 273px; /* 각 요소의 너비 */
    height: 104px; /* 각 요소의 높이 */
    display: flex;
    align-items: center; /* 가로 중앙 정렬 */
    justify-content: center; /* 세로 중앙 정렬 */
}

.review, .total-score, .heart, .view {
    color: #121212;
    text-align: center;
    font-family: "Pretendard-Bold", sans-serif;
    font-size: 18px; /* 폰트 크기 조정 */
    line-height: 140%;
    letter-spacing: 0.025em;
    font-weight: 700;
}

._4, ._4-5, ._200, ._30 {
    color: #000000;
    margin-left: 40px;
    text-align: center; /* 가운데 정렬 */
    font-family: "Pretendard-Black", sans-serif;
    font-size: 20px; /* 폰트 크기 조정 */
    line-height: 140%;
    letter-spacing: 0.025em;
    font-weight: 600;
}
	/* -------------------------- */
	
	/* 혼잡도 */
	
.real-time-updates {
    border: 2px solid #9a9a9a;
    padding: 20px;
    height: auto;
    position: relative;
    overflow: hidden;
    background-color: #fff; /* 배경색 추가 */
}

.traffic-update {
    margin: 20px;
}

.traffic-update-controls {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 양 끝으로 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    margin-bottom: 10px; /* 요소 사이 간격 */
}

.traffic-update label {
    font-weight: bold; /* 텍스트 두껍게 */
    font-size: 18px; /* 레이블 폰트 크기 */
}

button.use-btn {
    margin-left: 10px; /* 레이블과의 간격 */
    padding: 10px 15px; /* 버튼 패딩 */
    background-color: #007bff; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    cursor: pointer; /* 마우스 포인터 변경 */
    transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
}

button.use-btn:hover {
    background-color: #0056b3; /* 호버 시 배경색 변화 */
}

#traffic-range {
    width: 100%;
}

.graph {
    margin: 20px;
    text-align: center; /* 텍스트 중앙 정렬 */
    font-size: 16px; /* 그래프 제목 폰트 크기 */
    font-weight: bold; /* 제목 두껍게 */
}

.charts {
    display: flex;
    justify-content: space-between; /* 그래프들 사이의 간격 */
    margin: 20px 0; /* 그래프 상하 간격 */
}

canvas {
    max-width: 48%; /* 그래프의 너비 조정 */
    height: 500px; /* 그래프의 높이 조정 */
    background-color: rgba(200, 200, 200, 0.1); /* 그래프 배경색 */
    border-radius: 4px; /* 모서리 둥글게 */
    border: 1px solid rgba(0, 0, 0, 0.1); /* 테두리 추가 */
}

.chart-labels {
    display: flex;
    justify-content: space-between; /* 텍스트 사이의 간격 */
    margin-top: 10px; /* 그래프와 텍스트 간격 */
}

.chart-labels p {
    text-align: center; /* 평균 텍스트 중앙 정렬 */
    font-size: 14px; /* 평균 텍스트 폰트 크기 */
    margin: 0; /* 기본 마진 제거 */
    color: #555; /* 평균 텍스트 색상 */
    width: 48%; /* 텍스트의 너비 조정 */
}


	
	/* -------------------------- */
	
	.calendar {
		display: flex;
		justify-content: space-between;
		border: 1px solid #333333;
		border-radius:18px;
	}
	
	.calendar-grid {
		display: grid;
		grid-template-columns: repeat(7, 1fr);
		gap: 5px;
		margin-top: 10px;
		border: 1px solid #ddd;
		border-radius: 8px;
		padding: 10px;
	}
	
	/* section calendar */
	.sec_cal {
		width: 360px;
		margin: 0 auto;
		font-family: "NotoSansR";
	}
	
	.sec_cal .cal_nav {
		display: flex;
		justify-content: center;
		align-items: center;
		font-weight: 700;
		font-size: 48px;
		line-height: 78px;
	}
	
	.sec_cal .cal_nav .year-month {
		width: 300px;
		text-align: center;
		line-height: 1;
	}
	.year-month{
		font-size: 25px;
	}
	
	.sec_cal .cal_nav .nav {
		display: flex;
		border: 1px solid #333333;
		border-radius: 5px;
	}
	
	.sec_cal .cal_nav .go-prev, .sec_cal .cal_nav .go-next {
		display: block;
		width: 50px;
		height: 78px;
		font-size: 0;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.sec_cal .cal_nav .go-prev::before, .sec_cal .cal_nav .go-next::before {
		content: "";
		display: block;
		width: 20px;
		height: 20px;
		border: 3px solid #000;
		border-width: 3px 3px 0 0;
		transition: border 0.1s;
	}
	
	.sec_cal .cal_nav .go-prev:hover::before, .sec_cal .cal_nav .go-next:hover::before
		{
		border-color: #ed2a61;
	}
	
	.sec_cal .cal_nav .go-prev::before {
		transform: rotate(-135deg);
	}
	
	.sec_cal .cal_nav .go-next::before {
		transform: rotate(45deg);
	}
	
	.sec_cal .cal_wrap {
		padding-top: 40px;
		position: relative;
		margin: 0 auto;
	}
	
	.sec_cal .cal_wrap .days {
		display: flex;
		margin-bottom: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #ddd;
	}
	
	.sec_cal .cal_wrap::after {
		top: 368px;
	}
	
	.sec_cal .cal_wrap .day {
		display: flex;
		align-items: center;
		justify-content: center;
		width: calc(100%/ 7);
		text-align: left;
		color: #999;
		font-size: 12px;
		text-align: center;
		border-radius: 5px
	}
	
	.current.today {
		background: rgb(242, 242, 242);
	}
	
	.sec_cal .cal_wrap .dates {
		display: flex;
		flex-flow: wrap;
		height: 290px;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n) {
		color: #3c6ffa;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n+1) {
		color: #ed2a61;
	}
	
	.sec_cal .cal_wrap .day.disable {
		color: #ddd;
	}
	
	.selected {
		background-color: #BDFF91; /* 선택된 날짜 배경색 */
		color: black; /* 선택된 날짜 글자색 */
	}
	
	.nav-btn {
		display: inline-block; /* 요소가 보이게 설정 */
		padding: 10px; /* 여백 추가 */
		font-size: 16px; /* 글자 크기 */
	}
	
	.footer-container-calendar {
		border-top: 1px solid #dadada;
		padding-top: 10px;
		font-size: 18px;
	}
	
	.footer-container-calendar select {
		cursor: pointer;
		display: inline-block;
		zoom: 1;
		background: #ffffff;
		color: #585858;
		border: 1px solid #bfc5c5;
		border-radius: 3px;
		padding: 5px;
		font-size: 20px; /* 원하는 글자 크기로 설정 */
	}
	
	.reservation {
	margin-top: 20px;
    border: 2px solid #9a9a9a;
    padding: 20px;
    height: auto;
    position: relative;
    overflow: hidden;
    background-color: #fff; /* 배경색 추가 */
	}
	
.reservation-container {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 요소 간의 간격을 조정 */
    align-items: flex-start; /* 상단 정렬 */
    margin-bottom: 20px;
    margin-top: 20px;
}

.calendar {
    flex: 1; /* 캘린더가 가능한 한 넓게 차지하도록 설정 */
    margin-right: 20px; 
}

.reservations {
    flex: 2; /* 예약 현황이 더 넓게 차지하도록 설정 */
    text-align: center;
}

h4{

margin-bottom: 20px;
}
table {
    width: 100%; /* 테이블이 부모 요소의 너비를 가득 채우도록 설정 */
    border-collapse: collapse; /* 테이블 경계선 겹침 방지 */
}

th, td {
    border: 1px solid #ccc; /* 경계선 스타일 */
    padding: 8px; /* 패딩 추가 */
    text-align: center; /* 텍스트 중앙 정렬 */
}
	
	.buttons {
		display: flex;
		justify-content: space-between;
		margin-top: 20px;
	}
	
	button {
		background-color: #4CAF50;
		color: white;
		border: none;
		padding: 10px 15px;
		border-radius: 5px;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	
	button:hover {
		background-color: #45a049;
	}
	</style>
</head>

<body>
    <%@include file="/WEB-INF/include/header_company.jsp" %>
    <main>
       	<h1>운영 팝업스토어</h1>
	    <div class='title'>
	   
	      <div class="title_header"> 
	        <div class="title_category">잡화 > 스포츠 > 2030대</div> 
	        <div class="title_icon">
	          <p></p>&nbsp;
	          <p></p>&nbsp;
	          <img src="/images/icon/degree_b.png"><p>90%</p>
	        </div>
	      </div>
	      <p class="title_name">스텐리 1943 기념 팝업스토어</p>
	      <p class="title_subname"> 드디어 상륙! 스탠리와 메시의 콜라보 팝업스토어가 떴다!</p>
	      <div class="title_adress">
	        <img src="/images/icon/map1.png">&nbsp;<p>서울 성동구 성수이로 134-2</p>&nbsp;&nbsp;<p>|</p>&nbsp;&nbsp;
	        <img src="/images/icon/store.png">&nbsp;<p>스텐리</p>
	      </div>
	      <div class="title_footer">
	      <div class="tags">
	      <div class="tag_option">스텐리</div> 
	      <div class="tag_option">포토부스</div>
	      </div>
	      <div class="title_click" >
	      </div>
	      </div>
	    
	    </div>
    
		<div class="info">    
		    <div class="frame-496">
		        <div class="frame-490">
		            <div class="review">현재 리뷰 수</div>
		            <div class="_4">4</div>
		        </div>
		        <div class="frame-492">
		            <div class="total-score">평균 평점</div>
		            <div class="_4-5">4.5</div>
		        </div>
		        <div class="frame-497">
		            <div class="heart">좋아요</div>
		            <div class="_200">200</div>
		        </div>
		        <div class="frame-498">
		            <div class="view">조회수</div>
		            <div class="_30">30</div>
		        </div>
		    </div>
		</div>
		
		<section class="real-time-updates">
		    <h3>실시간 혼잡도 업데이트</h3>
		    <div class="traffic-update">
		        <div class="traffic-update-controls">
		            <label for="traffic-range">혼잡도 업데이트</label>
		            <button class="use-btn">사용하기</button>
		        </div>
		        <input type="range" id="traffic-range" min="0" max="100" style="width: 100%;">
		    </div>
		    <hr>
		    <h4 class="graph">혼잡도 그래프</h4>
		    <div class="charts">
		        <canvas id="trafficChart"></canvas>
		        <canvas id="dailyTrafficChart"></canvas>
		    </div>
		    <div class="chart-labels">
		        <p>하루 평균</p>
		        <p>일주일 평균</p>
		    </div>
		</section>

<section class="reservation">
    <h3>사전예약명단</h3>
    <div class="reservation-container">
        <div class="calendar">
            <div class="sec_cal">
                <div class="cal_nav">
                    <a href="javascript:;" class="nav-btn go-prev">prev</a>
                    <div class="footer-container-calendar">
	                    <label for="month"></label>
	                    <select id="year"></select>
	                    <select id="month">
	                        <option value="0">1월</option>
	                        <option value="1">2월</option>
	                        <option value="2">3월</option>
	                        <option value="3">4월</option>
	                        <option value="4">5월</option>
	                        <option value="5">6월</option>
	                        <option value="6">7월</option>
	                        <option value="7">8월</option>
	                        <option value="8">9월</option>
	                        <option value="9">10월</option>
	                        <option value="10">11월</option>
	                        <option value="11">12월</option>
	                    </select>
                	</div>
                    <a href="javascript:;" class="nav-btn go-next">next</a>
                </div>

                <div class="cal_wrap">
                    <div class="days">
                        <div class="day">일</div>
                        <div class="day">월</div>
                        <div class="day">화</div>
                        <div class="day">수</div>
                        <div class="day">목</div>
                        <div class="day">금</div>
                        <div class="day">토</div>
                    </div>
                    <div class="dates"></div>
                </div>

            </div>
        </div>
        <div class="reservations">
            <h4>[예약 현황]</h4>
            <table>
                <tr>
                    <th>순번</th>
                    <th>시간</th>
                    <th>예약 현황</th>
                    <th>상세보기</th>
                </tr>
                <tr>
                    <td>2차</td>
                    <td>11:30 - 12:00</td>
                    <td>27명 예약</td>
                    <td><button>명단보기</button></td>
                </tr>
                <tr>
                    <td>3차</td>
                    <td>11:30 - 12:00</td>
                    <td>24명 예약</td>
                    <td><button>명단보기</button></td>
                </tr>
                <tr>
                    <td>4차</td>
                    <td>11:30 - 12:00</td>
                    <td>10명 예약</td>
                    <td><button>명단보기</button></td>
                </tr>
                <tr>
                    <td>5차</td>
                    <td>11:30 - 12:00</td>
                    <td>6명 예약</td>
                    <td><button>명단보기</button></td>
                </tr>
            </table>
        </div>
    </div>
            <section class="first-reservation">
            <h3>2차 명단</h3>
            <table>
                <tr>
                    <th>순번</th>
                    <th>이름</th>
                    <th>ID</th>
                    <th>연락처</th>
                    <th>상세보기</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>김진환</td>
                    <td>bange</td>
                    <td>전화번호</td>
                    <td><button>상세보기</button></td>
                </tr>
                <!-- 추가 명단 -->
            </table>
        </section>
</section>



        <div class="buttons">
            <button>예약 일자 수정하기</button>
            <button>기본 정보 수정하기</button>
            <button>팝업 페이지 이동하기</button>
        </div>
    <%@include file="/WEB-INF/include/footer_company.jsp" %>
    </main>
    <script>
	    /* 혼잡도 그래프 */
	    const ctx = document.getElementById('trafficChart').getContext('2d');
const dailyCtx = document.getElementById('dailyTrafficChart').getContext('2d');

const trafficChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['11:00', '1:00', '3:00', '5:00', '7:00'],
        datasets: [{
            label: '혼잡도',
            data: [30, 50, 70, 100, 80],
            backgroundColor: 'rgba(75, 192, 192, 0.5)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                min: 0,
                max: 100,
                ticks: {
                    font: { size: 16 }
                }
            },
            x: {
                ticks: {
                    font: { size: 16 }
                }
            }
        },
        plugins: {
            legend: {
                labels: {
                    font: { size: 16 }
                }
            }
        }
    }
});

const dailyTrafficChart = new Chart(dailyCtx, {
    type: 'bar',
    data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
            label: '혼잡도',
            data: [20, 40, 60, 80, 100, 50, 30],
            backgroundColor: 'rgba(75, 192, 192, 0.5)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                min: 0,
                max: 100,
                ticks: {
                    font: { size: 16 }
                }
            },
            x: {
                ticks: {
                    font: { size: 16 }
                }
            }
        },
        plugins: {
            legend: {
                labels: {
                    font: { size: 16 }
                }
            }
        }
    }
});

// 현재 시간과 요일을 기반으로 혼잡도 업데이트
function updateTraffic() {
    const now = new Date();
    const currentHour = now.getHours();
    const currentDay = now.getDay(); // 0: 일요일, 1: 월요일, ..., 6: 토요일

    // 시간에 따른 혼잡도 설정
    const hourlyTraffic = [30, 50, 70, 100, 80]; // 기본 혼잡도
    trafficChart.data.datasets[0].data = hourlyTraffic.map((data, index) => {
        return index === Math.floor(currentHour / 2) ? Math.min(100, data + 20) : data; // 현재 시간에 맞춰 혼잡도 증가
    });
    trafficChart.update();

    // 요일에 따른 혼잡도 설정
    const dailyTraffic = [20, 40, 60, 80, 100, 50, 30]; // 기본 혼잡도
    dailyTrafficChart.data.datasets[0].data = dailyTraffic.map((data, index) => {
        return index === currentDay ? Math.min(100, data + 20) : data; // 현재 요일에 맞춰 혼잡도 증가
    });
    dailyTrafficChart.update();
}

// 슬라이더 이벤트 리스너
document.getElementById('traffic-range').addEventListener('input', function() {
    const value = this.value;

    // 슬라이더 값에 따라 혼잡도 조정
    trafficChart.data.datasets[0].data = trafficChart.data.datasets[0].data.map(data => {
        return Math.min(100, Math.max(0, data + (value - 50) * 0.5));
    });
    trafficChart.update();

    dailyTrafficChart.data.datasets[0].data = dailyTrafficChart.data.datasets[0].data.map(data => {
        return Math.min(100, Math.max(0, data + (value - 50) * 0.3));
    });
    dailyTrafficChart.update();
});

// 초기 혼잡도 업데이트
updateTraffic();

// 1분마다 혼잡도 업데이트
setInterval(updateTraffic, 60000);

	
	    /*
	    fetch('/getTrafficData')
	    .then(response => response.json())
	    .then(data => {
	        trafficChart.data.datasets[0].data = data;
	        trafficChart.update();
	    });
	    */
    </script>
    <script>
    /* 날짜 선택 */
const date = new Date();
const utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000);
const kstGap = 9 * 60 * 60 * 1000;
const today = new Date(utc + kstGap);
var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
const currentYear = thisMonth.getFullYear();
const currentMonth = thisMonth.getMonth();
const selectYear = document.getElementById("year");
const selectMonth = document.getElementById("month");
const createYear = generate_year_range(2020, 2050);

function calendarInit() {
    document.getElementById("year").innerHTML = createYear;
    selectYear.value = currentYear;
    selectMonth.value = currentMonth;

    renderCalender(thisMonth);

    $('.go-prev').on('click', function() {
        let year = parseInt(selectYear.value);
        let month = parseInt(selectMonth.value);

        if (month === 0) {
            month = 11; // 12월
            year--; // 연도 감소
        } else {
            month--; // 이전 월
        }

        selectYear.value = year;
        selectMonth.value = month;

        thisMonth = new Date(year, month, 1);
        renderCalender(thisMonth);
    });

    $('.go-next').on('click', function() {
        let year = parseInt(selectYear.value);
        let month = parseInt(selectMonth.value);

        if (month === 11) {
            month = 0; // 1월
            year++; // 연도 증가
        } else {
            month++; // 다음 월
        }

        selectYear.value = year;
        selectMonth.value = month;

        thisMonth = new Date(year, month, 1);
        renderCalender(thisMonth);
    });
}
function generate_year_range(start, end) {
    let years = "";
    for (let year = start; year <= end; year++) {
        years += "<option value='" + year + "'>" + year + "</option>";
    }
    return years;
}

$(document).ready(function() {
    calendarInit();

    $('#year, #month').on('change', jump);
});

function jump() {
    const year = document.getElementById('year').value; // 선택된 연도
    const month = document.getElementById('month').value; // 선택된 월 (0 ~ 11)
    console.log(`Selected Year: ${year}, Selected Month: ${month}`);

    // 선택된 연도/월에 따라 캘린더를 업데이트합니다.
    const selectedMonthDate = new Date(year, month, 1);
    renderCalender(selectedMonthDate);
}

function addDateSelection(currentYear, currentMonth) {
    const calendarDays = document.querySelectorAll('.dates .day.current');
    const reservationHeader = document.querySelector('.reservations h4'); // <h4> 요소 선택

    calendarDays.forEach(day => {
        day.addEventListener('click', function() {
            // 선택된 연도와 월 가져오기
            const year = currentYear; // renderCalender에서 전달된 연도
            const month = currentMonth; // renderCalender에서 전달된 월
            const dayNumber = parseInt(this.textContent); // 클릭한 날짜

            // 선택된 날짜 객체 생성
            const selectedDate = new Date(year, month, dayNumber);
            const options = { year: 'numeric', month: '2-digit', day: '2-digit', weekday: 'long' };
            const formattedDate = selectedDate.toLocaleDateString('ko-KR', options); // 한국어 형식으로 날짜 포맷팅

            // 선택된 날짜에 따라 <h4> 내용 업데이트
            reservationHeader.textContent = "[" + formattedDate + " 예약 현황]";

            // 선택된 날짜 표시
            calendarDays.forEach(d => d.classList.remove('selected'));
            this.classList.add('selected');
        });
    });
}


function renderCalender(thisMonth) {
    const currentYear = thisMonth.getFullYear();
    const currentMonth = thisMonth.getMonth();
    
    selectYear.value=currentYear;
    selectMonth.value=currentMonth;

    const startDay = new Date(currentYear, currentMonth, 1);
    const endDay = new Date(currentYear, currentMonth + 1, 0);
    
    const firstDayOfWeek = startDay.getDay(); // 첫 날의 요일 (0: 일요일)
    const prevMonthLastDate = new Date(currentYear, currentMonth, 0).getDate(); // 전 달 마지막 날
    const nextMonthDaysToFill = (7 - ((endDay.getDate() + firstDayOfWeek) % 7)) % 7; // 다음 달 날짜 수

    const calendar = document.querySelector('.dates');
    calendar.innerHTML = '';

    // 이전 달 날짜 추가
    for (let i = prevMonthLastDate - firstDayOfWeek + 1; i <= prevMonthLastDate; i++) {
        calendar.innerHTML += '<div class="day prev disable">' + i + '</div>';
    }

    // 현재 달 날짜 추가
    for (let i = 1; i <= endDay.getDate(); i++) {
        calendar.innerHTML += '<div class="day current">' + i + '</div>';
    }

    // 다음 달 날짜 추가
    for (let i = 1; i <= nextMonthDaysToFill; i++) {
        calendar.innerHTML += '<div class="day next disable">' + i + '</div>';
    }

    // 오늘 날짜 표시
    if (today.getMonth() === currentMonth) {
        const todayDate = today.getDate();
        const currentMonthDate = document.querySelectorAll('.dates .current');
        currentMonthDate[todayDate - 1].classList.add('today');
    }

    addDateSelection(currentYear, currentMonth); // 날짜 선택 기능 추가 // 날짜 선택 기능 추가
}




    </script>
</body>
</html>