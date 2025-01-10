<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행 중</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link rel="stylesheet"  href="/css/common.css" />
<style>

body {
  background-color: white !important;
  color: white;
}

main {
  margin-bottom:100px;
}

aside {
  width:300px;
}

li {
  list-style: none; 
}

a {
  text-align : center;
  color: #00ff84;
}

.inner {
  margin:0 auto;
  display:flex;
  height:100%;
  justify-content:space-between;
  min-height:100vh;
  width:1600px;
}

.content {
  display:flex;
  flex-direction:column;
  width:1300px;
  background-color:#E8EEE7;
  padding-top:20px;
}

 /*--------------------------------------------------------------*/
 /*부트스트랩 캐러셀(이미지 슬라이드)*/
   
.carousel-item img {
  width: 100%;  /* 너비 100% */
  height: 100%; /* 높이 100% */
  object-fit: contain; /* 비율 유지하며 크기 조정 */
  max-height: 800px; /* 최대 높이 설정 */
}

.carousel-inner {
  position: relative;
}

.carousel-item {
  text-align: center; /* 텍스트 중앙 정렬 */
}

.carousel-caption {
  position: absolute; /* 캡션 위치 조정 */
  bottom: 20px; /* 아래 여백 */
  left: 50%; /* 중앙 정렬 */
  transform: translateX(-50%); /* 중앙 정렬 보정 */
}

.carousel-control-prev {
  left: -7% !important; /* 왼쪽 여백 조정 */
}

.carousel-control-next {
  right: -7% !important; /* 오른쪽 여백 조정 */
}

.carousel {
  margin:0 auto 0 auto; /* 중앙 정렬 */
  width: 1000px; /* 너비 설정 */
}

.ongoingfilter {
  position: relative; /* 요소를 고정 */
  top: 70px; /* 원하는 위치에 맞게 조정 */
  left: calc(50% - 825px); /* 왼쪽으로 100px 이동 (1000px의 절반 만큼) */
  transform: translateX(0); /* 중앙 정렬 보정 제거 */
  width: 1000px;
  height: 100px;
}
.breakdown {
  width:100%;
  display:flex;
  flex-direction:column;
  padding-left:15px;
}

.liner {
  align-self: stretch;
  height: 0px;
  border: 1px #219A00 solid;
  width:400px;
  margin-left:10px;
}

.blank {
  height:100px;
  display:flex;
  justify-content:flex-start;
  align-items:flex-end;
  font-size:20px;
  color:#4B4D50;
  padding-left:10px;
}

.adv-manage {
  width:1250px;
  border-collapse: separate;
  border-spacing: 0;
  overflow: hidden;
  border-radius: 6px;
  margin-top:15px;
  margin-bottom:40px;
}

.adv-manage thead {
  background-color:#f5f5f5;
  font-size:15px;
  color:black;
  height:48px;
}

.adv-manage th {
  font-weight:300;
}

.adv-manage th:nth-child(1) {
  display:flex;
  justify-content:center;
  align-items:center;
  height:48px;
}

.adv-manage th:nth-child(2) {
  width:90px;
}

.adv-manage th:nth-child(3) {
  width:250px;
}

.adv-manage th:nth-child(4) {
  width:250px;
}

.adv-manage th:nth-child(5) {
  width:250px;
}

.adv-manage th:nth-child(6) {
  text-align:center;
}

.adv-manage td:nth-child(1) {
  text-align:center;
}

.adv-manage td:nth-child(1) {
  display:flex;
  justify-content:center;
  align-items:center;
}

.adv-manage td {
  height:75px;
  background-color:white;
  border-collapse:collapse;
  border-bottom:1px solid #E0E0E0;
  color:black;
}

.adv-manage td:nth-child(6) {
  display:flex;
  justify-content:center;
  align-items:center;
}

.adv-manage td:last-child a {
  width:90px;
  height:35px;
  background-color:#E0E0E0;
  display:flex;
  justify-content:center;
  align-items:center;
  border-radius:5px;
  font-weight: bold;
  font-size: 20px;
  color: black;
}

input[type=checkbox] {
  transform: scale(2);
}

.adv-manage2 {
  width:1250px;
  border-collapse: separate;
  border-spacing: 0;
  overflow: hidden;
  border-radius: 6px;
  margin-top:15px;
  margin-bottom:40px;
}

.adv-manage2 thead {
  background-color:white;
  font-size:15px;
  color:black;
  height:48px;
}

.adv-manage2 th {
  font-weight:300;
  border-bottom:2px solid #dfdfdf;
  border-collapse:collapse;
}

.adv-manage2 th:nth-child(1) {
  padding-left:10px;
  width:100px;
}

.adv-manage2 th:nth-child(2) {
  width:230px;
}

.adv-manage2 tbody {
  background-color:white;
  font-size:16px;
  color:#6C757D;
}

