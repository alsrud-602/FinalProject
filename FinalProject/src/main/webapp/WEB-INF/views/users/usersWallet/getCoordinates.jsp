<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>주소 위치 정보</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <h1>주소 위치 정보</h1>

    <table>
        <thead>
            <tr>
                <th>주소</th>
                <th>위도</th>
                <th>경도</th>
                <th>오류 메시지</th>
                <th>길찾기</th>
            </tr>
        </thead>
        <tbody>
             <c:if test="${not empty locations}">
                <c:set var="url" value="https://map.naver.com/p/directions/" />

                <c:forEach var="location" items="${locations}" varStatus="status">
                    <tr>
                        <td>${location.address}</td>
                        <td>
                            <c:if test="${location.lat != null}">
                                ${location.lat}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${location.lon != null}">
                                ${location.lon}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${location.error != null}">
                                <span class="error">${location.error}</span>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${location.lat != null && location.lon != null}">
                                <!-- 동적 링크 생성: 위도와 경도를 사용하여 길찾기 링크 제공 -->
                                <c:if test="${status.index == 0}">
                                    <!-- 첫 번째 위치는 출발지로 설정 -->
                                    <c:set var="url" value="${url}${location.lon},${location.lat}" />
                                </c:if>
                                <c:if test="${status.index > 0}">
                                    <!-- 첫 번째 이후의 위치는 경유지/도착지로 추가 -->
                                    <c:set var="url" value="${url}/${location.lon},${location.lat}" />
                                </c:if>
                                <c:if test="${status.index == locations.size() - 1}">
                                    <!-- 모든 위치가 추가된 후, 길찾기 링크 생성 -->
                                    <a href="${url}/walk?c=16.00,0,0,0,dh" target="_blank">길찾기</a>
                                </c:if>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </tbody>
    </table>

    <a href="/">돌아가기</a>
     <script>

     window.onload = function() {
         // 페이지 로드 시 경로 자동 열기
         var url = "https://map.naver.com/p/directions/";
         var locationCount = 0; 

         // JSP에서 처리된 데이터를 JavaScript에 삽입
         <c:forEach var="location" items="${locations}" varStatus="status">
             <c:if test="${location.lat != null && location.lon != null}">
             locationCount = ${status.index + 1};
             
                 <c:if test="${status.index == 0}">
                     // 첫 번째 위치는 출발지로 설정
                     url += "${location.lon},${location.lat},${location.name}/";
                 </c:if>
                 <c:if test="${status.index > 0}">
                     // 두 번째 위치는 도착지로 설정
                     url += "${location.lon},${location.lat},${location.name}/";
                 </c:if>
             </c:if>
         </c:forEach>
	
         
         
         // URL 끝에 /walk추가
         if (url !== "" && url !== "https://map.naver.com/p/directions/") {
            if (locationCount === 2) {
                url += "-/walk"; // 2개의 위치일 경우
            } else if (locationCount > 2) {
                url += "walk"; // 3개 이상의 위치일 경우
            }
             window.open(url, "_blank");  // 자동으로 창 열기
             window.location.href = "/Users/RouteRecommend";
         } else {
             console.log("출발지와 도착지가 제대로 설정되지 않았습니다.");
         }
     };
</script>
</body>
</html>
