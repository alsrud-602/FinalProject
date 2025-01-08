<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>팝콘</title>
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

   body{
   		padding-top : 144px
	  }
    
    
body {
    background-color: #121212;
    color: #fff;
}

.container {
    width: 100%;
    max-width: 600px;
    margin: auto;
    text-align: center;
}

/* 텍스트*/
.content-text{       
	text-align:left;
	line-height:1.8;
}

/* 내 팝콘 1000 옆에 아이콘*/
.icon{
	 vertical-align:bottom ; 
}
    

/*츨첵 시작*/
.daily-check {
    border: 2px solid #00FF84;
    border-radius: 10px;
    padding: 20px;
    margin: 10px auto; 
    text-align: center; 
    background-color: #121212;
}
.daily-check h3{
 color: #00FF84;
 margin: 10px;
}

/*출석아이콘 틀*/
.check-list {
    display: flex;
    justify-content: space-around;
    gap: 10px;
    margin: 10px 0;
}

/*출석 아이콘*/
.check-item {
	width: 70px; 
    height: 100px; 
    border: 2px solid #00FF84; 
    border-radius: 10px;
    display: flex;
    flex-direction: column; 
    align-items: center; 
    justify-content: center; 
    background-color: #333; 
    color: white; 
    font-size: 14px; 
}


.check-item img {
    width: 50px; 
    height: 50px;
    margin-bottom: -10px; 
}

.daily-checkbtn {
    display: inline-block;
    width: 500px;
    height: 40px;
    line-height:40px;
    font-weight:700;
    font-family:'Pretendard', sans-serif;
    border-radius:25px;
    cursor: pointer;
    background: #00FF84;
    color: black;
    text-align: center;
    
}
/*츨첵 끝*/



/*팝콘내역 주위 테두리*/
.popcorn-history{ 
 border: 2px solid #00FF84;
 border-radius: 15px;
 padding: 10px;

 max-height: 200px; /* 최대 높이 설정 */
 overflow-y: auto; /* 세로 스크롤바 활성화 */
 scrollbar-width: thin; /* 스크롤바 두께 조정 (모던 브라우저) */
 scrollbar-color: #00FF84 #333; /* 스크롤바 색상 (모던 브라우저) */
 
}

/*팝콘 내역 안에 입금 지출 버튼 */
.history-btn{			  
    display: inline-block;
    width: 100px;
    height: 40px;
    line-height:40px;
    font-weight:700;
    font-family:'Pretendard', sans-serif;
    border-radius:25px;
    cursor: pointer;
    background: #00FF84;
    color: black;
    text-align: center;
  }
  

/* 초기화 버튼*/
.refresh{                     
            color: white;
            font-size: 16px; 
        }
        
        
/*팝콘 내역 안 정렬*/
.popcorn-history p{
text-align: left;

}



        
 /*팝콘 내역 표 좌 우측 지우기*/

tr td:first-child,  
tr td:last-child {
    border-left: none; 
    border-right: none; 
}       
        
/* 팝콘 내역 표 */
.bodleft , .bodright{
width:20%;
}

.bodcenter{
width:60%;
}
   
/*팝콘 내역 끝*/



/* 피드등록, 코스추천 버튼*/    
 .button-container {
    display: flex; 
    justify-content: center; 
    gap: 20px; 
    margin-top: 20px; 
}
    
.walletbtn {
    display: flex; 
    justify-content: center; 
    align-items: center; 
    padding: 10px 20px; 
    font-weight: 700;
    font-family: 'Pretendard', sans-serif;
    height: 50px;
    border-radius: 5px;
    cursor: pointer;
    background: #00FF84;
    color: black;
    text-align: center;
    text-decoration: none;
    font-size: 16px; 
    min-width: 280px; 
    box-sizing: border-box; 
}




button:hover {
    background-color: #33ff33;
}


table {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
}

th, td {
    border: 1px solid white;
    padding: 10px;
}

th {
    background-color: #333;
}



  /* 팝업 스타일 */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 999;
        }

        .popup-content {
            background-color: #222;
            color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 80%;
            max-width: 500px;
            text-align: center;
            position: relative;
             z-index: 1000; /* 부모와 구분하여 흐림 효과 제외 */
        }

        .popup-content h2 {
            margin-bottom: 10px;
        }

        .popup-content p , h2 {
            line-height: 1.5;
            margin-bottom: 20px;
            text-align: left;
        }

        .popup-close {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            background: #00FF84;
            color: black;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            font-weight: bold;
        }

        .blurred {
            filter: blur(5px);
            pointer-events: none;
        }

