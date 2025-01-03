<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop corn</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/preview-popup.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a9gjf918ri"></script>
	<script type="text/javascript" src="/js/MarkerClustering.js"></script>
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f8eb7767b91a40fb405d5545b39a4d&libraries=services"></script>
<style>
main{
margin-bottom: 100px;
}
#map {
	width: 100%;
	height: 800px;
}

#gpsButton {
	position: absolute; /* 절대 위치 지정 */
	top: 87%; /* 수직 중앙 */
	left: 96%; /* 수평 중앙 */
	z-index: 1000;
	cursor: pointer;
}

.gps {
	height: 62px;
	width: 62px;
}

/* 팝업 기본 스타일 */
#popup-container {
    display: none; /* 기본적으로 숨김 */
    top: 20%;
    left: 50%;
    transform: translate(-50%, -150%);
    z-index: 2000;

}

/* 반응형 디자인 */
@media (max-width: 768px) {
    #popup-container {
        width: 80%; /* 모바일 화면에서 너비를 더 넓게 */
        transform: translate(-50%, -110%); /* 마커 위 여백 추가 */
    }
}

@media (max-width: 480px) {
    #popup-container {
        width: 90%; /* 작은 모바일 화면에서 너비 확장 */
        font-size: 14px; /* 글자 크기 조정 */
        transform: translate(-50%, -120%); /* 팝업 위치 조정 */
    }
}


    .rectangle-331 {
        position: relative;
        height: auto; /* 슬라이드 높이 */
        overflow: hidden;
        left:20px;
    }

    .carousel2 {
        position: absolute;
        width: 100%;
        top: 10px; /* 슬라이드 시작 위치 */
    }

    .carousel-item {
        position: absolute;
        width: 100%;
        opacity: 0; /* 초기 불투명도 설정 */
        transform: translateY(100%); /* 초기 위치를 위로 설정 */
        transition: opacity 1s ease, transform 1s ease; /* 불투명도와 슬라이드 애니메이션 */
    }
    .carousel-item.active {
        opacity: 1; /* 활성화된 아이템은 보이도록 설정 */
        transform: translateY(0); /* 활성화된 아이템은 원래 위치로 이동 */
    }
    .carousel-item.out {
        opacity: 0; /* 사라질 때 불투명도 설정 */
        transform: translateY(100%); /* 아래로 이동 */
    }
    .line-5 {
        width: 100%;
        height: 1px; /* 선의 두께 */
        background-color: #747474; /* 선의 색상 */
        position: relative;
        z-index: 2500; /* 선이 다른 요소 위에 보이도록 설정 */
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    }



