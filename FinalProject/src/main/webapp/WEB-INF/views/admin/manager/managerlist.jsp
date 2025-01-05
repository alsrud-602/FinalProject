<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
*{
font-family: "Pretendard";

}
body {
    height:100%;
    height:100%;
    margin: 0; /* 기본 여백 제거 */
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
    margin: 100px 30px; /* 상하 100px, 좌우 30px */
    width:1640px;
    
}

/*---------------------------------------------------*/
/*담당자 관리*/
.content {
    padding: 20px; /* 콘텐츠에 패딩 추가 */
    background: #E8EEE7;
    margin-left: 30px;
    margin-top: 100px;
    height: 100%;
}

.content table{
    width : 1500px;
    height : 100px;
    font-size: 20px;
    font-family: 'Poppins';
    font-weight: 500;
    padding : 10px;
    margin: 10px 40px 40px 40px;
    background: white;
}
.content table tr:first-child td{
   border-bottom: 3px solid #DFDFDF;
}
.content table td {
   padding : 15px 15px 15px 25px;  
   border-bottom: 2px solid #DFDFDF;
   
}
.content table td a{
  text-decoration: none;
  color:black;
}
.content table tr:not(:first-child):hover{
  background: #EAEAEA;
}

.content h2{
    font-family: 'Pretendard';
    font-size: 40px; 
    padding : 40px 20px 30px 20px;
}
.hr {
    width: 98%; 
    margin: 0 auto; 
    border: 3px solid white;; /* 흰색으로 설정 */
    border-radius: 50px; /* 모서리를 둥글게 */
    margin-bottom: 60px;
}
/*------------------------*/
/*검색창*/
.headerflex{
  display: flex;
}
.adminsearch-container {
    display: flex;
    align-items: center;
    background-color: #F8F9FA; /* 연한 배경색 */
    border-radius: 25px; /* 둥근 모서리 */
    padding: 5px 10px; /* 패딩 */
    width: 350px; /* 원하는 너비 */
    height:70px;
    margin-top: 20px;
    margin-left: 850px;
}

.adminsearch-input {
   background-color: white;
    border: none; /* 테두리 없음 */
    outline: none; /* 포커스 시 테두리 없음 */
    flex: 1; /* 남은 공간을 채우기 */
    padding: 10px; /* 패딩 */
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
/*담당자 관리 테이블 정렬*/
#sortSelect{
   border: none;
   width:120px; 
}
/*우수회원*/
.good{
    background: #F7FF00;
}
/*평범회원*/
.nomal{
    background: #00522B;
}
/*블랙회원*/
.bad{
    background: #DC3545;
}
.userSelect{
    font-weight: 600;
    border: none;
    border-radius: 30px;
    width: 120px;
    padding:5px;
    text-align: center;
    
}

.adinsert{
    background: #28A745;
    font-weight: 600;
    width: 120px;
    padding:5px;
    border-radius: 10px;
    text-align: center;
    border-bottom: 2px solid black;
}

</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container" style="margin-left: 300px;"> 
  
