<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a9gjf918ri"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
<style>
      #map { width: 1200px; height: 600px; }
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
  <main>
    <div id="map"></div>



  </main>	
 <%@include file="/WEB-INF/include/footer.jsp" %>
 <script>

 // 네이버 지도 API가 로드된 후 실행되는 코드
    document.addEventListener("DOMContentLoaded", function() {
        // 네이버 지도 API가 로드되었는지 확인
        if (typeof naver !== 'undefined' && naver.maps) {
            var map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.553216, 127.033440), // 기본 위치 (서울 성동구)
                zoom: 15
            });
            

            console.log(naver.maps.services); // 서비스 확인
            var geocoder = new naver.maps.services.Geocoder();

            // 주소로 좌표 변환
            geocoder.addressSearch('서울특별시 성동구 연무장길 20-1', function(result, status) {
                if (status === naver.maps.services.Status.OK) {
                    var coords = new naver.maps.LatLng(result[0].y, result[0].x);

                    // 마커 표시
                    var marker = new naver.maps.Marker({
                        position: coords,
                        map: map
                    });

                    // 지도 중심을 마커 위치로 이동
                    map.setCenter(coords);
                } else {
                    console.error('주소 검색 실패');
                }
            });
        } else {
            console.error('네이버 지도 API가 로드되지 않았습니다.');
        }
    });
    </script>
</body>
</html>