</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main>
		<div id="map">
			<div id="gpsButton">
				<img src="/images/map/Gps_duotone_line.svg" class="gps">
			</div>
		</div>
		<div id="popup-container">
			<img src="/images/map/Group 1000000859.svg" alt="팝업 배경">
			<div class="group-480">
				<div class="popover-pad">
					<div class="popupbackground">
						<div class="popupmaterial">
							<div class="poppupthick"></div>
						</div>
					</div>
				</div>
				<div class="group-486">
					<div class="group-488">
						<div class="_100">
							<span> 
								<span class="_100-span"></span> 
								<span class="_100-span2">이 봤어요</span>
							</span>
						</div>
						<img class="eye" src="/images/map/Eye.svg" />
					</div>
							<div class="popup-period"></div>
					<img class="calendar" src="/images/map/Calendar.svg" /> 
					<%-- <img class="image-9" src="/image/read?path=${popup.image_path}" alt="상세정보사진" /> --%>
					<div class="ootd-of"></div>
				</div>
				<div class="frame-490">
					<div class="_22">
						<span> <span class="_22-span">종료까지</span> 
							<span class="_22-span2"></span>
						<span class="_22-span3">남았어요!</span>
						</span>
					</div>
					<div class="line-4"></div>
					<a href=#>
						<div class="frame-491">
							<div class="popupsee">팝업 보러 가기</div>
							<img class="arrow-up-square-contained"
								src="/images/map/Arrow Up Square Contained.svg" />
						</div>
					</a>
                    <div class="rectangle-331">
						<div class="carousel2">
							<c:forEach items="${content}" var="reviewContent">
							    <div class="carousel-item">${reviewContent}</div>
							    <div class="carousel-item">${reviewContent}</div>
							    <div class="carousel-item">${reviewContent}</div>
							    <div class="carousel-item">${reviewContent}</div>
							</c:forEach>
						</div>
                        <div class="line-5"></div>
                    </div>
				</div>
				<img id="closePopup" src="/images/map/close.svg" />
			</div>
		</div>
	</main>
	<!-- jQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Slick JS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

	
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const items = document.querySelectorAll('.carousel-item');
        let currentIndex = 0;

        function showNextItem() {
            items[currentIndex].classList.remove('active'); // 현재 아이템 숨김
            items[currentIndex].classList.add('out'); // 현재 아이템 아래로 사라지게 설정

            currentIndex = (currentIndex + 1) % items.length; // 다음 아이템 인덱스 계산
            
            items[currentIndex].classList.remove('out'); // 다음 아이템에서 'out' 클래스 제거
            items[currentIndex].classList.add('active'); // 다음 아이템 보임
            
            
        }

        // 첫 번째 아이템 활성화
        items[currentIndex].classList.add('active');
        setInterval(showNextItem, 3000); // 3초마다 다음 아이템으로 전환
    });
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    // 기본 위치
	    var defaultCoords = new naver.maps.LatLng(37.5665, 126.9780); //기본위치: 서울
	    var map = new naver.maps.Map('map', {
	        center: defaultCoords,
	        zoom: 13,
	        zoomControl: true,
	        zoomControlOptions: {
	            position: naver.maps.Position.TOP_LEFT,
	            style: naver.maps.ZoomControlStyle.SMALL
	        }
	    });
	    var markers=[];
	    
	    var htmlMarker1 = {
	            content: '<div style="cursor:pointer;width:50px;height:50px;line-height:52px;font-size:15px;color:white;text-align:center;font-weight:bold;background:url(\'https://raw.githubusercontent.com/navermaps/marker-tools.js/refs/heads/master/marker-clustering/images/cluster-marker-1.png\');background-size:contain;"></div>',
	            size: N.Size(40, 40),
	            anchor: N.Point(20, 20)
	        },
	        htmlMarker2 = {
	            content: '<div style="cursor:pointer;width:50px;height:50px;line-height:52px;font-size:15px;color:white;text-align:center;font-weight:bold;background:url(\'https://raw.githubusercontent.com/navermaps/marker-tools.js/refs/heads/master/marker-clustering/images/cluster-marker-2.png\');background-size:contain;"></div>',
	            size: N.Size(40, 40),
	            anchor: N.Point(20, 20)
	        },
	        htmlMarker3 = {
	            content: '<div style="cursor:pointer;width:50px;height:50px;line-height:52px;font-size:15px;color:white;text-align:center;font-weight:bold;background:url(\'https://raw.githubusercontent.com/navermaps/marker-tools.js/refs/heads/master/marker-clustering/images/cluster-marker-3.png\');background-size:contain;"></div>',
	            size: N.Size(40, 40),
	            anchor: N.Point(20, 20)
	        },
	        htmlMarker4 = {
	            content: '<div style="cursor:pointer;width:50px;height:50px;line-height:52px;font-size:15px;color:white;text-align:center;font-weight:bold;background:url(\'https://raw.githubusercontent.com/navermaps/marker-tools.js/refs/heads/master/marker-clustering/images/cluster-marker-4.png\');background-size:contain;"></div>',
	            size: N.Size(40, 40),
	            anchor: N.Point(20, 20)
	        },
	        htmlMarker5 = {
	            content: '<div style="cursor:pointer;width:50px;height:50px;line-height:52px;font-size:15px;color:white;text-align:center;font-weight:bold;background:url(\'https://raw.githubusercontent.com/navermaps/marker-tools.js/refs/heads/master/marker-clustering/images/cluster-marker-5.png\');background-size:contain;"></div>',
	            size: N.Size(40, 40),
	            anchor: N.Point(20, 20)
	        };

	    // 전역 변수로 userMarker 선언
	    var userMarker = null;

	    // 현재 위치 가져오기
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(function(position) {
	            var userLat = position.coords.latitude;
	            var userLon = position.coords.longitude;
	            var userCoords = new naver.maps.LatLng(userLat, userLon);

	            // 사용자의 현재 위치로 지도 중심 이동
	            map.setCenter(userCoords);

	            // 현재 위치에 마커 표시
	            userMarker = new naver.maps.Marker({
	                position: userCoords,
	                map: map,
	                icon: {
	                    url: '/images/map/Map-07-512.webp',
	                    scaledSize: new naver.maps.Size(50, 50)
	                },
	                title: '내 위치'
	            });



	            // 팝업 리스트 데이터 가져오기
	            fetch('/Users/Map/popuplist')
	                .then(response => response.json())
	                .then(data => {
	                    data.forEach(location => {
	                        const { title, latitude, longitude, hit, start_date, end_date, igdate} = location;
	                        /*const { title, latitude, longitude, hit, start_date, end_date, igdate, image_path, reivewcontent} = location;*/
	                        console.log(`Title: \${title}, Lat: \${latitude}, Lng: \${longitude}, 기간:\${start_date}, 종료기간:\${end_date}, 기간2:\${igdate}, 조회수:\${hit}`);

	                        var coords = new naver.maps.LatLng(latitude, longitude);

	                            // 주변 위치 마커 표시
	                            var marker = new naver.maps.Marker({
	                                position: coords,
	                                map: map,
	                                icon: {
	                                    url: '/images/map/location_on.svg',
	                                    scaledSize: new naver.maps.Size(35, 35)
	                                },
	                                title: title
	                            });

	                         // 마커 객체에 관련 데이터를 추가
	                            marker.set("popupData", {
	                                title: title,
	                                hit: hit,
	                                start_date: start_date,
	                                end_date: end_date,
	                                igdate: igdate
	                            });
	                         
	                            markers.push(marker);
	                            
	                            // 마커 클릭 이벤트 추가
	                            naver.maps.Event.addListener(marker, 'click', function() {

	                                // 클릭한 마커의 데이터 가져오기
	                                var popupData = marker.get("popupData");
	                                
	                                var popupContainer = document.getElementById("popup-container");
	                                

	                                var startDate = null;
	                                var endDate =null;
	                                var igdateDisplay = null;

	                                // igdate가 있는 경우
	                                if (popupData.start_date === null && popupData.end_date === null) {
	                                    if (popupData.igdate.includes('~')) {
	                                        [startDate, endDate] = popupData.igdate.split(' ~ ');
	                                        igdateDisplay = `\${startDate} - \${endDate}`;
	                                    } else if (popupData.igdate.includes('-')) {
	                                        [startDate, endDate] = popupData.igdate.split(' - ');
	                                        igdateDisplay = `\${startDate} - \${endDate}`;
	                                    } else {
	                                        igdateDisplay = popupData.igdate;
	                                    }
	                                } else {
	                                    igdateDisplay = `\${popupData.start_date} - \${popupData.end_date}`;
	                                }
	                                // 팝업 컨테이너에 데이터 삽입
	                                document.querySelector("#popup-container .ootd-of").innerText = popupData.title;
	                                document.querySelector("#popup-container .popup-period").innerText = igdateDisplay;
	                                document.querySelector("#popup-container ._100-span").innerText = `\${popupData.hit}명`;

	                             // 현재 날짜를 가져오는 부분
	                                const currentDate = new Date();
	                                const formattedCurrentDate = currentDate.toISOString().split('T')[0]; // yyyy-mm-dd 형식으로 변환

	                             // 종료까지 남은 날짜 계산
	                                let remainingDays;
	                                const endDateObj = new Date(endDate); // endDate를 Date 객체로 변환
	                                const currentDateObj = new Date(); // 현재 날짜를 Date 객체로 생성
	                                if (popupData.start_date === null || popupData.end_date === null) {
	                                    if (endDate) {
	                                        const daysRemaining = Math.ceil((endDateObj - currentDateObj) / (1000 * 60 * 60 * 24)); // 남은 날짜 계산
	                                        remainingDays = `\${daysRemaining}일`;
	                                    } else {
	                                        remainingDays = ""; // endDate가 없을 경우 빈 문자열
	                                    }
	                                } else {
	                                    const endDateObj = new Date(popupData.end_date); // end_date를 Date 객체로 변환
	                                    const daysRemaining = Math.ceil((endDateObj - currentDateObj) / (1000 * 60 * 60 * 24)); // 남은 날짜 계산
	                                    remainingDays = `\${daysRemaining}일`;
	                                }

	                                document.querySelector("#popup-container ._22-span2").innerText = remainingDays;
	                                
	                                document.getElementById('popup-container').style.display = 'block';
	                            });

	                            // 팝업 닫기 버튼 클릭 이벤트
	                            document.getElementById('closePopup').onclick = function() {
	                                document.getElementById('popup-container').style.display = 'none';
	                            };

	                            // 제목을 항상 표시할 위치 설정
	                            var titleMarker = new naver.maps.Marker({
	                                position: coords,
	                                map: map,
	                                icon: {
	                                    content: [
	                                        '<div style="background-color: rgba(143, 255, 68, 0.8); color: #000000; padding: 5px; border-radius: 8px; font-size: 14px; display: flex; align-items: center;">',
	                                        title + '</div>'
	                                    ].join(''),
	                                    size: new naver.maps.Size(38, 58)
	                                }
	                            });
	                            
	                            //마커 객체에 관련 데이터를 추가
	                            titleMarker.set("popupData", {
	                                title: title,
	                                hit: hit,
	                                start_date: start_date,
	                                end_date: end_date,
	                                igdate: igdate
	                            });
	                            
	                            markers.push(titleMarker);
	                            
	                            
	                            
	                            var markerClustering = new MarkerClustering({
	                                minClusterSize: 2,
	                                maxZoom: 13,
	                                map: map,
	                                markers: markers, // markers 배열을 그대로 사용
	                                disableClickZoom: false,
	                                gridSize: 120,
	                                icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
	                                indexGenerator: [10, 100, 200, 500, 1000],
	                                stylingFunction: function(clusterMarker, count) {
	                                    const displayedCount = Math.floor(count / 2); // 클러스터 수를 2로 나눔
	                                    $(clusterMarker.getElement()).find('div:first-child').text(displayedCount); // 클러스터 수를 표시
	                                }
	                            });
	                    	    
	                    	    
	                    	   

	                            // 마커 클릭 이벤트 추가
	                            naver.maps.Event.addListener(titleMarker, 'click', function() {

	                                // 클릭한 마커의 데이터 가져오기
	                                var popupData = marker.get("popupData");
	                                
	                                var popupContainer = document.getElementById("popup-container");
	                                

	                                var startDate = null;
	                                var endDate =null;
	                                var igdateDisplay = null;

	                                // igdate가 있는 경우
	                                if (popupData.start_date === null || popupData.end_date === null) {
	                                    if (popupData.igdate.includes('~')) {
	                                        [startDate, endDate] = popupData.igdate.split(' ~ ');
	                                        igdateDisplay = `\${startDate} - \${endDate}`;
	                                    } else if (popupData.igdate.includes('-')) {
	                                        [startDate, endDate] = popupData.igdate.split(' - ');
	                                        igdateDisplay = `\${startDate} - \${endDate}`;
	                                    } else {
	                                        igdateDisplay = popupData.igdate;
	                                    }
	                                } else {
	                                    igdateDisplay = `\${popupData.start_date} - \${popupData.end_date}`;
	                                }
	                                // 팝업 컨테이너에 데이터 삽입
	                                document.querySelector("#popup-container .ootd-of").innerText = popupData.title;
	                                document.querySelector("#popup-container .popup-period").innerText = igdateDisplay;
	                                document.querySelector("#popup-container ._100-span").innerText = `\${popupData.hit}명`;

	                             // 현재 날짜를 가져오는 부분
	                                const currentDate = new Date();
	                                const formattedCurrentDate = currentDate.toISOString().split('T')[0]; // yyyy-mm-dd 형식으로 변환

	                             // 종료까지 남은 날짜 계산
	                                let remainingDays;
	                                const endDateObj = new Date(endDate); // endDate를 Date 객체로 변환
	                                const currentDateObj = new Date(); // 현재 날짜를 Date 객체로 생성
	                                if (popupData.start_date === null || popupData.end_date === null) {
	                                    if (endDate) {
	                                        const daysRemaining = Math.ceil((endDateObj - currentDateObj) / (1000 * 60 * 60 * 24)); // 남은 날짜 계산
	                                        remainingDays = `\${daysRemaining}일`;
	                                    } else {
	                                        remainingDays = ""; // endDate가 없을 경우 빈 문자열
	                                    }
	                                } else {
	                                    const endDateObj = new Date(popupData.end_date); // end_date를 Date 객체로 변환
	                                    const daysRemaining = Math.ceil((endDateObj - currentDateObj) / (1000 * 60 * 60 * 24)); // 남은 날짜 계산
	                                    remainingDays = `\${daysRemaining}일`;
	                                }

	                                document.querySelector("#popup-container ._22-span2").innerText = remainingDays;

	                                document.getElementById('popup-container').style.display = 'block';
	                            });

	                        });
	                    })
	                    .catch(error => console.error('Error:', error));
	        }, function() {
	            alert('위치 정보를 가져올 수 없습니다.');
	            map.setCenter(defaultCoords);
	        }, {
	            enableHighAccuracy: true
	        });
	    } else {
	        alert('이 브라우저에서는 위치 정보를 지원하지 않습니다.');
	        map.setCenter(defaultCoords);
	    }

	    // GPS 버튼 클릭 시 현재 위치로 이동
	    document.getElementById('gpsButton').onclick = function() {
	        if (navigator.geolocation) {
	            // 기존 마커가 있으면 지도에서 제거
	            if (userMarker) {
	                userMarker.setMap(null);
	            }

	            navigator.geolocation.getCurrentPosition(function(position) {
	                var userLat = position.coords.latitude;
	                var userLon = position.coords.longitude;
	                var userCoords = new naver.maps.LatLng(userLat, userLon);

	                // 현재 위치로 지도 이동
	                map.setCenter(userCoords);

	                // 현재 위치에 마커 표시 (특별한 아이콘 사용)
	                userMarker = new naver.maps.Marker({
	                    position: userCoords,
	                    map: map,
	                    icon: {
	                        url: '/images/map/Map-07-512.webp',
	                        scaledSize: new naver.maps.Size(50, 50)
	                    },
	                    title: '내 위치',
	                    animation: naver.maps.Animation.BOUNCE
	                });


	            }, function() {
	                alert('위치 정보를 가져올 수 없습니다.');
	            }, {
	                enableHighAccuracy: true
	            });
	        } else {
	            alert('이 브라우저에서는 위치 정보를 지원하지 않습니다.');
	        }
	    };
	});
	</script>
	<%@include file="/WEB-INF/include/header.jsp"%>
</body>
</html>
