<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/mobile-common.css" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
   body{
   background-color: #121212 !important;
    color: white;
    
   }
   .container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    padding: 10px;
    background-color: #181818; /* Dark background like the example */
    width: 100%;
    height: auto;
    
}

.card {
    display: flex;
    position: relative;
    background-color: #000;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    overflow: hidden;
    text-decoration: none;
    color: white;
    width: 100%;
    height: 300px;
}
.popup-like {
    position: absolute;
    top: 10px; /* Adjust to control vertical position */
    right: 10px; /* Adjust to control horizontal position */
    background-color: rgba(0, 0, 0, 0.7); /* Optional background for better visibility */
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 35px;
    color: red;
    display: flex;
    align-items: center;
    gap: 5px;
    z-index: 10; /* Ensure it stays on top */
}

  .popup-image {
    width: 250px;
    height: auto;
}

.popup-content {
    padding: 15px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex: 1;
}

.popup-title {
    font-size: 40px;
    font-weight: bold;
    margin-bottom: 10px;
}

.popup-info {
    font-size: 35px;
    line-height: 2;
}

.popup-location,
.popup-date {
    display: flex;
    align-items: center;
    gap: 10px;
}

.popup-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}

.popup-actions span {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 35px;
    cursor: pointer;
}

.popup-actions .fa {
    font-size: 1.1rem;
}


.popup-share {
}
   .mainfilter {    
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius: 10px;
    font-family:'Pretendard';
    font-size:50px;
    border: 2px solid #00ff84;
    margin-left:23%; 
    }
    
  .regionfilter{
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    font-size:50px;
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 10px;
    }
    .agefilter{
    cursor: pointer;
    padding: 10px;
    background: #121212;
    color: white;
    border: none;
    border-radius:10px;
    font-family:'Pretendard';
    font-size:50px;
    border: 2px solid #00ff84;
    display: inline-block;
    padding : 13px;
    position: relative;
    }
    
    #calendarInput{
    background: #121212;
    color: white;
    border: none;
    border-radius: 10px;
    font-family:'Pretendard';
    font-size:40px;
    text-align: center;
    border: 2px solid #00ff84;
    display: inline-block;
    padding-top : 11px;
    padding-bottom : 11px;
    }
    .h2text{
    position: relative;
    width: 100%;
    font-family:'Pretendard';
    font-size:70px;
    text-align: center;
    white-space: nowrap;
    
    }
    .ongoingfilter {
    position: relative; /* 요소를 고정 */
    top: 70px; /* 원하는 위치에 맞게 조정 */
    transform: translateX(-22.5%); /* 중앙 정렬 보정 제거 */
    width: 100%;
    height: 100px;
    margin-bottom:100px;
    white-space: nowrap;
}
    .resetbutton{
      background: #121212;
      color:white;
      padding: 10px;
      border: none;
      border: 2px solid #00ff84;
      border-radius: 10px;
      margin-left: 10px;
      font-size: 50px;
    }
    .nodata{
      font-size: 40px;
      padding : 30px;
      width: 600px;
      margin-left: 500px;
    }
      .scroll-button {
      position: fixed;
      bottom: 200px; /* 화면 아래에서의 거리 */
      right: 30px; /* 화면 오른쪽에서의 거리 */
      background-color: rgba(0, 255, 132, 0.7);
      color: white; /* 버튼 텍스트 색상 */
      border: none;
      border-radius: 50%;
      padding: 10px;
      font-size: 60px;
      cursor: pointer;
      z-index: 1000; /* 다른 요소 위에 표시 */
      width: 100px;
      height: 100px;
  }
  .likebtn {
    display: flex; /* Flexbox 사용 */
    align-items: center; /* 수직 중앙 정렬 */
    cursor: pointer; /* 포인터 커서로 변경 */
}

.likebtn img {
    margin-right: 5px; /* 이미지와 텍스트 사이의 간격 */
}
</style>
</head>
<body>
<%
    boolean showHeader = false; // 조건에 따라 true 또는 false로 설정
    if (showHeader) {
%>
    <%@include file="/WEB-INF/include/header.jsp" %>
<%
    }
