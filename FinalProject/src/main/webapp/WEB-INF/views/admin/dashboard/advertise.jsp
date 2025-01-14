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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
    overflow: hidden; /* content 영역을 초과한 내용 숨김 */
      position: relative; /* 내부 요소의 위치 설정 */
}

 /*--------------------------------------------------------------*/
 /*부트스트랩 캐러셀(이미지 슬라이드)*/
.swiper-container{
margin-bottom: 20px;
}
.swiper-slide {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 500px; /* 슬라이드 너비 */
    height: 500px; /* 슬라이드 높이 */
}

.swiper-slide img {
    max-width: 100%; /* 이미지 너비 조정 */
    max-height: 100%; /* 이미지 높이 조정 */
    object-fit: contain; /* 비율 유지하며 크기 조정 */
}
.swiper-slide a {
max-width: 90%;
max-height: 100%;
    object-fit: contain; /* 비율 유지하며 크기 조정 */
}

.swiper-controls {
  display: flex;
  justify-content: space-between; /* 버튼을 좌우로 배치 */
  align-items: center;
  width: 100%;
  position: absolute; /* 이미지 위에 겹쳐 배치 */
  top: 20%; /* 컨트롤 영역을 이미지 위로 올림 */
  z-index: 10; /* 이미지 위에 표시되도록 설정 */
}

.swiper-button-prev,
.swiper-button-next {
  background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
  color: #fff; /* 화살표 색상 */
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  position: absolute; /* 상대적 위치 조정 */
  z-index: 20; /* 페이지네이션 위에 배치 */
  width:50px;
  height:50px;
  border-radius: 50%;
}

.swiper-button-prev {
  left: 10px; /* 왼쪽 버튼 위치 */
  top: 50%; /* 버튼을 수직 가운데 정렬 */
  transform: translateY(-50%);
}

.swiper-button-next {
  right: 10px; /* 오른쪽 버튼 위치 */
  top: 50%; /* 버튼을 수직 가운데 정렬 */
  transform: translateY(-50%);
}

.swiper-pagination {
  position: absolute;
  bottom: 20px; /* 페이지네이션 위치 조정 */
  left: 50%;
  transform: translateX(-50%); /* 가운데 정렬 */
  display: flex;
  gap: 8px; /* 점 간격 */
  z-index: 15; /* 버튼보다 아래 배치 */
}

.swiper-pagination .swiper-pagination-bullet {
  width: 10px;
  height: 10px;
  background-color: rgba(255, 255, 255, 0.7); /* 점의 색상 */
  border-radius: 50%; /* 점을 동그랗게 */
  cursor: pointer;
  transition: background-color 0.3s ease; /* 점의 색상 변화 애니메이션 */
}

.swiper-pagination .swiper-pagination-bullet-active {
  background-color: rgba(0, 0, 0, 0.9); /* 활성화된 점의 색상 */
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
	<div class="swiper-container">
	    <div class="swiper-wrapper">
	        <c:forEach var="banner" items="${banners}" varStatus="status">
	            <div class="swiper-slide">
	        <a href="/Users/Info?store_idx=${banner.store_idx}">
	                <img src="/image/read?path=${fn:replace(banner.image_path, '\\', '/')}" 
	                     alt="${banner.image_path}">
	            </a>
	            </div>
	        </c:forEach>
	    </div>
	    <div class="swiper-controls">
	        <div class="swiper-button-prev"></div>
	        <div class="swiper-button-next"></div>
	        <div class="swiper-pagination"></div>
	    </div>
	    <div>미리보기</div>
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
	    <th>배너 등록일</th>
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
            <td>${list['RDATE']}</td>
            <td><a href="/Admin/deleteBanner?store_idx=${list['STORE_IDX']}" onclick="return confirm('정말로 광고를 해제하시겠습니까?');">광고 해제</a></td>
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
                <th>스토어 등록일</th>
                <th class="sortable" data-column="stores">등록한 스토어 수<span class="sort-icon"></span></th>
                <th>상태</th>
                <th>광고 관리</th>
            </tr>
        </thead>
        <tbody id="userTableBody">
            <c:forEach var="company" items="${allcompanys}">
                <tr>
                    <input type="hidden" name="imageext" value="${company.imageext}">
                    <input type="hidden" name="imagename" value="${company.imagename}">
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
const swiper = new Swiper('.swiper-container', {
    slidesPerView: 2, // 한 번에 보여줄 슬라이드 수
    slidesPerGroup: 1, // 버튼 클릭 시 넘어가는 슬라이드 수
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    loop: true, // 슬라이드 반복
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
