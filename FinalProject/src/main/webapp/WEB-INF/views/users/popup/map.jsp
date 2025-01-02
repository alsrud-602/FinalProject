<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.6/lottie.min.js"></script>
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>

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

#popup-container {
    display: none; /* 기본적으로 숨김 */
    top: 20%;
    left: 50%;
    transform: translate(-50%, -150%);
    z-index: 2000;

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
							<span> <span class="_100-span">100명</span> <span
								class="_100-span2">이 봤어요</span>
							</span>
						</div>
						<img class="eye" src="/images/map/Eye.svg" />
					</div>
					<div class="popup-period">2024.12.12 - 2025.01.08</div>
					<img class="calendar" src="/images/map/Calendar.svg" /> <img
						class="image-9" src="" alt="상세정보사진" />
					<div class="ootd-of">OOTD of 침착맨 카드 교환소</div>
				</div>
				<div class="frame-490">
					<div class="_22">
						<span> <span class="_22-span">종료까지</span> <span
							class="_22-span2">22일</span> <span class="_22-span3">남았어요!</span>
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
						    <div class="carousel-item">재고 얼마나 남았나요?</div>
						    <div class="carousel-item">사람 겁나 많네요 ;;</div>
						    <div class="carousel-item">오늘은 날씨가 좋네요!</div>
						    <div class="carousel-item">기분이 너무 좋습니다!</div>
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
	        zoom: 13
	    });

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

	            // Lottie 애니메이션 로드
	            lottie.loadAnimation({
	                container: document.getElementById('lottie'),
	                renderer: 'svg',
	                loop: true,
	                autoplay: true,
	                path: '/json/Animation - 1735684255412.json'
	            });

	            // 서버에서 주변 위치 데이터 가져오기 (임시 데이터 사용)
	            const data = [
	                { address: '부산 서면역 1번출구', title: '서면역' },
	                { address: '부산 사하구 하단동', title: '하단역' },
	                { address: '부산 해운대역 1번출구', title: '해운대역' },
	                { address: '부산 사상역 1번출구', title: '사상역' },
	                { address: '부산 동래역 1번출구', title: '동래역' }
	            ];

	            data.forEach(function(item) {
	                var address = item.address;
	                var title = item.title;
	                var encodedAddress = encodeURIComponent(address);
	                var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodedAddress;

	                fetch(url)
	                    .then(response => response.json())
	                    .then(locationData => {
	                        if (locationData && locationData.length > 0) {
	                            var lat = locationData[0].lat;
	                            var lon = locationData[0].lon;
	                            var coords = new naver.maps.LatLng(lat, lon);

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

	                            // 마커 클릭 이벤트 추가
	                            naver.maps.Event.addListener(marker, 'click', function() {
	                                document.getElementById('popup-container').style.display = 'block';
	                            });

	                            // 팝업 닫기 버튼 클릭 이벤트
	                            document.getElementById('closePopup').onclick = function() {
	                                document.getElementById('popup-container').style.display = 'none';
	                            };

	                            // 라벨 위치 설정
	                            var labelPosition = new naver.maps.LatLng(lat, lon);

	                            // 제목을 항상 표시할 위치 설정
	                            var titleMarker = new naver.maps.Marker({
	                                position: labelPosition,
	                                map: map,
	                                icon: {
	                                    content: [
	                                        '<div style="background-color: rgba(143, 255, 68, 0.8); color: #000000; padding: 5px; border-radius: 8px; font-size: 14px; display: flex; align-items: center;">',
	                                        title + '</div>'
	                                    ].join(''),
	                                    size: new naver.maps.Size(38, 58)
	                                }
	                            });

	                            // 마커 클릭 이벤트 추가
	                            naver.maps.Event.addListener(titleMarker, 'click', function() {
	                                document.getElementById('popup-container').style.display = 'block';
	                            });

	                            // 팝업 닫기 버튼 클릭 이벤트
	                            document.getElementById('closePopup').onclick = function() {
	                                document.getElementById('popup-container').style.display = 'none';
	                            };
	                        } else {
	                            console.error('주소를 찾을 수 없습니다:', address);
	                        }
	                    })
	                    .catch(error => console.error('Error:', error));
	            });
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

	                // 두 번째 마커
	                var lottieMarker = new naver.maps.Marker({
	                    position: new naver.maps.LatLng(userLat + 1, userLon + 1),
	                    map: map,
	                    icon: {
	                        content: [
	                            '<div id="lottie" style="width: 100px; height: 100px;"></div>'
	                        ].join(''),
	                        size: new naver.maps.Size(38, 58)
	                    }
	                });

	                // Lottie 애니메이션 로드
	                lottie.loadAnimation({
	                    container: document.getElementById('lottie'),
	                    renderer: 'svg',
	                    loop: true,
	                    autoplay: true,
	                    path: '/json/Animation - 1735684255412.json'
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
</body>
</html>
