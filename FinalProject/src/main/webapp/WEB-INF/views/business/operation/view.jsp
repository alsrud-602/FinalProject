<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>POP CORN.biz - 운영</title>
<link rel="stylesheet" href="/css/common-company.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style type="text/css">
main {
	margin: 0;
	padding: 20px 20px 20px 0;
	width: 1200px;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
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
h3 {
	font-size: 28px;
	margin: 0; /* 기본 마진 제거 */
}
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

.frame-490, .frame-492, .frame-497, .frame-498 {
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
	background-color: #91FFCD; /* 버튼 배경색 */
	color: black;
	width: 131px;
	height: 46px;
	font-size: 20px;
	border: 1px solid #9A9A9A;
	transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
}

button.use-btn:hover {
	background-color: #80E2B6; /* 호버 시 배경색 변화 */
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
	border-radius: 18px;
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

.year-month {
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

.pre-reservation {
	margin-top: 20px;
	border: 2px solid #9a9a9a;
	padding: 20px;
	height: auto;
	position: relative;
	overflow: hidden;
	background-color: #fff; /* 배경색 추가 */
}

.pre-reservation-container {
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

.pre-reservations {
	flex: 2; /* 예약 현황이 더 넓게 차지하도록 설정 */
	text-align: center;
}

h4 {
	font-size: 24px;
	margin-bottom: 20px;
}
/* 테이블 스타일 */
table {
	width: 100%; /* 테이블이 부모 요소의 너비를 가득 채우도록 설정 */
	border-collapse: collapse; /* 테이블 경계선 겹침 방지 */
}

th, td {
	border: 1px solid #ddd; /* 경계선 스타일 */
	padding: 10px; /* 패딩 추가 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

th {
	background-color: #f2f2f2; /* 헤더 배경색 */
}

/* 행 hover 효과 */
tr:hover {
	background-color: #f1f1f1; /* 마우스 오버 시 색상 변경 */
}

/* 버튼 스타일 */
button, .notify-btn, .delete-btn {
	background-color: #4CAF50; /* 기본 버튼 배경색 */
	color: white;
	border: 1px solid #9A9A9A;
	padding: 10px 15px;
	transition: background-color 0.3s;
}

.notify-btn {
	background-color: #F1FFDF;
	color: black;
	&:
	hover
	{
	background-color
	:
	#DFF4C3;
}

}
.delete-btn {
	background-color: #FFC9C9;
	color: black;
	&:
	hover
	{
	background-color
	:
	#EEBBBB;
}

}
button:hover {
	background-color: #45a049; /* 호버 시 색상 변경 */
}

/* 버튼 간격 및 스타일 */
.buttons-footer {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.buttons-footer a {
	flex: 1;
	margin: 0 10px; /* 버튼 간의 간격 */
	color: black;
	width: 318px;
	height: 87px;
	font-size: 22px;
	background-color: #fff; /* 버튼 배경색 */
	border: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
}

.notify-all-btn {
	width: 164px;
	height: 46px;
	font-size: 20px;
	background-color: #8BC34A; /* 전체 알림 버튼 색상 */
}

/* 현장예약 */
.reservation-status {
	margin-top: 20px;
	border: 2px solid #9a9a9a;
	padding: 20px;
	height: auto;
	position: relative;
	overflow: hidden;
	background-color: #fff; /* 배경색 추가 */
	width: 100%;
	left: -20px;
	box-sizing: border-box; /* 패딩과 경계선을 포함하여 전체 너비 계산 */
}

.warning-message {
	color: red; /* 경고 메시지 색상 */
	margin-bottom: 15px;
	font-size: 20px;
}

/* 컨트롤 스타일 */
.reservation-list {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.reservation-list select, .reservation-list input {
	padding: 8px;
}

/* 예약 섹션 스타일 */
.pre-reservation-list, .reservation-status {
	margin: 20px;
}

.pre-reservation-header, .reservation-header {
	display: flex;
	justify-content: space-between; /* 제목과 버튼을 양쪽으로 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	margin-bottom: 10px;
}
/* 현장대기 상세관리*/
.notification, .notification-delete {
	display: none; /* 기본적으로 숨김 */
	position: absolute;
	top: 50%; /* 중앙에 위치 */
	left: 50%; /* 중앙에 위치 */
	transform: translate(-50%, -50%); /* 중앙 정렬 */
	width: 333px; /* 팝업 너비 */
	height: 238px;
	background-color: white;
	border: 1px solid #ccc; /* 테두리 색상 */
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	border-radius: 8px; /* 모서리 둥글게 */
	padding: 20px; /* 내부 여백 */
}

.n-header, .n-d-header {
	display: flex;
	font-size: 24px;
	justify-content: space-between;
	align-items: center; /* 수직 정렬 */
}

.overlay h3 {
	margin: 0; /* 기본 마진 제거 */
	font-size: 20px; /* 제목 크기 */
	color: #333; /* 제목 색상 */
}

.overlay select {
	width: 100%; /* 드롭다운 너비 */
	padding: 20px; /* 내부 여백 */
	font-size: 20px;
	margin: 15px 0; /* 위아래 여백 */
	border: 1px solid #9a9a9a; /* 테두리 색상 */
	border-radius: 4px; /* 모서리 둥글게 */
}

.overlay button {
	width: 100%; /* 버튼 너비 */
	padding: 15px; /* 내부 여백 */
	background-color: #ffffff; /* 버튼 배경색 */
	border: 1px solid #9a9a9a;
	color: black;
	border-radius: 4px; /* 모서리 둥글게 */
	margin: 5px 0; /* 위쪽 여백 */
	cursor: pointer; /* 커서 모양 변경 */
	font-size: 20px; /* 글자 크기 */
}

.overlay button:hover {
	background-color: #dddddd; /* 버튼 호버 색상 */
}

.close-btn, .close-delete-btn {
	cursor: pointer;
	font-weight: 300;
	font-size: 30px;
	color: #999; /* 닫기 버튼 색상 */
}

.close-btn:hover, .close-delete-btn:hover {
	color: #333; /* 호버 시 색상 변화 */
}

.complete-delete-btn {
	background-color: #FFC9C9;
}

#icon_prev {
	width: 43px;
	height: 43px;
	position: absolute;
	top: 180px;
	left: calc(50% - 600px - 75px);
	cursor: pointer;
}

#icon_next {
	width: 43px;
	height: 43px;
	position: absolute;
	top: 180px;
	right: calc(50% - 600px - 50px);
	cursor: pointer;
}

.carousel-container {
	overflow: hidden;
	width: 1200px;
	position: relative;
}

.carousel {
	display: flex;
	position: relative;
	transition: transform 0.5s ease-in-out;
	will-change: transform;
}

.title {
	border: 2px solid #9A9A9A;
	margin-top: 30px;
	padding: 40px 50px 30px 50px;
	flex: 0 0 1200px;
}

#advanceReservation {
	display: none;
}

#alert-index{
font-size: 25px;
font-weight:600;
margin: 30px 42px;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/include/header_company.jsp"%>
	<main>
		<h1>운영 팝업스토어</h1>


		<img id="icon_prev" src="/images/icon/prev.png">

		<div class="carousel-container">

			<div class="carousel">
				<c:forEach var="store" items="${storeList}">
					<div class="title carousel_store"
						data-review="${store.review_count}"
						data-avg="${store.average_score}" data-rsIdx="${store.rs_idx}"
						data-hit="${store.hit}" data-like="${store.like}"
						data-storeIdx="${store.store_idx}" data-rstaus="${store.rstatus}"
						data-link="${store.link}" data-waitingCount="${store.waiting_count}" >
						<div class="title_header">
							<div class="title_category">${store.category_name}&nbsp;|&nbsp;${store.age}</div>
							<div class="title_icon">
								<p></p>
								&nbsp;
								<p></p>
								&nbsp; <img src="/images/icon/degree_b.png">
								<p>90%</p>
							</div>
						</div>
						<p class="title_name">${store.title}</p>
						<p class="title_subname">${store.introduction}</p>
						<div class="title_adress">
							<img src="/images/icon/map1.png">&nbsp;
							<p>${store.address}</p>
							&nbsp;&nbsp;
							<p>|</p>
							&nbsp;&nbsp; <img src="/images/icon/store.png">&nbsp;
							<p>${store.brand1}</p>
							<c:if test="${not empty store.brand2}">
								<p>${store.brand2}</p>
							</c:if>
						</div>
						<div class="title_footer">
							<div class="tags">
								<div class="tag_option">${store.tag_name}</div>
								<div class="tag_option">포토부스</div>
							</div>
							<div class="title_click"></div>
						</div>
					</div>
				</c:forEach>






			</div>
		</div>
		<img id="icon_next" src="/images/icon/next.png">


		<div class="info">
			<div class="frame-496">
				<div class="frame-490">
					<div class="review">현재 리뷰 수</div>
					<div class="_4">0</div>
				</div>
				<div class="frame-492">
					<div class="total-score">평균 평점</div>
					<div class="_4-5">0</div>
				</div>
				<div class="frame-497">
					<div class="heart">좋아요</div>
					<div class="_200">0</div>
				</div>
				<div class="frame-498">
					<div class="view">조회수</div>
					<div class="_30">0</div>
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
				<input type="range" id="traffic-range" min="0" max="100"
					style="width: 100%;">
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
		<input type="hidden" id="reservation_rsIdx" value="" /> 
		<input type="hidden" id="reservation_rstatus" value="" /> 
		<input type="hidden" id="reservation_link" value="" />
		<input type="hidden" id="reservation_storeIdx" value="" />
		<input type="hidden" id="reservation_wc" value="" />

		<div id="advanceReservation">


			<section class="pre-reservation">
				<h3>사전예약명단</h3>

				<div class="pre-reservation-container">
					<div class="calendar">
						<div class="sec_cal">
							<div class="cal_nav">
								<a href="javascript:;" class="nav-btn go-prev">prev</a>
								<div class="footer-container-calendar">
									<label for="month"></label> <select id="year"></select> <select
										id="month">
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


					<div class="pre-reservations">
						<h4>[예약 현황]</h4>
						<table id="pre-reservation-table">
							<tr>
								<th>순번</th>
								<th>시간</th>
								<th>인원수</th>
								<th>상세보기</th>
							</tr>
							<!-- 동적으로 업데이트 될 부분 -->
						</table>
					</div>
				</div>
				<section class="pre-reservation-list">
					<div class="pre-reservation-header">
						<h4>1차 명단</h4>
						<button class="notify-all-btn">전체알림보내기</button>
					</div>
					<table>
						<tr>
							<th>순번</th>
							<th>이름</th>
							<th>ID</th>
							<th>인원수</th>
							<th>알림 보내기</th>
						</tr>
					</table>

				</section>

			</section>
		</div>



		<%-- <c:if test=""> --%>
		<section class="reservation-status">
			<div class="reservation-header">
				<h3>현장예약대기</h3>
				<button class="use-btn" onclick="onSiteUse(this)" data-use="able">사용하기</button>
				<button class="use-btn" onclick="onSiteUse(this)"  data-use="disable">사용중지</button>
			</div>
         
			<div class="warning-message">
				<p>현장예약대기 인원이 있다면 사용기능을 해제할 수 없습니다.</p>
			</div>
			<br>
			<div id ="OnSiteReservation">
			<div class="reservation-list">
				<select id="status-filter" onchange="filterReservations()">
					<option value="all">전체</option>
					<option value="현재순번">현재순번</option>
					<option value="대기">대기</option>
				</select>
				<p id="waiting-count">대기 2팀</p>
			</div>
			<table id="reservation-table">
				<tr>
					<th>순번</th>
					<th>이름</th>
					<th>ID</th>
					<th>인원수</th>
					<th>알림 보내기</th>
					<th>상태</th>
					<th>삭제하기</th>
				</tr>
				<tr data-status="current">
					<td>1</td>
					<td>김방글</td>
					<td>bange</td>
					<td>3명</td>
					<td><button class="notify-btn">알림보내기</button></td>
					<td>현재순번</td>
					<td><button class="delete-btn">삭제하기</button></td>
				</tr>
				<tr data-status="waiting">
					<td>2</td>
					<td>김싱글</td>
					<td>singe</td>
					<td>3명</td>
					<td><button class="notify-btn">알림보내기</button></td>
					<td>대기</td>
					<td><button class="delete-btn">삭제하기</button></td>
				</tr>

			</table>
			</div>
			
			
			<div class="overlay">
				<div class="notification">
					<div class="n-header">
						<h3>알림보내기</h3>
						<span class="close-btn">x</span>
					</div>
                    <div id='alert-index'>현재순번 알림보내기</div>
                     
					<button class="complete-btn" onclick="updateSend(this)">완료</button>
					<input type="hidden" id="alert-waiting-idx"/>
				</div>

				<div class="notification-delete">
					<div class="n-d-header">
						<h3>삭제사유</h3>
						<span class="close-delete-btn">x</span>
					</div>
					<select id="delete-select">
						<option>현장방문</option>
						<option>노쇼</option>
						<option value="예약취소">고객요청</option>
					</select>
					<button class="complete-delete-btn" onclick="deleteSend(this)">완료</button>
					<input type="hidden" id="delete-waiting-idx"/>
				</div>
			</div>

		</section>

		<div class="buttons-footer">
			<a href="/Mobile/Reservation/OnSite">예약 일정 수정하기</a> 
			<a id="infoUpdate" href="/Business/Operation/UpdateFormStore?store_idx=91">기본정보 수정하기</a>
		    <a href="/Mobile/Reservation/User/List">팝업 페이지 이동하기</a>
			<c:if test="">
				<button>예약 기능 사용하기</button>
				<button>기본정보 수정하기</button>
				<button>팝업 페이지 이동하기</button>
			</c:if>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer_company.jsp"%>

	<script>


	
   function onSiteList() {
		let store_idx  = document.querySelector('#reservation_storeIdx').value	
	
		console.log(store_idx);
		loadUserWaitingList(store_idx)	
		let msg = '대기기능사용'
						
		}
	
    function loadUserWaitingList(store_idx) {
        fetch(`/api/waiting/list?store_idx=\${store_idx}`)
            .then(response => response.json())
            .then(data => {
                updateWaitingList(data);
            });
    }
	
    function updateWaitingList(data){
    console.log('데이터값')	
    console.log(data)	
    const tableBody = document.querySelector('#reservation-table');	
   
    tableBody.innerHTML = `
        <tr>
			<th>순번</th>
			<th>이름</th>
			<th>ID</th>
			<th>인원수</th>
			<th>알림 보내기</th>
			<th>상태</th>
			<th>삭제하기</th>
        </tr>
    `;

    // 예시 데이터가 없을 경우 처리
    if (data.length === 0) {
        tableBody.innerHTML += `
            <tr>
                <td colspan="7" style="text-align:center;"> 대기인원이 없습니다.</td>
            </tr>
        `;
        return;
    }
        data.forEach((item, index) => {
        
            tableBody.innerHTML += `
                <tr data-status="\${item.status}">
					<td>\${item.wating_order}</td>
					<td>\${item.name}</td>
					<td>\${item.id}</td>
					<td>\${item.reservation_number}</td>
					<td><button onclick="alertModal(this)"  data-idx="\${item.waiting_idx}" class="notify-btn">알림보내기</button></td>
					<td>\${item.status}</td>
					<td><button onclick="deleteModal(this)" data-idx="\${item.waiting_idx}">삭제하기</button></td>
                </tr>
            `;
        });
      
        let watingCount = data.length;
        console.log(watingCount);
        $('#waiting-count').html('대기 ' + watingCount + '팀'); 
    	

    }
	     
    let isWaitingConfigCalled = false;

    function waitingconfig(wc) {
        if (isWaitingConfigCalled) return; // 중복 호출 방지
        isWaitingConfigCalled = true;

        console.log("wc 값 확인:", wc, "타입:", typeof wc);
        const conditionResult = wc && String(wc).trim() !== '0';

        console.log("조건 결과:", conditionResult);

        if (conditionResult) {
            console.log('onSiteList() 호출');
            onSiteList();
        } else {
            const tableBody = document.querySelector('#reservation-table');	           
            console.log(tableBody);
            tableBody.innerHTML = `
            <tbody>
                    <tr>
            			<th>순번</th>
            			<th>이름</th>
            			<th>ID</th>
            			<th>인원수</th>
            			<th>알림 보내기</th>
            			<th>상태</th>
            			<th>삭제하기</th>
                    </tr>
            </tbody>      
                `;
                
            tableBody.innerHTML += `
                <tr>
                    <td colspan="7" style="text-align:center;"> 대기인원이 없습니다.</td>
                </tr>
            `;   
        }

        isWaitingConfigCalled = false;
    }
    
    
    
    
    function deleteModal(element) {
        // data-idx 값을 가져오기
        const dataIdx = $(element).data('idx');

        // input hidden 요소 값 추가
        $('#delete-waiting-idx').val(dataIdx);
        $('.notification-delete').show(); 
        // overlay 보여주기	
        $('.overlay').show(); 
    }

    function alertModal(element){
        // data-idx 값을 가져오기
        const dataIdx = $(element).data('idx');
    	
        // input hidden 요소 값 추가
        $('#alert-waiting-idx').val(dataIdx); 	
    	
        $('.notification').show(); // 알림 보내기 팝업 보여주기
        $('.overlay').show(); // overlay 보여주기	
    }
    
    
    
    
    
    let stompClient = null;
	  const socket = new SockJS('/ws');  // 웹소켓 연결
	  stompClient = Stomp.over(socket);	 		
	  stompClient.connect({}, function(frame) {
	      console.log('Connected: ' + frame);

	      // 대기 리스트 실시간 업데이트
	 stompClient.subscribe("/topic/Waiting/90", function(message) {
	          
		   const waitingList = JSON.parse(message.body);
	          updateWaitingList(waitingList);
	      });

	  });
	  
	  
	    function deleteSend(button,select,idx){
	        const selectElement = $(button).prev('select')
	        const hiddenInput = $(button).next('input[type="hidden"]');
	        const selectedValue = selectElement.val(); 
	        const hiddenValue = hiddenInput.val(); 
	        const waitingDelete = {
	        		waiting_idx: hiddenValue, 
	        		status: selectedValue
	            };
	        
	        if (stompClient) {
	            stompClient.send("/app/Waiting/Delete", {}, JSON.stringify(waitingDelete));
	        } else {
	            console.error("WebSocket is not connected.");
	        }  
	        
	        
	        $('.notification-delete').hide(); // 삭제 팝업 숨기기
	        $('.overlay').hide(); // overlay 숨기기	
	    	
	    }  
	  
	    function updateSend(button){
	        const hiddenInput = $(button).next('input[type="hidden"]');
	        const selectedValue = '현재순번';
	        const hiddenValue = hiddenInput.val(); 
	        console.log(selectedValue)
	        const waitingSend = {
	        		waiting_idx: hiddenValue, 
	        		status: selectedValue
	            };
	        
	        if (stompClient) {
	            stompClient.send("/app/Waiting/Send", {}, JSON.stringify(waitingSend));
	        } else {
	            console.error("WebSocket is not connected.");
	        }  
	        
	        
	        $('.notification').hide(); // 알림 보내기 팝업 숨기기
	        $('.overlay').hide(); // overlay 숨기기
	    	
    }   

   function onSiteUse(element){
	let store_idx =  document.querySelector('#reservation_storeIdx').value
	  let ableStatus = element.getAttribute('data-use'); 
   	     const storeStatus = {
   	    		store_idx : store_idx,   
   	    		onsite_use: ableStatus  };
     if (stompClient) {
        stompClient.send("/app/Waiting/StoreStatus", {}, JSON.stringify(storeStatus));
     } else {
        console.error("WebSocket is not connected.");
     }  
   	
   	
   }
	    	    
	    
	    
	////////////////////////////////////////////////////////
	
	
    let currentIndex = 0; // 현재 슬라이드의 인덱스
    const carousel = document.querySelector('.carousel');
    const slides = Array.from(document.querySelectorAll('.carousel_store'));
    const totalSlides = slides.length;

    // 슬라이드 초기화 (초기 위치 설정)
    function initializeCarousel() {
      const offset = -currentIndex * 100; // 현재 슬라이드 기준으로 이동
      carousel.style.transform = `translateX(\${offset}%)`;
    }

    // 캐러셀 업데이트 함수
    function updateCarousel(direction) {
      if (direction === 'next') {
        currentIndex = (currentIndex + 1) % totalSlides; // 인덱스를 순환
      } else if (direction === 'prev') {
        currentIndex = (currentIndex - 1 + totalSlides) % totalSlides; // 인덱스를 순환
      }

      // 슬라이드 이동
      const offset = -currentIndex * 100; // 슬라이드의 % 단위 이동
      carousel.style.transform = `translateX(\${offset}%)`;
      updateInfo();
      updateButton();
      displayCurrentReservations(); 

    }
    
    
    function updateInfo() {
    	console.log('updateInfo() 발동')
    	  const currentSlide = slides[currentIndex];
    	  const reviewCount = currentSlide.getAttribute('data-review'); 
    	  const scoreAvg = currentSlide.getAttribute('data-avg'); 
    	  const viewCount = currentSlide.getAttribute('data-hit'); 
    	  const viewLike = currentSlide.getAttribute('data-like');
    	  const rsIdx = currentSlide.getAttribute('data-rsIdx');
    	  const  rstaus= currentSlide.getAttribute('data-rstaus');
    	  const link = currentSlide.getAttribute('data-link');
    	  const storeIdx = currentSlide.getAttribute('data-storeIdx'); 
    	  const wc = currentSlide.getAttribute('data-waitingCount'); 
    	  
    	  
    	  
    	  document.querySelector('._4').textContent = reviewCount; 
    	  document.querySelector('._30').textContent = viewCount; 
    	  document.querySelector('._200').textContent = viewLike; 
    	  document.querySelector('._4-5').textContent = scoreAvg; 
    	  document.querySelector('#reservation_rsIdx').value = rsIdx; 
    	  document.querySelector('#reservation_rstatus').value = rstaus; 
    	  document.querySelector('#reservation_link').value = link; 
    	  document.querySelector('#reservation_storeIdx').value = storeIdx; 
    	  document.querySelector('#reservation_wc').value = wc; 
    	  console.log('확인 합니다 ');
    	  console.log(wc);
    	  reservationDisplay(link,rstaus);
    	  waitingconfig(wc) 
    	  
    	}
    
    function updateButton(){
    	const currentSlide = slides[currentIndex];
    	let store_idx = currentSlide.getAttribute('data-storeIdx'); 
    	let infoUpdateLink = document.querySelector('#infoUpdate');

    	// href 속성 변경
    	infoUpdateLink.href = `/Business/Operation/UpdateFormStore?store_idx=\${store_idx}`;    	
    }
    
    
    // 버튼 이벤트
    document.querySelector('#icon_next').addEventListener('click', () => {
      updateCarousel('next');
    });

    document.querySelector('#icon_prev').addEventListener('click', () => {
      updateCarousel('prev');
    });

    // 초기화
    initializeCarousel();    
    console.log('초기화 루프');
    updateInfo();
    updateButton();
    
    function reservationDisplay(link, rstaus) {
        
    console.log('rstaus'+ rstaus);
    
       if(rstaus ==='현장대기예약'){
    	   document.querySelector('.real-time-updates').style.display = "block";
    	   document.querySelector('.reservation-status').style.display = "block";
    	   
       }else {
    	   document.querySelector('.real-time-updates').style.display = "none";	 	      	   
    	   document.querySelector('.reservation-status').style.display = "none";
       }    
    
    
    	if (rstaus ==='사전예약') { // null과 비교할 때는 === 사용
            document.querySelector('#advanceReservation').style.display = "block";
        
        }else{
        	document.querySelector('#advanceReservation').style.display = "none";
        	
        }
    	
    	
    } 
    
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
            month = 11;   // 12월
            year--;  // 연도 감소
        } else {
            month--;   // 이전 월
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
//현재 날짜의 예약 현황을 기본으로 표시
function displayCurrentReservations() {
    const today = new Date();
    const year = today.getFullYear();
    const month = today.getMonth();
    const day = today.getDate();

    // 선택된 날짜 객체 생성
    const selectedDate = new Date(year, month, day);
    updateReservationHeader(selectedDate);
    updateReservationList(year, month, day);
}
//예약 현황 헤더 업데이트
function updateReservationHeader(date) {
    const options = { year: 'numeric', month: '2-digit', day: '2-digit', weekday: 'long' };
    const formattedDate = date.toLocaleDateString('ko-KR', options);
    document.querySelector('.pre-reservations h4').textContent = "[" + formattedDate + " 예약 현황]";
}

function addDateSelection(currentYear, currentMonth) {
    const calendarDays = document.querySelectorAll('.dates .day.current');
    const reservationHeader = document.querySelector('.pre-reservations h4'); // <h4> 요소 선택

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
            
         // 예약 목록 업데이트
            updateReservationList(currentYear, currentMonth, dayNumber);
            displayUserList();
            
        });
    });
}

