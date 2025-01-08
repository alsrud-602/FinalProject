<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="icon" type="image/png" href="/img/favicon.png" />


<style>
*{
font-family: "Pretendard";

}

body {
    height:100%;
    margin: 0; /* 기본 여백 제거 */
    overflow-y:scroll;
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
    margin:100px;
    width:1640px;
}

/*---------------------------------------------------*/
/*유저관리*/
.content {
    padding: 20px; /* 콘텐츠에 패딩 추가 */
    background: #E8EEE7;
    margin-left: 30px;
    margin-top: 100px;
    height: 100%;
}

.content table{
    width : 1600px;
    height : 100px;
    font-size: 20px;
    font-family: 'Pretendard';
    font-weight: 500;
    padding : 10px;
    background: white;
}
.content table tr:first-child td{
   border-bottom: 3px solid #DFDFDF;
}
.content table td {
    padding : 15px;  
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
    padding : 40px 20px 40px 20px;
}
.hr {
    width: 98%; 
    margin: 0 auto; 
    border: 3px solid white;; /* 흰색으로 설정 */
    border-radius: 50px; /* 모서리를 둥글게 */
    margin-bottom: 30px;
}
/*유저 관리 테이블 정렬*/
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
#usertable{
    width:25px;
    height:25px;
    border-radius: 10px;
}
/*---------------------------------------------------*/
/*모달 버튼*/
.modalbutton1{
    white:50px;
    width:100px;
    height: 50px;
    font-size: 14px;
    font-family: 'Pretendard';
    margin-bottom: 10px;
    background: #00FF80;
    border: none;
    border-radius: 15px;
    padding-left: 10px;
    padding-right: 10px;
    font-weight: bold;
     margin-left: 1150px; 
}
.modalbutton2{
    white:50px;
    width:100px;
    height: 50px;
    font-size: 14px;
    font-family: 'Pretendard';
    margin-bottom: 10px;
    background: #FFAE62;
    border: none;
    border-radius: 15px;
    padding-left: 10px;
    padding-right: 10px;
    font-weight: bold;
}
span{
 color:red;
}
/*-----------------------------------------*/
/*모달 내부*/
.modal-content{
top: 500px; /* 모달의 상단 위치 */
}
#exampleModalLabel1{
    font-family: 'Roboto';
    font-size: 24px;
    font-weight: bold;
    
}
#exampleModalLabel1 span{
    color: #20573D;
}

#exampleModalLabel2{
    font-family: 'Roboto';
    font-size: 24px;
    font-weight: bold;
    
}
#exampleModalLabel2 span{
    color: #731912;
}
.modal-body input[type="text"]{
    background: #29292E;
    color:white;
    width:250px;
    height: 50px;
    margin-right: 5px;
    text-align: center;
}
input[type="number"]{
    background: #29292E;
    color:white;
    width:100px;
    height: 50px;
    text-align: center;
}
.insertbutton1{
    background: #00875F;
    color: white;
    border: none;
    width : 80px;
    height: 50px;
}
.insertbutton2{
    background: #F75A68;
    color: white;
    border: none;
    width : 80px;
    height: 50px;
}