%>
  <main>
	<div>
	<h2 class="h2text">진행중 팝업</h2>
	   <div class="ongoingfilter">
		    <input type="date"class="mainfilter" id="datepickerButton" >
		    <select class="regionfilter">
		      <option value="">지역</option>
		      <option value="서울">서울</option>
		      <option value="부산">부산</option>
		      <option value="대구">대구</option>
		      <option value="대전">대전</option>
		      <option value="울산">울산</option>
		      <option value="광주">광주</option>
		      <option value="인천">인천</option>
		      <option value="제주도">제주도</option>
		    </select>
		    <select class="agefilter">
		      <option value="">연령대</option>
		      <option value="10대">10대</option>
		      <option value="20대">20대</option>
		      <option value="30대">30대</option>
		      <option value="40대">40대</option>
		      <option value="50대">50대</option>
		    </select>
		    <button type="reset" onclick='window.location.reload()' class="resetbutton">※초기화</button>
		  </div>
	</div>
	
	<div class="container">
    <c:forEach var="popup" items="${popuplist}">
        <a href="/Mobile/Users/Info?store_idx=${popup.store_idx}" class="card">
        <span class="popup-like" >
            <span class="likebtn"  data-store-idx="${popup.store_idx}"  onclick="event.preventDefault(); event.stopPropagation(); LikeConfig(this);"><img src="/images/detail/noHeart.svg" id="heartimg"> <span id="like-count">${popup.like}</span></span>
        </span>
            <img src="/image/read?path=${popup.image_path}" alt="Store Image" class="popup-image">
            <div class="popup-content">
                <div class="popup-title">${popup.title}</div>
                <div class="popup-info">
                    <div class="popup-location">
                        <img src="/images/detail/locationicon.svg"> ${popup.address}
                    </div>
                    <div class="popup-date">
                        <img src="/images/detail/calender.svg"> ${popup.start_date} ~ ${popup.end_date}
                    </div>
                </div>
                <div class="popup-actions">
                <span></span>
                    <span class="popup-share">
                        <span class="bookmark"  data-store-idx="${popup.store_idx}"  onclick="event.preventDefault(); event.stopPropagation(); bookConfig(this);"><img src="/images/detail/noStar.svg"> 찜하기</span> | 
                        <span class="share" onclick="onShare()"> <img src="/images/detail/share.svg">공유하기</span>
                    </span>
                </div>
            </div>
        </a>
    </c:forEach>
</div>
 </main>
 <button id="scrollToTop" class="scroll-button" onclick="scrollToTop()">
        ↑
    </button>
</body>
<script>
// 스크롤 맨 위로 이동하는 함수
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth' // 부드럽게 스크롤
    });
}

// 스크롤 위치에 따라 버튼 표시
window.onscroll = function() {
    const button = document.getElementById('scrollToTop');
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        button.style.display = "block"; // 100px 이상 스크롤하면 버튼 표시
    } else {
        button.style.display = "none"; // 100px 이하로 스크롤하면 버튼 숨김
    }
};
//지역,연령대,날짜 필터링
$(function() {
    $('.regionfilter, .agefilter, .mainfilter').on('change', function() {
        let region = $('.regionfilter').val();
        let age = $('.agefilter').val();
        let date = $('.mainfilter').val();

        $.ajax({
            url: '/Mobile/Users/Regionfilter',
            type: 'GET',
            data: { region: region, age: age, date: date }
        })
        .done(function(data) {
            console.log(data); // 응답 확인
            $('.container').html(""); // 기존 내용 비우기
            let html = "";
            
         // filterlist가 존재하고 배열인지 확인
            if (data.filterlist && Array.isArray(data.filterlist)) {
                if (data.filterlist.length > 0) { // filterlist가 비어있지 않으면
                    data.filterlist.forEach(function(a) {
                    	html += "<a href='/Mobile/Users/Info?store_idx=" + a.store_idx + "' class='card' onclick='handleCardClick(event)'>" +
                        "<span class='popup-like'>" +
                            "<i class='fa fa-heart'></i> 100" +
                        "</span>" +
                        "<img src='/image/read?path=" + a.image_path + "' alt='Store Image' class='popup-image'>" +
                        "<div class='popup-content'>" +
                            "<div class='popup-title'>" + a.title + "</div>" +
                            "<div class='popup-info'>" +
                                "<div class='popup-location'>" +
                                    "<img src='/images/detail/locationicon.svg'> " + a.address +
                                "</div>" +
                                "<div class='popup-date'>" +
                                    "<img src='/images/detail/calender.svg'> " + a.start_date + " ~ " + a.end_date +
                                "</div>" +
                            "</div>" +
                            "<div class='popup-actions'>" +
                                "<span></span>" +
                                "<span class='popup-share'>" +
                                    "<span class='bookmark' onclick='event.preventDefault(); event.stopPropagation(); bookConfig(this);'>" +
                                        "<img src='/images/detail/noStar.svg'> 찜하기" +
                                    "</span> | " +
                                    "<img src='/images/detail/share.svg'> 공유하기" +
                                "</span>" +
                            "</div>" +
                        "</div>" +
                    "</a>";
                    });
                } else {
                    html = "<div class='nodata'>데이터가 없습니다.</div>"; // filterlist가 비어있을 때 메시지
                }
            }

            $('.container').append(html); // 생성된 HTML 추가
            
        })
        .fail(function(err) {
            console.log(err);
            alert('오류 : ' + err.responseText);
        });
    });
});