.adv-manage2 td {
  border-bottom:2px solid #dfdfdf;
  border-collapse:collapse;
  font-weight:300;
  height:48px;
}

.adv-manage2 td:nth-child(1) {
  padding-left:10px;
}

.adv-manage2 td:last-child a {
  width:90px;
  height:35px;
  background-color:#28A745;
  display:flex;
  justify-content:center;
  align-items:center;
  border-radius:5px;
  font-weight: bold;
  font-size: 20px;
  color: black;
}


/* 회원상태 선택 CSS*/

.member-status {
  padding: 5px;
  border-radius: 5px;
  border: none;
  color: white;
  font-weight: bold;
}

.member-status.우수회원 {
  background-color: yellow;
  color: black;
}

.member-status.일반회원 {
  background-color: lightgreen;
  color: black;
}

.member-status.차단됨 {
  background-color: red;
  color: white;
}
.thumbnail{
width: 64px;
height: auto;
}
.header-container {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 공간을 균등하게 배분 */
    align-items: center; /* 수직 중앙 정렬 */
    
}

.adminsearch-container {
    display: flex;
    align-items: center;
    background-color: #F8F9FA; /* 연한 배경색 */
    border-radius: 25px; /* 둥근 모서리 */
    padding: 5px 10px; /* 패딩 */
    width: 300px; /* 원하는 너비 */
    height:60px;
    margin-top: 60px;
    margin-right: 40px;
}

.adminsearch-input {
   background-color: white;
    border: none; /* 테두리 없음 */
    outline: none; /* 포커스 시 테두리 없음 */
    font-size: 16px; /* 글자 크기 */
    border-radius: 25px; /* 둥근 모서리 */
}

.adminsearch-button {
    background: none; /* 배경 없음 */
    border: none; /* 테두리 없음 */
    cursor: pointer; /* 커서 변화 */
}

.adminsearch-icon {
    width: 20px; /* 아이콘 너비 */
    height: 20px; /* 아이콘 높이 */
}

</style>
</head>
<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<main>
<div class="inner">
   <aside>
    <%@include file="/WEB-INF/include/admin-slidebartest.jsp" %>
   </aside>
   <div class="content">
	 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/images/main/main-banner4.png" class="d-block w-100" alt="/images/main/main-banner4.png">
	    </div>
	    <div class="carousel-item">
	      <img src="/images/main/main-banner3.png" class="d-block w-100" alt="/images/main/main-banner3.png">
	    </div>
	    <div class="carousel-item">
	      <img src="/images/main/main-banner5.png" class="d-block w-100" alt="/images/main/main-banner5.png">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<div class="breakdown">
	 <div class="blank">광고 내역</div>
	 <div class="liner"></div>
	 <table class="adv-manage">
	  <thead>
	   <tr>
	    <th><input type="checkbox" onclick="toggleCheckboxes(this)"></th>
	    <th>썸네일</th>
	    <th>스토어 명</th>
	    <th>담당자 명</th>
	    <th>일자</th>
	    <th>광고관리</th>
	   </tr>
	  </thead>
	  <tbody>
<c:if test="${not empty popupManagerDetail}">
    <c:forEach var="list" items="${popupManagerDetail}">
        <tr>
            <td><input type="checkbox" class="item-checkbox"></td>
            <td><img src="/image/read?path=${fn:replace(list['IMAGE_PATH'], '\\', '/')} " alt="없음" class="thumbnail"></td>
            <td>${list.TITLE}</td>
            <td>${list['NAME']}</td>
            <td>${list['CDATE']}</td>
            <td><a href="/popup/release?id=${list['STORE_IDX']}">광고 해제</a></td>
        </tr>
    </c:forEach>
</c:if>
	  </tbody>
	 </table>
	</div>
<div class="breakdown">
    <div class="header-container">
        <div class="blank">담당자 내역</div>
        <div class="adminsearch-container">
            <input type="text" id="searchInput" placeholder="담당자 이름을 검색하세요" class="adminsearch-input" onkeyup="filterTable()">
            <button class="adminsearch-button" onclick="filterTable()">
                <img src="/images/admin/store/admin-search.png" alt="검색" class="adminsearch-icon">
            </button>
        </div>
    </div>
    <div class="liner"></div>
    <table class="adv-manage2">
        <thead>
            <tr>
                <th>썸네일</th>
                <th>스토어 명</th>
                <th class="sortable" data-column="name">이름 <span class="sort-icon"></span></th>
                <th>가입일</th>
                <th class="sortable" data-column="stores">등록한 스토어 수<span class="sort-icon"></span></th>
                <th>상태</th>
                <th>광고 관리</th>
            </tr>
        </thead>
        <tbody id="userTableBody">
            <c:forEach var="company" items="${allcompanys}">
                <tr>
                    <td><img src="/image/read?path=${fn:replace(company.image_path, '\\', '/')}" alt="없음" class="thumbnail"></td>
                    <td>${company.title}</td>
                    <td>${company.name}</td>
                    <td class="Cdatetd">${company.cdate}</td>
                    <td class="storeCount">${company.store_count}</td>
                    <td>
                        <div>
                            <select class="member-status" disabled>
                                <option value="우수회원" <c:if test="${company.status == '우수회원'}">selected</c:if>>우수회원</option>
                                <option value="일반회원" <c:if test="${company.status == '일반회원' || company.status == null}">selected</c:if>>일반회원</option>
                                <option value="차단됨" <c:if test="${company.status == '차단됨'}">selected</c:if>>차단됨</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="adinsert">
                            <a href="/Admin/updateBanStatus?store_idx=${company.store_idx}" onclick="return confirm('정말로 광고 등록 하시겠습니까?');">광고등록</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
  </div>