/* 모바일 전용 스타일 */
@media (max-width: 768px) {
    body {
        padding-top: 100px; /* 모바일에서 적합한 패딩 */
    }

    .container {
        width: 90%; /* 화면의 90% 너비로 설정 */
        margin: 0 auto; /* 가운데 정렬 */
        text-align: center;
    }

    /* 텍스트 크기 조정 */
    .content-text {
        font-size: 14px; /* 글씨 크기 감소 */
        line-height: 2;
    }

    /* 팝콘 잔액 표시 */
    .icon {
        width: 50px; /* 아이콘 크기 축소 */
        height: 50px;
    }

    /* 출석 체크 */
    .daily-check {
        padding: 15px; /* 패딩 조정 */
        font-size: 14px; /* 글씨 크기 감소 */
    }

    .check-list {
        flex-wrap: nowrap; /* 아이템을 줄바꿈 가능하도록 */
        gap: 5px; /* 간격 축소 */
        justify-content: flex-start; /* 중앙 정렬 */
    }

    .check-list img {
        width: 30px; /* 아이콘 크기 축소 */
        height: 30px;
    }

    .check-item {
        width: 50px; /* 아이템 크기 축소 */
        height: 50px;
        font-size: 12px;
    }

    .daily-checkbtn {
        width: 90%; /* 버튼을 화면 너비에 맞춤 */
        height: 40px;
        line-height: 40px;
    }

    /* 팝콘 내역 */
    .popcorn-history {
        padding: 10px; /* 내부 여백 감소 */
        font-size: 12px; /* 텍스트 크기 조정 */
    }

    .history-btn {
        width: 80px; /* 버튼 크기 축소 */
        font-size: 12px;
        height: 30px;
        line-height: 30px;
    }

    /* 버튼 컨테이너 */
    .button-container {
        flex-direction: column; /* 버튼을 세로로 배치 */
        gap: 10px;
    }

    .walletbtn {
        width: 100%; /* 버튼을 화면 너비에 맞춤 */
        min-width: 100px; /* 최소 너비 설정 */
        height: 45px;
        font-size: 14px; /* 글씨 크기 감소 */
    }

    /* 팝업 스타일 */
    .popup-content {
        width: 90%; /* 팝업 크기를 화면 너비에 맞춤 */
        padding: 15px;
        font-size: 14px; /* 텍스트 크기 조정 */
    }

    .popup-close {
        width: 25px; /* 닫기 버튼 크기 축소 */
        height: 25px;
        line-height: 25px;
        font-size: 12px;
    }

    /* 테이블 */
    table {
        font-size: 12px; /* 글씨 크기 축소 */
    }

    th, td {
        padding: 5px; /* 셀 패딩 축소 */
    }
}


@media (max-width: 480px) {
    /* 더 작은 화면에 추가 조정 */
    .content-text {
        font-size: 12px;
    }

    .daily-checkbtn {
        font-size: 12px;
        height: 35px;
        line-height: 35px;
    }

    .walletbtn {
        font-size: 12px;
        height: 40px;
    }

    .check-item {
        width: 50px;
        height: 70px;
    }
}

	.firstoverlay{	
	
    border: 2px solid #00FF84;
    border-radius: 15px;

    }
.firstoverlay span{	
	font-size: 30px;
	font-family:'Pretendard';
	font-weight: bold;
    }