/*----------------------------------------------*/
    .search-box {
        display: flex;
        align-items: center;
        justify-content: flex-start; 
        margin-bottom: 20px;
        font-family:'Pretendard';
    }

    .search-box input {
        width: 250px;
        padding: 8px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    .search-box button {
        margin-left: 10px;
        padding: 8px 15px;
        font-size: 16px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

  .button-search-container {
    display: flex; 
    align-items: center;
    justify-content: flex-start; 
}
 /*----------------------------------------------*/   
</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container" style="margin-left: 300px;"> 
  
<%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
  

 
    <div class="content">
      <h2>유저 관리</h2>
      <div class="hr"></div>
      

    
    <div class="button-search-container">
    <!-- 모달 버튼 -->
    
    <div class="search-box">
        <input type="text" id="searchInput" placeholder="검색어 입력(닉네임,아이디,가입일)">
    </div>
    
    <button type="button" class="modalbutton1" data-bs-toggle="modal" data-bs-target="#exampleModal1">
        선택한 회원 <br> 팝콘 지급하기
    </button>
    <button type="button" class="modalbutton2" data-bs-toggle="modal" data-bs-target="#exampleModal2">
        선택한 회원 <br> 팝콘 <span>차감하기</span>
    </button>
    
   </div>

      <table>
      <thead>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="headercheckbox" onclick='selectAll(this)'/></td>
          <td>
	          닉네임
	          <select id="sortSelectNikname" onchange="sortTable('nikname')">
	          <option value="return">정렬</option>
	          <option value="asc">닉네임(↑)</option>
	          <option value="desc">닉네임(↓)</option>
	        </select>
          </td>
          <td>
          아이디
          <select id="sortSelectId" onchange="sortTable('id')" >
            <option value="return">정렬</option>
            <option value="asc">아이디(↑)</option>
            <option value="desc">아이디(↓)</option>
        </select>
          </td>
          <td>가입일</td>
          <td>
              상태
              <select id="statusFilter" onchange="filterByStatus()"> 
              <option value="all">전체</option> 
              <option value="우수회원">우수회원</option> 
              <option value="일반회원">일반회원</option> 
              <option value="차단됨">차단됨</option> 
    	      </select>
           </td>
             <td>상세보기</td>
        </tr>
      </thead>    
    <tbody id="userTableBody">
        <!-- 사용자 목록을 출력 -->
        <c:forEach var="user" items="${allusers}">
            <tr>
             <td><input type="checkbox" id="usertable" name="usertable"  value="${user.id}" class="headercheckbox" onclick='select(this)'/></td>
                <td>${user.nikname}</td>
                <td>${user.id}</td>
                <td>${user.cdate}</td>
                <td>
                    <div>
                        <select class="userSelect"  onchange="updateUserStatus(this)">
                            <option value="우수회원" ${user.status == '우수회원' ? 'selected' : ''}>우수회원</option>
                            <option value="일반회원" ${user.status == '일반회원' ? 'selected' : ''}>일반회원</option>
                            <option value="차단됨" ${user.status == '차단됨' ? 'selected' : ''}>차단됨</option>
                        </select>
                    </div>
                </td>
                <td><a href="/Admin/Userdetail?id=${user.id}">상세보기</a></td>
            </tr>
        </c:forEach>
    </tbody>
    

    </table>
    

		<!-- 모달 -->
		<!-- 지급하기 -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel1">팝콘 <span>지급하기</span></h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      <form id="popcornForm" method="post" >
		          <input type="text"   id="contentInfo"  placeholder="지급내용(필수기입)" />
    			  <input type="number" id="pointsAmount" placeholder="ex)100" />
    
   				 <!-- content와 points를 hidden 필드로 설정 -->
   			 	 <input type="hidden" id="content" name="content" />
   				 <input type="hidden" id="points"  name="points" />
   				 <input type="hidden" id="userIds" name="userIds" />    
		        <button type="button" id="submitPlusPopcorn" class="insertbutton1" data-bs-dismiss="modal">지급</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 차감하기 -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel2">팝콘 <span>차감하기</span></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="popcornForm2" method="post">
                    <input type="text" id="contentInfo2" placeholder="차감내용(필수기입)">
                    <input type="number" id="pointsAmount2" placeholder="ex)100">
                    
                   <input type="hidden" id="content2" name="content2" />
                   <input type="hidden" id="points2" name="points2" />
                   <input type="hidden" id="userIds2" name="userIds2" />
                    <button type="button" id="submitMinusPopcorn" class="insertbutton2" data-bs-dismiss="modal">차감</button>
                </form>
            </div>
        </div>
    </div>
</div>
 
    </div>
  
</div>
</body>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>

<script>
//새로고침 (새로운 주 갱신 후 새로고침 주기)
window.onload = function() {
    // 세션 스토리지에서 'refreshed' 값 확인
    if (!sessionStorage.getItem('refreshed')) {
        // 세션 스토리지에 'refreshed' 값 저장
        sessionStorage.setItem('refreshed', 'true');
        window.location.reload();
    } else {
        // 새로고침 후 'refreshed' 값이 저장된 상태에서는 값 삭제
        sessionStorage.removeItem('refreshed');
    }
};

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('usertable');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}
</script>

<script>
$(function() {
    // 회원별 색깔
    $('.userSelect').each(function() {
        var value = $(this).val(); 
        updateBackgroundColor($(this), value); 
    });

    $('.userSelect').on('change', function() {
        var value = $(this).val(); 
        updateBackgroundColor($(this), value); 
        updateFontColor($(this), value); 
    });
    
    function updateBackgroundColor(selectElement, value) {
        if (value == '우수회원') {
            selectElement.css('background-color', '#F7FF00'); // 우수회원: 노란색
            selectElement.css('color', 'black');
        } else if (value == '일반회원') {
            selectElement.css('background-color', '#00522B'); // 일반회원: 녹색
            selectElement.css('color', 'white');
        } else if (value == '차단됨') {
            selectElement.css('background-color', '#DC3545'); // 차단됨: 빨간색
            selectElement.css('color', 'white'); // 차단됨: 빨간색
        } else {
            selectElement.css('background-color', ''); // 기본: 하양 
        }
    }
    
    function updateFontColor(selectElement, value) {
        if (value == '우수회원') {
            selectElement.css('color', 'black');
        } else if (value == '일반회원') {
            selectElement.css('color', 'white');
        } else if (value == '차단됨') {
            selectElement.css('color', 'white'); // 차단됨: 빨간색
        } else {
        }
    }
});
</script>

<script>
//유저 등급 업데이트 스크립트
function updateUserStatus(selectElement) {
    const userId = $(selectElement).closest('tr').find('input[name="usertable"]').val();
    const status = $(selectElement).val();

    fetch('/Admin/UpdateUserStatus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ userId: userId, status: status })  // userId와 status를 명시적으로 보내도록 수정
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
//팝콘 지급 스크립트
$(document).ready(function() {
    // 팝콘 지급 버튼 클릭 시
    $("#submitPlusPopcorn").click(function() {
        var content = $("#contentInfo").val();  // 지급내용
        var points = $("#pointsAmount").val();  // 지급 포인트

        // 선택된 사용자 배열 
        var selectedUsers = [];
        $("input[name='usertable']:checked").each(function() {
            selectedUsers.push($(this).val());  // 체크 사용자 배열에 추가
        });

        // hidden 필드에 값 채우기
        $("#content").val(content);   // content 필드에 값 설정
        $("#points").val(points);     // points 필드에 값 설정
        $("#userIds").val(selectedUsers.join(','));  // 선택된 사용자  콤마 구분

        // action을 "PlusPopcorns"로 설정
        $("#popcornForm").attr('action', '/Admin/PlusPopcorns');  // action URL 설정
        $("#popcornForm").submit();  
    });

});
</script>

<script>
//팝콘 차감 스크립트
$(document).ready(function() {
    $("#submitMinusPopcorn").click(function() {
        var content = $("#contentInfo2").val();  
        var points = $("#pointsAmount2").val(); 
        var selectedUsers = [];
        $("input[name='usertable']:checked").each(function() {
            selectedUsers.push($(this).val()); 
        });
        $("#content2").val(content);   
        $("#points2").val(points);     
        $("#userIds2").val(selectedUsers.join(','));  
        $("#popcornForm2").attr('action', '/Admin/MinusPopcorns');  
        $("#popcornForm2").submit();  
    });
});
</script>

<script type="text/javascript">
// 지급 성공 메세지 스크립트
    $(document).ready(function() {
        var message = '${message}';  
        if (message && message.trim() !== "") {
            alert(message);  
        }
    });
</script>

<script>
//정렬 스크립트
var originalRows = [];

function sortTable(column) {
    var table = $("table");
    var rows = table.find("tbody tr").get();

    // 정렬 선택을 확인하고, 다른 드롭다운을 초기화
    var sortOrder = (column === "nikname") ? $("#sortSelectNikname").val() : $("#sortSelectId").val();
    if (column === "nikname") {
        $("#sortSelectId").val("return"); // 아이디 정렬 초기화
    } else if (column === "id") {
        $("#sortSelectNikname").val("return"); // 닉네임 정렬 초기화
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
    var columnIndex = (column === "nikname") ? 1 : 2; // 닉네임 컬럼은 인덱스 1, 아이디 컬럼은 인덱스 2

    // 정렬
    rows.sort(function (a, b) {
        var cellA = $(a).children("td").eq(columnIndex).text().toLowerCase();
        var cellB = $(b).children("td").eq(columnIndex).text().toLowerCase();

        // 숫자 비교
        var numericA = parseInt(cellA.replace(/\D/g, ''), 10);
        var numericB = parseInt(cellB.replace(/\D/g, ''), 10);

        if (!isNaN(numericA) && !isNaN(numericB)) {
            if (sortOrder === "asc") {
                return numericA - numericB;
            } else if (sortOrder === "desc") {
                return numericB - numericA;
            }
        } else {
            // 문자열 비교
            if (sortOrder === "asc") {
                return cellA.localeCompare(cellB);
            } else if (sortOrder === "desc") {
                return cellB.localeCompare(cellA);
            }
        }
        return 0;
    });

    // 정렬된 행을 다시 테이블에 추가
    $.each(rows, function (index, row) {
        table.children("tbody").append(row);
    });
}
</script>



<script>
// 검색창 스크립트
$(document).ready(function() {
    $('#searchInput').on('input', function() {
        var searchTerm = $(this).val().toLowerCase();  // 입력된 검색어 소문자로 변환
        var rowCount = 0;  // 검색된 행 수를 카운트
        
        $('table tbody tr').each(function() {
           
            var rowText = $(this).clone()  
                .find('select, option,a')  
                .remove()  
                .end()  
                .text()  
                .toLowerCase();  

            if (rowText.indexOf(searchTerm) !== -1) {
                $(this).show();  
                rowCount++;  // 검색된 행 수 증가
            } else {
                $(this).hide();  // 포함되지 않으면 해당 행을 숨김
            }
        });

        // 검색 결과가 없을 때 메시지 표시
        if (rowCount === 0) {
            $('table tbody').append('<tr><td colspan="6" style="text-align:center; font-weight:bold; ">검색 결과가 없습니다.</td></tr>');
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
        $('table tbody').append('<tr><td colspan="6" style="text-align:center; font-weight:bold; ">검색 결과가 없습니다.</td></tr>');
    }
}
</script>


</html>