</div>
</main>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
<script>
function toggleCheckboxes(selectAllCheckbox) {
    const checkboxes = document.querySelectorAll('.item-checkbox');
    checkboxes.forEach(checkbox => {
        checkbox.checked = selectAllCheckbox.checked;
    });
}
</script>
<script>
function filterTable() {
    // 검색어 가져오기
    let input = document.getElementById('searchInput');
    let filter = input.value.toLowerCase();
    let table = document.getElementById('userTableBody');
    let rows = table.getElementsByTagName('tr');

    // 테이블의 모든 행을 반복
    for (let i = 0; i < rows.length; i++) {
        let cells = rows[i].getElementsByTagName('td');
        let storeName = cells[1].textContent.toLowerCase(); // 스토어 명
        let adminName = cells[2].textContent.toLowerCase(); // 이름

        // 검색어가 스토어명이나 이름에 포함되어 있는지 확인
        if (storeName.includes(filter) || adminName.includes(filter)) {
            rows[i].style.display = ''; // 행 표시
        } else {
            rows[i].style.display = 'none'; // 행 숨김
        }
    }
}
</script>
<script>
    const carousels = document.querySelectorAll('.carousel1');

    carousels.forEach(carousel => {
        const slides = carousel.querySelector('.slides');
        const slide = carousel.querySelectorAll('.slides li');
        let currentIdx = 0;
        const slideCount = slide.length;
        const prevBtn = carousel.querySelector('.prev');
        const nextBtn = carousel.querySelector('.next');
        const slideWidth = 350;
        const slideMargin = 5;

        slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';

        function moveSlide(num) {
            slides.style.left = -num * (slideWidth + slideMargin) + 'px';
            currentIdx = num;
        }

        nextBtn.addEventListener('click', function() {
            if (currentIdx < slideCount - 5) {
                moveSlide(currentIdx + 1);
            } else {
                moveSlide(0);
            }
        });

        prevBtn.addEventListener('click', function() {
            if (currentIdx > 0) {
                moveSlide(currentIdx - 1);
            } else {
                moveSlide(slideCount - 5);
            }
        });
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        // 드롭다운 상태 변경
        const selects = document.querySelectorAll('.member-status');
        
        selects.forEach(select => {
            select.addEventListener('change', function() {
                this.className = 'member-status ' + this.value;
            });
            
            // 초기 스타일 설정
            select.className = 'member-status ' + select.value;
        });

        // 테이블 정렬 기능
        const table = document.querySelector('.adv-manage2');
        const headers = table.querySelectorAll('th.sortable');
        let sortColumn = '';
        let sortDirection = 'asc';

        headers.forEach(header => {
            header.addEventListener('click', () => {
                const column = header.dataset.column;
                sortDirection = (sortColumn === column && sortDirection === 'asc') ? 'desc' : 'asc';
                sortColumn = column;
                sortTable(column, sortDirection);
            });
        });

        function sortTable(column, direction) {
            const tbody = table.querySelector('tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));

            const sortedRows = rows.sort((a, b) => {
                let aValue, bValue;

                if (column === 'name') {
                    aValue = a.querySelector('td:nth-child(1)').textContent.trim();
                    bValue = b.querySelector('td:nth-child(1)').textContent.trim();
                } else if (column === 'stores') {
                    aValue = parseInt(a.querySelector('td:nth-child(3)').textContent.trim(), 10);
                    bValue = parseInt(b.querySelector('td:nth-child(3)').textContent.trim(), 10);
                }

                return direction === 'asc' ? (aValue < bValue ? -1 : aValue > bValue ? 1 : 0) :
                                             (aValue > bValue ? -1 : aValue < bValue ? 1 : 0);
            });

            tbody.innerHTML = ''; // Clear existing rows
            sortedRows.forEach(row => tbody.appendChild(row));

            // 정렬 아이콘 업데이트
            headers.forEach(header => {
                header.querySelector('.sort-icon').textContent =
                    header.dataset.column === column ? (direction === 'asc' ? '▲' : '▼') : '';
            });
        }
    });

</script>
</body>
</html>