.history-btn2{			  
    display: inline-block;
    width: 80px;
    height: 40px;
    line-height:40px;
    font-weight:700;
    font-family:'Pretendard';
    border-radius:5px;
    cursor: pointer;
    background: #00FF84;
    color: black;
    text-align: center;
  }

    
 /*바텀 네비게이션 바*/   
    
      .bottom-nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #333;
        padding: 10px 20px;
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        z-index: 999;
    }
    .bottom-nav-item {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .nav-link {
        color: #fff;
        text-decoration: none;
        text-align: center;
    }
    .nav-link i {
        font-size: 20px;
        margin-bottom: 5px;
    }
    .nav-link span {
        font-size: 12px;
    }
    .bottom-nav-item:hover {
        background-color: #444;
        border-radius: 10px;
    }
    </style>
    
    
    
</head>
<body>

    <div class="container">
     <p class="content-text" style="color:gray; text-decoration:underline;"><a href="javascript:void(0);" id="popup-trigger" >팝콘이란?</a></p>
   
    <div class="firstoverlay">
            <h1 class="content-text" style="font-size: 20px; margin-left: 5px; color:#00FF84; ">내 팝콘 <img src="/img/PopcornCharater 1.png" alt="icon" width="80" height="80" class="icon"></h1>
            <span  >${Popcorn.total_points}</span>
            <a class="history-btn2"  style="margin-left: 120px; margin-bottom: 10px; " id="showPopcornDetails">내역</a>
    </div>



		<!-- 팝콘이란? 설명 -->
 		<div class="popup-overlay" id="popup-overlay">
            <div class="popup-content">
                <button class="popup-close" id="popup-close">X</button>
                <h2>팝콘이란?</h2>
                <p>
                    팝콘은 사용자가 피드를 등록하거나 코스를 추천하는 활동 등을 통해 얻을 수 있는 가상의 포인트입니다.<br>
                    팝콘은 다양한 서비스와 혜택에 사용할 수 있습니다.<br>
                    <br>획득방법<br>1.최초가입<br>2.출석하기<br>3.피드 등록하기<br>
                	<br>사용처<br>1.코스정해주기<br>2.선착순 예약<br>3.패널티 감소
                
                </p>
            </div>
        </div>
        

        <!-- 일일 출석 체크 -->
        <div class="daily-check">
            <h3>일일 출석체크</h3>
            <div class="check-list">
                 <c:forEach var="points" items="${points}">
            <div class="check-item" data-points="${points}">
                <c:choose>
                    <c:when test="${attendstat.consecutive_attendance_days == 0}">
                        <img src="/img/PopcornCharater 1.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 1 && points == 20}">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 2 && (points == 20 || points == 30)}">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 3 && (points == 20 || points == 30 || points == 40)}">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 4 && (points == 20 || points == 30 || points == 40 || points == 50)} ">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 5 && (points == 20 || points == 30 || points == 40 || points == 50 || points == 60)}">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 6 && (points == 20 || points == 30 || points == 40 || points == 50 || points == 60 || points == 70)}">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:when test="${attendstat.consecutive_attendance_days == 7 && (points == 20 || points == 30 || points == 40 || points == 50 || points == 60 || points == 70 || points == 100)}">
                        <img src="/images/icon/check.png" alt="icon" width="40" height="50">
                    </c:when>
                    <c:otherwise>
                        <img src="/img/PopcornCharater 1.png" alt="icon" width="40" height="50">
                    </c:otherwise>
                </c:choose>
                <br>+${points}
            </div>
        </c:forEach>
        
          </div>
            <a class="daily-checkbtn"  href="javascript:void(0);" onclick="submitAttendance()">팝콘 받기</a>
        </div>
        
        




        <!-- 팝콘 내역 팝업에서 보여줄 내용 -->
        
        <div class="popcorn-history" style="display: none;">
        <h1 class="content-text">팝콘 내역</h1>    
                <p>
                    <a class="history-btn"  id="allinfobtn" 
                       href="javascript:void(0);" onclick="filterLogs('')">전체</a>
                    <a class="history-btn"  id="Earninfobtn" 
                       href="javascript:void(0);" onclick="filterLogs('지급')">입금</a>
                    <a class="history-btn" id="Spendinfobtn"  
                       href="javascript:void(0);" onclick="filterLogs('사용')">지출</a>
                    <a class="refresh" href="/Wallet/Wallet" 
                      ><span style="font-size: 18px;">↻</span></a>
                </p>
            
       
   <c:set var="filterCondition" value="${param.filterCondition}" />
   <table>
<c:if test="${not empty Loglist}">
    <c:forEach var="userLog" items="${Loglist}">
      <c:if test="${empty param.filterCondition or userLog.content_info eq param.filterCondition}">
         <tr>
            <c:if test="${not empty userLog.add_date}">
                <td class="bodleft">${userLog.add_date}</td>
            </c:if>

            <c:if test="${not empty userLog.content}">
                <td class="bodcenter">${userLog.content}</td>
                <input type="hidden" value="${userLog.content_info}">
            </c:if>

            <c:if test="${not empty userLog.earned_points && userLog.earned_points > 0}">
                <td class="bodright">+${userLog.earned_points}</td>
            </c:if>

            <c:if test="${not empty userLog.spent_points && userLog.spent_points > 0}">
                <td class="bodright">-${userLog.spent_points}</td>
            </c:if>
          </tr>
        </c:if>
    </c:forEach>
</c:if>