<%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
  
 
    <div class="content">
       <div class="headerflex">
	      <h2>스토어 담당자 관리</h2>
	      <div class="adminsearch-container">
		    <input type="text" id="searchInput" placeholder="담당자 이름을 검색하세요" class="adminsearch-input">
		    <button class="adminsearch-button">
		        <img src="/images/admin/store/admin-search.png" alt="검색" class="adminsearch-icon">
		    </button>
		  </div>
		</div>
      <div class="hr"></div>
      <table>
      <thead>
        <tr>
          <td>
	          이름
	           <select id="sortSelectName" onchange="sortTable('name')" >
               <option value="return">정렬</option>
               <option value="asc">이름(↑)</option>
               <option value="desc">이름(↓)</option>
               </select>
          </td>
          <td>
          가입일
               <select id="sortSelectCdate" onchange="sortTable('cdate')" >
               <option value="return">정렬</option>
               <option value="asc">가입일(↑)</option>
               <option value="desc">가입일(↓)</option>
               </select>
          </td>
          <td>등록한 스토어 수</td>
           <td>
              상태
              <select id="statusFilter" onchange="filterByStatus()"> 
              <option value="all">전체</option> 
              <option value="우수회원">우수회원</option> 
              <option value="일반회원">일반회원</option> 
              <option value="차단됨">차단됨</option> 
    	      </select>
           </td>
          <td>광고 관리</td>
        </tr>
        </thead>  
        <tbody id="userTableBody">
          <c:forEach var="company" items="${allcompanys}">
            <tr>
                <td>${company.name}</td>
                <td class="Cdatetd">${company.cdate}</td>
                <td class="storeCount">${company.storecount}</td>
                <td>
                    <div>
                       <input type="hidden" name="companyId" value="${company.id}" />
                        <select class="userSelect"  onchange="updateUserStatus(this)">
                            <option value="우수회원" ${company.status == '우수회원' ? 'selected' : ''}>우수회원</option>
                            <option value="일반회원" ${company.status == '일반회원' ? 'selected' : ''}>일반회원</option>
                            <option value="차단됨" ${company.status == '차단됨' ? 'selected' : ''}>차단됨</option>
                        </select>
                    </div>
                </td>
                <td><div class="adinsert"><a href="/">광고등록</a></div></td>
            </tr>
        </c:forEach>
         </tbody>
        </table>

    </div>
  
</div>
</body>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
<script>
$(function(){
	$('.adminsearch-icon').on('click',function(){
		alert("ok");
	})
})
</script>

<script>
//정렬 스크립트
var originalRows = [];

function sortTable(column) {
    var table = $("table");
    var rows = table.find("tbody tr").get();

    // 정렬 선택을 확인하고, 다른 드롭다운을 초기화
    var sortOrder = (column === "name") ? $("#sortSelectName").val() : $("#sortSelectCdate").val();
    if (column === "name") {
        $("#sortSelectCdate").val("return"); // 가입일 정렬 초기화
    } else if (column === "cdate") {
        $("#sortSelectName").val("return"); // 이름 정렬 초기화
    }

    if (sortOrder === "return") {
        // 원래 상태로 되돌리기
        if (originalRows.length > 0) {
            $.each(originalRows, function (index, row) {
                table.children("tbody").append(row);
            });
        }
        return; // 정렬을 변경하지 않고 함수를 종료
    }

    // 첫 호출 시 원본 행을 저장
    if (originalRows.length === 0) {
        originalRows = rows.slice(); // 원본 행을 복사
    }

    // 선택된 컬럼에 따른 인덱스 값
    var columnIndex = (column === "name") ? 0 : 1; // 이름 컬럼은 인덱스 0, 가입일 컬럼은 인덱스 1

    // 정렬
    rows.sort(function (a, b) {
        var cellA = $(a).children("td").eq(columnIndex).text().toLowerCase();
        var cellB = $(b).children("td").eq(columnIndex).text().toLowerCase();

        if (column === "name") {
            // 이름 컬럼은 대소문자 구분 없이 비교
            cellA = cellA.toLowerCase();
            cellB = cellB.toLowerCase();
        }

        // 문자열 비교
        if (sortOrder === "asc") {
            return cellA.localeCompare(cellB);
        } else if (sortOrder === "desc") {
            return cellB.localeCompare(cellA);
        }
        return 0;
    });

    // 정렬된 행을 다시 테이블에 추가
    $.each(rows, function (index, row) {
        table.children("tbody").append(row);
    });
}

// 페이지 로드 시 원래 행 순서 저장
$(document).ready(function () {
    var table = $("table");
    var rows = table.find("tbody tr").get();
    originalRows = rows.slice(); // 원본 행을 복사
});
</script>

