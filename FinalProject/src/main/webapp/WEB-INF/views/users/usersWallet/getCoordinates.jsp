<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
        }
        
		.content-text{       
			text-align:left;
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
   			justify-content: flex-start;
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
            display: block;
            padding: 10px;
            margin: 10px 0; 
            border: 2px dashed #00FF84; /* 기본 테두리 스타일 */
            border-radius: 5px;
            background-color: #121212;
            color: white;
            text-align: center; /* 중앙 정렬 */
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


    </style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<div class="container">
    <h2 class="content-text">원하는 팝업 매장 선택하기</h2>
    <h2 class="content-text">${address.address}</h2>

    <div class="button-group">
    <select class="filter-select" id="region-select">
    		<option value="">지역</option>
        <c:forEach var="region" items="${allRegionList}">
            <option value="${region.region_name}">${region.region_name}</option>
        </c:forEach>
    </select>
     
     
     

        <select class="filter-select" id="popup-select" style="width:320px;">
    <option value="" >팝업</option>
    <c:forEach var="entry" items="${storeInfoMap}">
        <c:forEach var="address" items="${entry.value.addresses}">
            <option  value="${address.address}" data-region="${address.address}" name="${entry.value.storeTitle}" 
             data-storeIdx="${address.store_idx}"> ${entry.value.storeTitle} </option>
        </c:forEach>
    </c:forEach>
</select>
    </div>
    
   


	<!-- 숨긴상태로 위도경도 가져오는 form -->
	<form action="/GetCoordinates" method="post" id="address-form">
    <div id="hidden-fields"></div> <!-- 숨겨진 필드 컨테이너 추가 -->
    <button type="submit" style="display:none;">검색</button>
	</form>


    <div class="store-list" class="store-name" id="store-list"></div>                 <!-- 여기에 선택한거 들어옵니다! 7개까지 가능하게 해야함 -->  
	<div class="default-store-name" id="default-store">+</div>
	
    <div class="flex-container">
        <div class="store-list" ></div>
        <button type="button" class="search-btn" id="search-btn">경로 검색</button>
    </div>

</div>

<script>
        window.onload = function() {
            var url = "https://map.naver.com/p/directions/";
            var locationCount = 0;

            // JSP에서 처리된 데이터를 JavaScript로 삽입하여 URL 생성
            <c:forEach var="location" items="${locations}" varStatus="status">
                <c:if test="${location.lat != null && location.lon != null}">
                    locationCount = ${status.index + 1};

                    // location.name을 사용하여 URL에 추가
                    var locationName = "${location.name}";
                    var encodedLocationName = encodeURIComponent(locationName); // URL 인코딩


                    // URL에 출발지와 도착지 추가
                    if (${status.index} == 0) {
                        url += "${location.lon},${location.lat}," + encodedLocationName + "/";
                    } else {
                        url += "${location.lon},${location.lat}," + encodedLocationName + "/";
                    }
                    // 마지막 바로 전 애는 마지막에 ":" 붙이기
                    if (${status.index} == ${locations.size() - 2}) {
                        url = url.slice(0, -1) + ":";  // 마지막 "/"를 ":"로 변경
                    }
                    
                </c:if>
            </c:forEach>

            // URL 끝에 /walk 추가
            if (url !== "" && url !== "https://map.naver.com/p/directions/") {
                if (locationCount === 2) {
                    url += "-/walk";  // 2개의 위치일 경우
                } else if (locationCount > 2) {
                    url += "walk";  // 3개 이상의 위치일 경우
                }

               
                
                window.open(url, "_blank");
                window.location.href = "/Users/RouteRecommend";
            } else {
                console.log("출발지와 도착지가 제대로 설정되지 않았습니다.");
            }
        };
    </script>

</body>
</html>