// 초기화
$(document).ready(function() {
    displayCurrentReservations(); // 기본 예약 현황 표시
});


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
/* 예약 현황 목록 */
// 예약 현황 목록 업데이트 함수
function updateReservationList(year, month, day) {
    // 예시 데이터
  
    let rs_idx = document.querySelector('#reservation_rsIdx').value;
    
    $.ajax({
        url: '/Reservation/Date',
        method: 'GET', // HTTP 메서드
        data: {
        	rs_idx:rs_idx,
            year: year, 
            month: month + 1, 
            day: day 
        },
        
        success: function(data) {
            displayReservations(data);
        },
        error: function(error) {
            // 요청이 실패했을 때 실행되는 콜백 함수
            console.error("예약 데이터를 가져오는 중 오류 발생:",error)
            alert('예약 데이터를 가져오는 데 실패했습니다. 다시 시도해 주세요.');
        }
    });
        
    

}
function displayReservations(data) {
    
    const tableBody = document.querySelector("#pre-reservation-table");

    // 기본 테이블 헤더 설정
    tableBody.innerHTML = `
        <tr>
            <th>순번</th>
            <th>시간</th>
            <th>인원수</th>
            <th>상세보기</th>
        </tr>
    `;

    // 예시 데이터가 없을 경우 처리
    if (data.length === 0) {
        tableBody.innerHTML += `
            <tr>
                <td colspan="4" style="text-align:center;">예약된 정보가 없습니다.</td>
            </tr>
        `;
        return;
    }

    // 데이터 순회하여 예약 테이블에 추가
    data.forEach((item, index) => {
        tableBody.innerHTML += `
            <tr>
                <td>\${item.time_slot}</td>
                <td>\${item.time_range}</td>
                <td>\${item.max_number}</td>
                <td><button class="view-reservation-btn" data-rdate="\${item.reservation_date}"  data-id="\${item.rp_idx}"
                >
                명단보기</button></td>
            </tr>
        `;
    });
    
    // 명단보기 버튼 클릭 이벤트
    document.querySelectorAll('.view-reservation-btn').forEach(button => {
        button.addEventListener('click', function() {
            let userrdate = this.getAttribute('data-rdate');
            let userrpIdx= this.getAttribute('data-id');

            showReservationList(userrdate,userrpIdx); // 예약 명단 보기
        });
    });	
	
	
	
	
}
function showReservationList(date,rp_idx) {
	let rsIdxUser = document.querySelector('#reservation_rsIdx').value;
    
    $.ajax({
        url: '/Reservation/UserView',
        method: 'GET', // HTTP 메서드
        data: {
        	rp_idx:rp_idx,
        	date: date, 
        	rs_idx:rsIdxUser
        },
        
        success: function(data) {
        	displayUserList(data);
        },
        error: function(error) {
            // 요청이 실패했을 때 실행되는 콜백 함수
            console.error("예약 데이터를 가져오는 중 오류 발생:",error)
            alert('예약 데이터를 가져오는 데 실패했습니다. 다시 시도해 주세요.');
        }
    });    
    

}

