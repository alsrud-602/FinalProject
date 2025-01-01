<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop corn</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a9gjf918ri"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.6/lottie.min.js"></script>
<style>
    #map {
        width: 100%;
        height: 720px;
    }
    #gpsButton {
        position: absolute; /* 절대 위치 지정 */
        top: 87%; /* 수직 중앙 */
        left: 96%; /* 수평 중앙 */
        z-index: 1000;
        cursor: pointer;
    }
    .gps{
            height: 62px;
        width: 62px;

    }

</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<main>
    <div id="map">    <div id="gpsButton"><img src="/images/icon/Gps_duotone_line.svg" class="gps"></div></div>

</main>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 기본 위치
        var defaultCoords = new naver.maps.LatLng(37.5665, 126.9780); //기본위치: 서울
        var map = new naver.maps.Map('map', {
            center: defaultCoords,
            zoom: 10
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
                        url: '/images/icon/Map-07-512.webp',
                        scaledSize: new naver.maps.Size(50, 50)
                    },
                    title: '내 위치'
                });
               
                
             // Lottie 애니메이션 로드
                lottie.loadAnimation({
                    container: document.getElementById('lottie'), // 애니메이션을 표시할 div
                    renderer: 'svg', // 렌더러 타입
                    loop: true, // 반복 여부
                    autoplay: true, // 자동 재생 여부
                    path: '/json/Animation - 1735684255412.json' // Lottie JSON 파일 경로
                });

                // 서버에서 주변 위치 데이터 가져오기
/*                fetch('/Users/Map/popuplist')
                    .then(response => response.json())
                    .then(data => {*/


                    	// 서버에서 주변 위치 데이터 가져오기 (임시 데이터 사용)
                    	const data = [
                    	    { address: '부산 서면역 1번출구', title: '서면역' },
                    	    { address: '부산 사하구 하단동', title: '하단역' },
                    	    { address: '부산 해운대역 1번출구', title: '해운대역' },
                    	    { address: '부산 사상역 1번출구', title: '사상역' },
                    	    { address: '부산 동래역 1번출구', title: '동래역' }
                    	];
                    const markers = []; // 마커를 저장할 배열

                    // 모든 fetch 요청을 Promise.all로 처리
                    const fetchPromises = data.map(item => {
                        var address = item.address;
                        var title = item.title;
                        var encodedAddress = encodeURIComponent(address);
                        var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodedAddress;

                        return fetch(url)
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
                                                url: '/images/icon/location_on.svg',
                                                scaledSize: new naver.maps.Size(35, 35)
                                            },
                                            title: title // 팝업 제목을 마커 제목으로 설정,
                                        });
                                        markers.push(marker); // 마커를 배열에 추가
                                        


                                        // 라벨 위치 설정
                                        var labelPosition = new naver.maps.LatLng(lat, lon); // 라벨 위치 조정
                                        
                                        // 제목을 항상 표시할 위치 설정
                                        var titleMarker = new naver.maps.Marker({
                                            position: labelPosition,
                                            map: map,
                                            icon: {
                                            	content: [
                                            	    '<div style="background-color: rgb(143, 255, 68, 0.8);; color: #000000; padding: 5px; border-radius: 8px; font-size: 14px; display: flex; align-items: center;">',
                                            	    title+'</div>'
                                            	].join(''),
                                            size: new naver.maps.Size(38, 58)
                                            }
                                            
                                         });
                                     	// 제목 마커도 지도에 추가
                                        markers.push(titleMarker); // 제목 마커도 배열에 추가


                                        /*var labelMapType = new naver.maps.NaverStyleMapTypeOptions.getNormalLabelLayer();
                                        var labelMapTypeRegistry = new naver.maps.MapTypeRegistry({
                                            'label': labelMapType
                                        });
                                        var labelLayer = new naver.maps.Layer('label', labelMapTypeRegistry);
                                        labelLayer.setMap(map);
                                        */
                                    } else {
                                        console.error('주소를 찾을 수 없습니다:', address);
                                    }
                                });
                    });
                 // 모든 마커가 추가된 후 실행
                    Promise.all(fetchPromises)
                        .then(() => {
                            // 배열에 있는 모든 마커를 지도에 추가
                            markers.forEach(marker => {
                                marker.setMap(map);
                            });
                            console.log('모든 마커가 추가되었습니다.');
                        })
                        .catch(error => console.error('Error:', error));
                    
/*                    })
                    .catch(error => console.error('Error:', error));
                */

            }, function() {
                alert('위치 정보를 가져올 수 없습니다.');
                map.setCenter(defaultCoords);
            },
            { enableHighAccuracy: true } // 높은 정확도 요청
            );
        } else {
            alert('이 브라우저에서는 위치 정보를 지원하지 않습니다.');
            map.setCenter(defaultCoords);
        }
        


        // GPS 버튼 클릭 시 현재 위치로 이동
        document.getElementById('gpsButton').onclick = function() {
            if (navigator.geolocation) {
            	// 기존 마커가 있으면 지도에서 제거
                if (userMarker) {
                    userMarker.setMap(null); // 마커 제거
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
                            url: '/images/icon/Map-07-512.webp', // 사용자 위치 마커 아이콘 URL
                            scaledSize: new naver.maps.Size(50, 50) // 아이콘 크기 조정
                        },
                        title: '내 위치',
                        animation: naver.maps.Animation.BOUNCE
                    });
                 // 두 번째 마커
                    var lottieMarker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(userLat+1, userLon+1),
                        map: map,
                        icon: {
                        	content:[
                                '<div id="lottie" style="width: 100px; height: 100px;"></div>'
                            ].join(),
                            size: new naver.maps.Size(38, 58)
                        }
                    });
                    
                 // Lottie 애니메이션 로드
                    lottie.loadAnimation({
                        container: document.getElementById('lottie'), // 애니메이션을 표시할 div
                        renderer: 'svg', // 렌더러 타입
                        loop: true, // 반복 여부
                        autoplay: true, // 자동 재생 여부
                        path: '/json/Animation - 1735684255412.json' // Lottie JSON 파일 경로
                    });
                }, function() {
                    alert('위치 정보를 가져올 수 없습니다.');
                },
                { enableHighAccuracy: true }
                );
            } else {
                alert('이 브라우저에서는 위치 정보를 지원하지 않습니다.');
            }
        };
    });
</script>
</body>
</html>