</script>
<script>
//1. 좋아요를 이미 했는지 여부 
function LikeConfig(likeElement){
	const store_idx = likeElement.getAttribute('data-store-idx');
	
	const content = {
		    store_idx: store_idx 
		};
		fetch(`/Popup/Mobile/Like/Config`, {
		    method: 'POST', // POST 요청
		    headers: {
		        'Content-Type': 'application/json', // JSON 데이터임을 명시
		    },
		    body: JSON.stringify(content), // 객체를 JSON 문자열로 변환하여 전송
		})
	    .then(response => {
	        if (response.status === 401) {
	            // 리다이렉션 처리
	            window.location.href = '/Mobile/Users/LoginForm';
	        } else {
	            return response.json(); // 다른 정상 응답 처리
	        }
	    })
		.then(data => {
		    console.log('datais_idx:', data);
		    if (data) {
		      LikeDown(data, likeElement);
		    }else{		    	
		   LikeUp(likeElement); 	
		    }
		})
		.catch(error => {
			 LikeUp(likeElement); 
		});				
	
	
	
	
}

//2. 좋아요가 없다면  
function LikeUp(likeElement) {	
	const store_idx = likeElement.getAttribute('data-store-idx');
	const content = {
		    store_idx: store_idx 
		};
	
		fetch(`/Popup/Mobile/Like/Write`, {
		    method: 'POST', // POST 요청
		    headers: {
		        'Content-Type': 'application/json', // JSON 데이터임을 명시
		    },
		    body: JSON.stringify(content), // 객체를 JSON 문자열로 변환하여 전송
		})
	    .then(response => {
	        if (response.status === 401) {
	            // 리다이렉션 처리
	            window.location.href = '/Mobile/Users/LoginForm';
	        } else {
	            return response.json(); // 다른 정상 응답 처리
	        }
	    })
		.then(data => {
		    console.log('data:', data);
		    if (data) {
		        // 서버에서 반환한 데이터 처리
		        console.log('처리 결과:', data);
		        const imgElement = likeElement.querySelector('img');

	            // img 요소의 src 속성 변경
	            if (imgElement) {
	                imgElement.src = '/images/detail/heart.svg'; // 원하는 이미지 경로로 변경
	            }
		        const LikeCount = data
		        document.getElementById('like-count').innerHTML = LikeCount;
		        
		    }
		})
		.catch(error => {
		    console.error('좋아요 내역이 없습니다', error);
		});				
}
//3.좋아요를 했다면
function LikeDown(ls_idx, likeElement) {	
	const store_idx = likeElement.getAttribute('data-store-idx');
	const content = {
			ls_idx: ls_idx,
		    store_idx: store_idx 
		};
	
		fetch(`/Popup/Like/Delete`, {
		    method: 'DELETE', 
		    headers: {
		        'Content-Type': 'application/json', // JSON 데이터임을 명시
		    },
		    body: JSON.stringify(content), // 객체를 JSON 문자열로 변환하여 전송
		})
		.then(response => {
		    if (!response.ok) {
		        throw new Error(`HTTP error! status: ${response.status}`);
		    }
		    return response.json();
		})
		.then(data => {
		    console.log('data:', data);
		    
		        // 서버에서 반환한 데이터 처리
		        console.log('처리 결과:', data);
		        const imgElement = likeElement.querySelector('img');

	            // img 요소의 src 속성 변경
	            if (imgElement) {
	                imgElement.src = '/images/detail/noHeart.svg'; // 원하는 이미지 경로로 변경
	            }
		        const LikeCount = data
		        document.getElementById('like-count').innerHTML = LikeCount;		        
		   
		})
		.catch(error => {
		    console.error('좋아요 내역이 없습니다', error);
		});				
}    
</script>
<script>
function bookConfig(bookmarkElement) {
const store_idx = bookmarkElement.getAttribute('data-store-idx');
    const content = {
        store_idx: store_idx 
    };

    fetch(`/Popup/Mobile/Bookmark/Config`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (response.status === 401) {
            // 리다이렉션 처리
            window.location.href = '/Mobile/Users/LoginForm';
        } else {
            return response.json(); // 다른 정상 응답 처리
        }
    })
    .then(data => {
        console.log('BOOKMARK_IDX:', data);
        if (data) {
            BookmarkDown(data, bookmarkElement);
        } else {
            BookmarkUp(bookmarkElement);
        }
    })
    .catch(error => {
        BookmarkUp(bookmarkElement); 
    });
}