<c:if test="${empty Loglist}">
    <tr>
        <td colspan="4">사용자 로그가 없습니다.</td>
    </tr>
</c:if>

                </tbody>
            </table>
        </div>

   <!-- 팝콘 내역 팝업에서 보여줄 내용 -->
  
     
  	  <div class="button-container">   
	    <a class="walletbtn">피드 등록하러가기</a>
	    <a class="walletbtn" href="/Mobile/Users/RouteRecommend">코스 정하기</a>
	  </div>
	
    </div>

<!-- 하단 네비게이션 바 -->
<div class="bottom-nav">
    <div class="bottom-nav-item">
        <a href="javascript:void(0);" class="nav-link">
            <i class="fas fa-search"></i>
            <img class="_6-10" src="/images/admin/store/admin-search.png" />
            <span>검색</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="javascript:void(0);" class="nav-link">
            <i class="fas fa-cogs"></i>
            <img class="_6-10" src="/images/header/popcornfactory.png" />
            <span>팝콘팩토리</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="javascript:void(0);" class="nav-link">
            <i class="fas fa-home"></i>
            <img class="_6-10" src="/images/icon/homepage.png"  style="width:20px; color:white;"  />
            <span>홈</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="javascript:void(0);" class="nav-link">
            <i class="fas fa-calendar-alt"></i>
            <img class="_6-10" src="/images/icon/insert.png" style="width:20px;"/>
            <span>예약 내역</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="javascript:void(0);" class="nav-link">
            <i class="fas fa-user"></i>
             <img class="personal-collection0" src="/images/header/personal-collection0.svg" />
            <span>프로필</span>
        </a>
    </div>
</div>

    <script>

    
    // 팝콘이란? 팝업 
    const popupTrigger = document.getElementById('popup-trigger');
    const popupOverlay = document.getElementById('popup-overlay');
    const popupClose = document.getElementById('popup-close');
    const bodyContainer = document.querySelector('.container');

    popupTrigger.addEventListener('click', () => {
        popupOverlay.style.display = 'flex';
        bodyContainer.classList.add('');
    });

    popupClose.addEventListener('click', () => {
        popupOverlay.style.display = 'none';
        bodyContainer.classList.remove('blurred');
    });

    popupOverlay.addEventListener('click', (event) => {
        if (event.target === popupOverlay) {
            popupOverlay.style.display = 'none';
            bodyContainer.classList.remove('blurred');
        }
    });
    

    // 팝콘(체크안된) 칸 안의 포인트 값 가져오기
    function submitAttendance() {
        // "PopcornCharacter" 모양의 아이콘을 찾기
        const popcornItems = document.querySelectorAll('.check-item img[src*="PopcornCharater 1.png"]');
        
        if (popcornItems.length > 0) {
            // 첫 번째 "PopcornCharacter" 아이콘의 부모 요소에서 포인트 값 가져오기
            const points = popcornItems[0].parentElement.getAttribute('data-points');

            fetch('/Mobile/Users/Daily-check', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'earnedPoints=' + points
            })
            .then(response => {
                return response.text(); 
            })
            .then(data => {
                console.log(data); 
                
                alert(data); 
                if (data === "출석 체크가 완료되었습니다!") {
                    window.location.href = "/Mobile/Users/Wallet"; 
                }
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
        } else {
            alert('팝콘 캐릭터 아이템이 없습니다.');
        }
    }

    //내역필터링 
    function filterLogs(condition) {
    	
        // 현재 스크롤 위치 저장
        localStorage.setItem('scrollPosition', window.scrollY);

        const url = new URL(window.location.href);
        if (condition) {
            url.searchParams.set('filterCondition', condition); 
        } else {
            url.searchParams.delete('filterCondition'); 
        }
        window.location.href = url.toString(); 
    }
    
    // 리로드 후 스크롤 위치 복원
    window.addEventListener('load', () => {
        const scrollPosition = localStorage.getItem('scrollPosition');
        if (scrollPosition) {
            window.scrollTo(0, parseInt(scrollPosition, 10)); // 저장된 위치로 이동
            localStorage.removeItem('scrollPosition'); // 사용 후 제거
        }
    });
    
    //새로고침 ( 새로고침 주기)
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




    </script>
<script>

document.getElementById("showPopcornDetails").addEventListener("click", function() {
    const popcornHistory = document.querySelector(".popcorn-history");
    popcornHistory.style.display = (popcornHistory.style.display === "none" || popcornHistory.style.display === "") ? "block" : "none";
});
</script>
</body>
</html>