function displayUserList(data){

    const reservationSection = document.querySelector('.pre-reservation-list');
    const reservationTableBody = reservationSection.querySelector('table');
    console.log(data);
    // 예약 리스트 데이터 확인
    const reservationData = Array.isArray(data) ? data : [];

    // 예약 명단을 테이블에 업데이트
    reservationTableBody.innerHTML = `
        <tr>
            <th>순번</th>
            <th>이름</th>
            <th>ID</th>
            <th>인원수</th>
            <th>알림보내기</th>
        </tr>
    `;

    if (reservationData.length === 0) {
        reservationTableBody.innerHTML += `
            <tr>
                <td colspan="5" style="text-align:center;">명단이 없습니다.</td>
            </tr>
        `;
    } else {
    	const reservationlistHeader = document.querySelector('.pre-reservation-header h4');
        reservationData.forEach((item, index) => {
    	reservationlistHeader.textContent = `\${item.time_slot} 명단`;
            reservationTableBody.innerHTML += `
                <tr>
                    <td>\${index + 1}</td>
                    <td>\${item.name}</td>
                    <td>\${item.id}</td>
                    <td>\${item.reservation_number}명</td>
                    <td><button class="notify-btn">알림보내기</button></td>
                </tr>
            `;
        });
    }

    // 명단 섹션 보이기
    reservationSection.style.display = 'block';	
	
	
}






