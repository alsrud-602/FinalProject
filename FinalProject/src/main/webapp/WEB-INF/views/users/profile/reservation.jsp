<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필내정보</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
main {
  background-color:#121212;
  padding-bottom:600px;
}

.inner {
  margin:0 auto;
  max-width:1500px;
  display:flex;
  padding-left:150px;
}

.sidebar {
  margin-left:150px;
  margin-top:50px;
  width:100%;
}

.sidebar table {
  position:fixed;
  width:150px;
  height:500px;
  border:3px solid #00ff84;
  border-radius:8px;
  color:white;
  padding-top:10px;
  padding-bottom:10px; 
}

.sidebar td {
  padding: 15px 15px;
  text-align:center;
  font-size:22px;
  font-weight:800;
}

.sidebar a {
  display:block;
}

.pagetitle {
  color:white;
  font-size:58px;
  margin-top:40px;
}

.reserve-table {
  width:1000px;
  margin-top:40px;
  border-collapse:collapse;
  color:white;
}

.reserve-table tr {
  border-bottom:1px solid #00ff84;
  border-top:1px solid #00ff84;
}

.reserve-table th {
  font-size:20px;
  font-weight:800;
  height:40px;
}
.reserve-table th:nth-child(1) {
  width:150px;
}

.reserve-table th:nth-child(2) {
  width:450px;
}

.reserve-table th:nth-child(3) {
  width:250px;
}

.reserve-table td {
  height:160px;
  text-align:center;
  font-weight:700;
}

.reserve-table td:nth-child(2) {
  display:flex;
  align-items:center;
}

.reserve-table img {
  height:140px;
}

.span-flex {
  display:flex;
  flex-direction:column;
  padding-left:10px;
  text-align:left;
}

.span-flex span:nth-child(1) {
  font-size:18px;
  font-weight:750;
  margin-bottom:35px;
}

.span-flex span:nth-child(3) {
  font-weight:750;
}

.span-flex2 {
  display:flex;
  flex-direction:column;
  text-align:left;
  gap:12px;
}
</style>
</head>
<body>

    <%@include file="/WEB-INF/include/header.jsp" %>
    <main>
        <div class="inner">
            <div class="container">
                <h2 class="pagetitle">예약 내역</h2>
                <table class="reserve-table">
                    <thead>
                        <tr>
                            <th>예약일자</th>
                            <th>팝업정보</th>
                            <th>예약정보</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reservation" items="${TestList}">
              <tr>
    <td>
        <c:set var="dateString" value="${reservation.reservation_cdate}" />
        <fmt:parseDate value="${dateString}" pattern="${fn:contains(dateString, '/') ? 'dd/MM/yy' : 'yyyy-MM-dd HH:mm:ss'}" var="parsedDate" />
        <fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd"/>
    </td>
    <td>
        <img src="/image/read?path=${reservation.image_path}" alt="팝업 이미지">
        <span>${reservation.title}</span>
        <span>
            <c:set var="startDateString" value="${reservation.start_date}" />
            <c:set var="endDateString" value="${reservation.end_date}" />
            <fmt:parseDate value="${startDateString}" pattern="${fn:contains(startDateString, '/') ? 'dd/MM/yy' : 'yyyy-MM-dd HH:mm:ss'}" var="parsedStartDate" />
            <fmt:parseDate value="${endDateString}" pattern="${fn:contains(endDateString, '/') ? 'dd/MM/yy' : 'yyyy-MM-dd HH:mm:ss'}" var="parsedEndDate" />
            <fmt:formatDate value="${parsedStartDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${parsedEndDate}" pattern="yyyy.MM.dd"/>
        </span>
        <span>${reservation.address}</span>
    </td>
    <td>
        <div class="span-flex2">
            <span>방문일&nbsp;&nbsp;
                <c:set var="reservationDateString" value="${reservation.reservation_date}" />
                <fmt:parseDate value="${reservationDateString}" pattern="${fn:contains(reservationDateString, '/') ? 'yy/MM/dd' : 'yyyy-MM-dd HH:mm:ss'}" var="parsedReservationDate" />
                <fmt:formatDate value="${parsedReservationDate}" pattern="yyyy.MM.dd"/>
            </span>
            <span>매수&nbsp;&nbsp;${reservation.reservation_number}</span>
        </div>
    </td>
    <td><span>${reservation.reservation_status}</span></td>
</tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <aside>
                <div class="sidebar">
                    <table>
                        <tbody>
                            <tr><td><a href="/Users/Profile/Home">내 정보</a></td></tr>
                            <tr><td><a href="/Users/Profile/Reservation">예약내역</a></td></tr>
                            <tr><td><a href="/Users/Profile/Bookmark">관심팝업</a></td></tr>
                            <tr><td><a href="">지갑</a></td></tr>
                            <tr><td><a href="/Users/Profile/Suggestion">추천스토어</a></td></tr>
                            <tr><td><a href="/Users/Profile/Myreview">내가 쓴 리뷰</a></td></tr>
                        </tbody>
                    </table>
                </div>
            </aside>
        </div>
    </main>    
    <%@include file="/WEB-INF/include/footer.jsp" %>
    <!-- <script src="/js/authuser.js" defer></script> --> 
</body>
<script >

</script>
</html>