<script>
//페이지 로드 시 색상 업데이트
$(function() {
    // 각 .userSelect 요소의 첫 번째 옵션의 값을 확인하여 색상 설정
    $('.userSelect').each(function() {
        var value = $(this).val();
        updateBackgroundColor($(this), value);
    });

    // 선택된 옵션에 따라 색상 변경
    $('.userSelect').on('change', function() {
        var value = $(this).val();
        updateBackgroundColor($(this), value);
    });

    // 색상 업데이트 함수
    function updateBackgroundColor(element, value) {
        if (value === '우수회원') {
            element.css('background-color', '#F7FF00'); 
            element.css('color', 'black'); 
        } else if (value === '일반회원') {
            element.css('background-color', '#00522B'); 
            element.css('color', 'white'); 
        } else if (value === '차단됨') {
            element.css('background-color', '#DC3545'); 
            element.css('color', 'white'); 
        }
    }
});
</script>
<script>
//유저 상태 업데이트 함수
function updateUserStatus(selectElement) {
    const companyId = $(selectElement).closest('tr').find('input[name="companyId"]').val();  // companyId로 수정
    const status = $(selectElement).val();

    fetch('/Admin/UpdateCompnanyStatus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ companyId: companyId, status: status }) // companyId로 수정
    })
    .then(response => response.json())
    .then(data => {
        alert("회원 상태가 성공적으로 업데이트되었습니다.");
    })
    .catch(error => {
        console.error("회원 상태 업데이트 오류:", error);
        alert("회원 상태 업데이트에 실패했습니다. 다시 시도해주세요.");
    });
}
</script>

<script>
// 검색창 스크립트
$(document).ready(function() {
    $('#searchInput').on('input', function() {
        var searchTerm = $(this).val().toLowerCase();  // 입력된 검색어 소문자로 변환
        var rowCount = 0;  // 검색된 행 수를 카운트
        
        // 테이블의 각 행을 검사
        $('table tbody tr').each(function() {
            var rowText = $(this).clone()  
                .find('select, option, a, .storeCount , .Cdatetd')  // select, option, a 요소는 제외
                .remove()  
                .end()  
                .text()  // 각 행의 텍스트를 가져옴
                .toLowerCase();  // 소문자로 변환

            // 검색어가 행 텍스트에 포함되면 표시, 아니면 숨김
            if (rowText.indexOf(searchTerm) !== -1) {
                $(this).show();  
                rowCount++;  // 검색된 행 수 증가
            } else {
                $(this).hide();  // 포함되지 않으면 해당 행을 숨김
            }
        });

        // 검색 결과가 없을 때 메시지 표시
        if (rowCount === 0) {
            // 메시지 추가
                $('table tbody').append('<tr><td colspan="5" style="text-align:center; font-weight:bold; ">검색 결과가 없습니다.</td></tr>');
        } else {
            // 검색 결과가 있으면 메시지를 제거
            $('table tbody tr:contains("검색 결과가 없습니다.")').remove();
        }
    });
});
</script>

<script>
//회원 상태 필터링 
function filterByStatus() {
    var statusFilter = $("#statusFilter").val().toLowerCase();  
    var rowCount = 0;  // 필터링된 행 수를 카운트

    // 기존 "검색 결과가 없습니다." 메시지 제거
    $('table tbody tr:contains("검색 결과가 없습니다.")').remove();

    $('table tbody tr').each(function() {
        var userStatus = $(this).find('.userSelect').val().toLowerCase();  

        if (statusFilter === "all" || userStatus.indexOf(statusFilter) !== -1) {
            $(this).show(); 
            rowCount++;  // 필터링된 행 수 증가
        } else {
            $(this).hide();  
        }
    });

    // 필터링 결과가 없을 때 메시지 표시
    if (rowCount === 0) {
        $('table tbody').append('<tr><td colspan="5" style="text-align:center; font-weight:bold; ">검색 결과가 없습니다.</td></tr>');
    }
}
</script>

</html>