function BookmarkUp(bookmarkElement) {
	const store_idx = bookmarkElement.getAttribute('data-store-idx');
    const content = {
        store_idx: store_idx 
    };

    fetch(`/Popup/Mobile/Bookmark/Write`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (response.status === 401) {
            // 리다이렉션 처리
            window.location.href = '/Mobile/Users/LoginForm';
        } else {
            return response.json(); // 다른 정상 응답 처리
        }
    })
    .then(data => {
        console.log('data:', data);
        if (data) {
            // bookmarkElement의 자식 img 요소 찾기
            const imgElement = bookmarkElement.querySelector('img');

            // img 요소의 src 속성 변경
            if (imgElement) {
                imgElement.src = '/images/detail/star.svg'; // 원하는 이미지 경로로 변경
            }

            bookmarkElement.classList.add('bookmark-on');
        }
    })
    .catch(error => {
        console.error('에러발생', error);
    });
}

function BookmarkDown(data, bookmarkElement) {
    console.log('북마크 삭제: BOOKMARK_IDX', data);
    const content = {
        bookmark_idx: data 
    };

    fetch(`/Popup/Bookmark/Delete`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json(); // 응답을 JSON으로 변환
    })
    .then(data => {
        console.log('삭제 상태 data:', data);
        // bookmarkElement의 자식 img 요소 찾기
        const imgElement = bookmarkElement.querySelector('img');

        // img 요소의 src 속성 변경
        if (imgElement) {
            imgElement.src = '/images/detail/noStar.svg'; // 원하는 이미지 경로로 변경
        }
        bookmarkElement.classList.remove('bookmark-on'); // 북마크 상태 제거
    })
    .catch(error => {
        console.error('북마크 내역이 없습니다', error);
    });
}
function bookmarkconfigg(){	
	const content = {
		    store_idx: store_idx 
		};
		fetch(`/Popup/Bookmark/Config`, {
		    method: 'POST', // POST 요청
		    headers: {
		        'Content-Type': 'application/json', // JSON 데이터임을 명시
		    },
		    body: JSON.stringify(content), // 객체를 JSON 문자열로 변환하여 전송
		})
		.then(response => {
		    if (!response.ok) {
		        alert('확인확인')
		    }
		    return response.json();
		})
		.then(data => {
		    console.log('BOOKMARK_IDX:', data);
		    if (data) {
		    	 bookmarkElement.classList.add('bookmark-on');    
		    }
		})
		.catch(error => {
			
		});						
}

bookmarkconfigg();

</script>

</html>