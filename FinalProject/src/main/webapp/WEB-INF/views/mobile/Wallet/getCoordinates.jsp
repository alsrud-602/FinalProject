<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?govClientId=&submodules=geocoder"></script>
     
    <title>주소 위치 정보</title>
     <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Pretendard", sans-serif;
        }

        li {
            list-style: none;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        body {
            padding-top: 144px;
            background-color: #121212;
            color: #fff;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: auto;
            text-align: left;
            padding-bottom: 100px; /* 네비게이션 바의 높이만큼 여백 추가 */
    		overflow-y: auto; 
        }
        
		.content-text{       
			text-align:center;
			margin-bottom: 20px;
		}
		
		.contentTitle-text{       
			text-align:center;
			margin-bottom: 40px;
			color: #00FF84;
		}
	
	.button-group{
	text-align: center;
	
	}

        /* 필터 버튼 */
        .filter-select {
            width: 120px;
            height: 50px;
            border: 2px solid #00FF84;
            border-radius: 5px;
            color: white;
            background-color: #121212;
            text-align: center;
            margin-right: 10px; 
        }





        /* 검색하기 버튼 */
        .search-btn {
            background-color: #00FF84;
            border: none;
            color: #000;
            width: 200px;
            height: 50px;
            font-weight: 700;
            font-family: 'Pretendard', sans-serif;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }


        button:hover {
            background-color: #33ff33;
        }



        .store-name {
            display: flex;
   			justify-content:flex-start;
            padding: 10px;
            margin: 10px 0; 
            border: 2px solid #00FF84;
            border-radius: 5px;
            background-color: #121212;
            color: white;
            position: relative; 
        }

        .remove-btn {
             position: absolute;
              right: 10px;
            cursor: pointer;
            color: red;
            margin-right:5px;
            font-size: 16px;
        }

        /* 네모칸과 버튼을 수평으로 정렬하기 위한 스타일 */
        .flex-container {
            display: flex;
            align-items: center;
            margin-top: 20px; /
        }

        .store-list {
            flex-grow: 1; 
        }
        
        /* 기본 네모칸(이해 못할까봐)*/
         .default-store-name {
            display:block;
            width: 30px;
            padding: 5px;
            margin: 10px 45%; 
            border-radius: 50%;
            border: 2px solid white;
            background-color: #121212;
            color: white;
            text-align: center; /* 중앙 정렬 */
            font-size: 16px;
        }

    .leftResult {
    text-align:left;
    white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 */
    overflow: hidden;    /* 넘치는 텍스트는 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트는 "..."으로 표시 */
}

#recent-searches {
	width:600px;
	margin: auto;
    background-color: #121212;
    border-radius: 8px;
}

#recent-searches h3 {
    font-size: 20px;
    margin-bottom: 10px;
}

#search-records-container {
    margin-top: 10px;
}


.store-address-text {
    font-size: 13px;      
    color: gray;      
    display: block;       
    margin-top: 5px;      
    margin-left: 7px;      
    font-weight: normal;  
}

.details-btn{
color : #00FF84;
cursor : pointer;
fontWeight : 700;
fontSize : 16px;
 margin-right:5px;
}

 /* 반응형 처리 */
    @media (max-width: 768px) {
        .filter-select {
            width: 100px;
        }

        .search-btn {
            width: 100%;
            margin: 10px 0;
        }

        .store-name {
            flex-direction: column;
            align-items: flex-start;
        }

        .store-address-text {
            font-size: 12px;
        }

        .store-list {
            max-width: 100%;
            flex-direction: column;
        }

        /* 버튼 및 요소 크기 조정 */
        .flex-container {
            padding: 0 20px;
            width: 100%;
            max-width: 100%;
        }
    }
   
    </style>
</head>
<body>

<div class="container">
    <h2 class="contentTitle-text">코스정하기</h2>
    <h2 class="content-text">원하는 팝업 매장 선택하기</h2>

    <div class="button-group">
    <select class="filter-select" id="region-select">
    		<option value="">지역</option>
        <c:forEach var="region" items="${allRegionList}">
            <option value="${region.region_name}">${region.region_name}</option>
        </c:forEach>
    </select>
    
     
        <select class="filter-select" id="popup-select" >
    <option value="" >팝업</option>
    <c:forEach var="entry" items="${storeInfoMap}">
        <c:forEach var="address" items="${entry.value.addresses}">
            <option  value="${address.address}" data-region="${address.address}" name="${entry.value.storeTitle}" 
             data-storeIdx="${address.store_idx}" > ${entry.value.storeTitle} </option>
        </c:forEach>
    </c:forEach>
</select>
    </div>
    
   
    <div class="flex-container">
        <div class="store-list" ></div>
        <button type="button" class="search-btn" id="search-btn">경로 검색</button>
    </div>


	<!-- 숨긴상태로 위도경도 가져오는 form -->
	<form action="/M.GetCoordinates" method="post" id="address-form">
    <div id="hidden-fields"></div> <!-- 숨겨진 필드 컨테이너 추가 -->
    <button type="submit" style="display:none;">검색</button>
	</form>


    <div class="store-list" class="store-name" id="store-list"></div>                 <!-- 여기에 선택한거 들어옵니다! 7개까지 가능하게 해야함 -->  
	<div class="default-store-name" id="default-store">+</div>
	

</div>

 




<%@include file="/WEB-INF/include/app-navbar.jsp" %>


<script>
var url = "nmap://route/walk?";  // 앱 링크로 시작

var locationCount = 0;

// locations 데이터를 JavaScript 배열로 변환
var locationsData = [];
<c:forEach var="location" items="${locations}" varStatus="status">
    <c:if test="${location.lat != null && location.lon != null}">
        locationsData.push({
            lon: parseFloat("${location.lon}"),
            lat: parseFloat("${location.lat}"),
            name: "${location.name}",
            address: "${location.address}" // address로 수정
        });
    </c:if>
</c:forEach>

// 출발지 및 도착지 정보를 URL에 추가
locationsData.forEach(function(location, index) {
    locationCount++;

    if (index === 0) {
        // 첫 번째 위치는 출발지 정보 (slng, slat)
        url += "slng=" + location.lon.toFixed(7) + "&slat=" + location.lat.toFixed(7) + "&sname=" + encodeURIComponent(location.name) + "&";
    } else if (index === 1) {
        // 두 번째 위치는 도착지 정보 (elng, elat)
        url += "dlng=" + location.lon.toFixed(7) + "&dlat=" + location.lat.toFixed(7) + "&dname=" + encodeURIComponent(location.name) + "&";
    } else if(index>= 2) {
    	  // 세 번째 위치부터는 경유지 정보 (via0Lng, via0Lat, via0Text)
        var viaIndex = index - 1; // 경유지 인덱스는 0부터 시작
        url += "v" + viaIndex + "lng=" + location.lon.toFixed(7) + "&v" + viaIndex + "lat=" + location.lat.toFixed(7) + "&v" + viaIndex + "name=" + encodeURIComponent(location.name) + "&";
    }
});
// 추가적인 고정값들
url += "appname=com.example.myapp";

// URL을 알림창으로 확인
// alert(url);

// 앱에서 열기 시도
window.location = url;


window.location.href = "/Mobile/Users/RouteRecommend";
console.log(url);
</script>





</body>
</html>