</script>
	<!-- 현장예약 -->
	<script type="text/javascript">
    function filterReservations() {
        const filterValue = document.getElementById("status-filter").value;
        const rows = document.querySelectorAll("#reservation-table tr[data-status]");

        rows.forEach(row => {
            const status = row.getAttribute("data-status");
            if (filterValue === "all" || status === filterValue) {
                row.style.display = ""; // 보이기
            } else {
                row.style.display = "none"; // 숨기기
            }
        });
    }
    /* 현장대기예약 상세 */
$(function() {
    // 팝업 버튼 클릭 이벤트

    $('.delete-btn').on('click', function() {
        $('.notification-delete').show(); // 삭제 팝업 보여주기
        $('.overlay').show(); // overlay 보여주기
    });

    // 팝업 닫기
    $('.close-btn').on('click', function() {
        $('.notification').hide(); // 알림 보내기 팝업 숨기기
        $('.overlay').hide(); // overlay 숨기기
    });
    
    $(' .close-delete-btn').on('click', function() {
        $('.notification-delete').hide(); // 삭제 팝업 숨기기
        $('.overlay').hide(); // overlay 숨기기
    });
    // Overlay 클릭 시 팝업 닫기
    $('.overlay').on('click', function() {
        $('.notification').hide(); // 알림 보내기 팝업 숨기기
        $('.notification-delete').hide(); // 삭제 팝업 숨기기
        $('.overlay').hide(); // overlay 숨기기
    });
    // 팝업 내부 클릭 시 이벤트 전파 차단
    $('.notification, .notification-delete').on('click', function(e) {
        e.stopPropagation(); // 이벤트 전파 차단
    });
})



    </script>

</body>
</html>