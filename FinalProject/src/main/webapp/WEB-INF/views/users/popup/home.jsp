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
    <input type="text" id="address" placeholder="주소 입력">
    <button onclick="geocodeAddress()">주소 검색</button>

    <div id="result"></div>


  </main>	
 <%@include file="/WEB-INF/include/footer.jsp" %>
 <script>

 // 네이버 지도 API가 로드된 후 실행되는 코드
    document.addEventListener("DOMContentLoaded", function() {
        // 네이버 지도 API가 로드되었는지 확인
     
            var map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.553216, 127.033440), // 기본 위치 (서울 성동구)
                zoom: 15
            });
            



            // 주소로 좌표 변환
    	var adddd ='서울특별시 성동구 아차산로 3';
        var address = document.getElementById('address').value;
        var add = encodeURIComponent(adddd);
        console.log(add);

        var url = 'https://nominatim.openstreetmap.org/search?format=json&q='+add;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                if (data && data.length > 0) {
                    var lat = data[0].lat;
                    var lon = data[0].lon;
                    document.getElementById('result').innerHTML = '위도: ' + lat + ', 경도: ' + lon;
                    
                    var coords = new naver.maps.LatLng(lat, lon);

                    // 마커 표시
                    var marker = new naver.maps.Marker({
                        position: coords,
                        map: map
                    });

                    // 지도 중심을 마커 위치로 이동
                    map.setCenter(coords);
                    map.setZoom(14);
                    
                    
                    
                } else {
                    alert('주소를 찾을 수 없습니다.');
                }
            })
            .catch(error => console.error('Error:', error));
        
        

      
    });

    </script>
</body>
</html>
