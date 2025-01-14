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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
    width: 300px;
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
    width: 600px;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.popup-info {
    font-size: 35px;
    line-height: 2;
    width: 600px;
}

.popup-location,
.popup-date {
    overflow: hidden; /* 넘치는 내용 숨김 */
    white-space: nowrap; /* 줄 바꿈 방지 */
    text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
    width: 100%; /* 부모 요소에 맞춰 너비 설정 */
    display: block; /* 블록 요소로 변경 */
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
            <span class="likebtn"  data-store-idx="${popup.store_idx}"  onclick="event.preventDefault(); event.stopPropagation(); LikeConfig(this);"><img src="/images/detail/noHeart.svg" class="heartimg"> <span class="like-count">${popup.like_count}</span></span>
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
                        <span class="share" onclick="event.preventDefault(); event.stopPropagation(); clipboard(window.location.href);">
                        <!--  onShare('${popup.title}', '${popup.start_date} ~ ${popup.end_date}', '${popup.image_path}', '${popup.store_idx}')" -->
                        	<img src="/images/detail/share.svg"> 공유하기
                    	</span>
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
                            "<span class='likebtn' data-store-idx='" + a.store_idx + "' onclick='event.preventDefault(); event.stopPropagation(); LikeConfig(this);'>" +
                                "<img src='/images/detail/noHeart.svg' class='heartimg'> " + 
                                "<span class='like-count'>" + a.like_count + "</span>" +
                            "</span>" +
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
                                    "<span class='bookmark' data-store-idx='" + a.store_idx + "' onclick='event.preventDefault(); event.stopPropagation(); bookConfig(this);'>" +
                                        "<img src='/images/detail/noStar.svg'> 찜하기" +
                                    "</span> | " +
                                    "<span class='share' onclick='event.preventDefault(); event.stopPropagation(); bookmark(window.location.href)'>" +
                                        "<img src='/images/detail/share.svg'> 공유하기" +
                                    "</span>" +
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
document.addEventListener("DOMContentLoaded", () => {
    // 모든 좋아요 버튼에 대해 LikeConfig 실행 (상태 확인만)
    const likeButtons = document.querySelectorAll('.likebtn');
    likeButtons.forEach(button => {
        LikeConfig(button);  // 페이지 로드 시 상태 확인만 실행
    });

    // 좋아요 버튼 클릭 시 처리
    likeButtons.forEach(button => {
        button.addEventListener('click', () => {
            // 좋아요 상태를 클릭 시에만 토글
            toggleLike(button);
        });
    });
});

function LikeConfig(likeElement) {
    const store_idx = likeElement.getAttribute('data-store-idx');

    const content = {
        store_idx: store_idx
    };

    fetch(`/Popup/Mobile/Like/Config`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(content),
    })
    .then(response => {
	    if (!response.ok) {
	        // 상태 코드가 2xx가 아닐 경우 오류 처리
	        return response.text().then(text => {
	            throw new Error(`로그인 실패: ${text}`);
	        });
	    }
	    
	    // 응답 본문이 비어있지 않은지 확인
	    return response.json().catch(err => {
	        // JSON 변환 실패 시 처리
	        return null; // null 반환
	    });
	})
    .then(data => {
        // data가 null인 경우는 좋아요가 안 눌려져 있는 상태로 처리
        if (data == null) {
        	const imgElement = likeElement.querySelector('img');
            imgElement.src = '/images/detail/noHeart.svg';
        } else {
        	const imgElement = likeElement.querySelector('img');
            imgElement.src = '/images/detail/heart.svg';
        }
    })
    .catch(error => {
        console.error('에러:', error);
    });
}

// 좋아요 상태를 변경하는 함수 (클릭 시 호출됨)
function toggleLike(likeElement) {
    const store_idx = likeElement.getAttribute('data-store-idx');
    const content = { store_idx: store_idx };

    // 서버에서 좋아요 상태를 가져옴
    fetch(`/Popup/Mobile/Like/Config`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (response.status === 401) {
            window.location.href = '/Mobile/Users/LoginForm';
        } else {
            // 응답 본문이 비어있지 않은지 확인
            return response.json().catch(err => {
                // JSON 변환 실패 시 처리
                return null; // null 반환
            });
        }
    })
    .then(data => {
        if (data == null) {
            // 좋아요가 안 눌린 상태이면 좋아요 추가
            LikeUp(likeElement);
        } else {
            // 이미 좋아요가 눌린 상태이면 좋아요 취소
            LikeDown(data, likeElement);
        }
    })
    .catch(error => {
        console.error('좋아요 상태 확인 실패:', error);
    });
}

// 좋아요 추가
function LikeUp(likeElement) {
    const store_idx = likeElement.getAttribute('data-store-idx');
    const content = { store_idx: store_idx };

    fetch(`/Popup/Mobile/Like/Write`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (response.status === 401) {
            window.location.href = '/Mobile/Users/LoginForm';
        } else {
            return response.json();
        }
    })
    .then(data => {
        if (data) {
            const imgElement = likeElement.querySelector('img');
            if (imgElement) imgElement.src = '/images/detail/heart.svg';

            const likeCountElement = likeElement.querySelector('.like-count');
            if (likeCountElement) likeCountElement.textContent = data;
        }
    })
    .catch(error => console.error('좋아요 처리 실패:', error));
}

// 좋아요 취소
function LikeDown(ls_idx, likeElement) {
    const store_idx = likeElement.getAttribute('data-store-idx');
    const content = { ls_idx: ls_idx, store_idx: store_idx };

    fetch(`/Popup/Like/Delete`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        return response.json();
    })
    .then(data => {
        const imgElement = likeElement.querySelector('img');
        if (imgElement) imgElement.src = '/images/detail/noHeart.svg';

        const likeCountElement = likeElement.querySelector('.like-count');
        if (likeCountElement) likeCountElement.textContent = data;
    })
    .catch(error => console.error('좋아요 삭제 실패:', error));
}
</script>
<script>

document.addEventListener("DOMContentLoaded", () => {
    // 모든 좋아요 버튼에 대해 LikeConfig 실행 (상태 확인만)
    const bookmarkButtons = document.querySelectorAll('.bookmark');
    bookmarkButtons.forEach(button => {
    	bookConfig(button);  // 페이지 로드 시 상태 확인만 실행
    });

    // 좋아요 버튼 클릭 시 처리
    bookmarkButtons.forEach(button => {
        button.addEventListener('click', () => {
            // 좋아요 상태를 클릭 시에만 토글
            toggleBookmark(button);
        });
    });
});

function bookConfig(bookmarkElement) {
    const store_idx = bookmarkElement.getAttribute('data-store-idx');

    const content = {
        store_idx: store_idx
    };

    fetch(`/Popup/Mobile/Bookmark/Config`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(content),
    })
    .then(response => {
	    if (!response.ok) {
	        // 상태 코드가 2xx가 아닐 경우 오류 처리
	        return response.text().then(text => {
	            throw new Error(`로그인 실패: ${text}`);
	        });
	    }
	    
	    // 응답 본문이 비어있지 않은지 확인
	    return response.json().catch(err => {
	        // JSON 변환 실패 시 처리
	        return null; // null 반환
	    });
	})
    .then(data => {
        // data가 null인 경우는 좋아요가 안 눌려져 있는 상태로 처리
        if (data == null) {
        	const imgElement = bookmarkElement.querySelector('img');
            imgElement.src = '/images/detail/noStar.svg';
        } else {
        	const imgElement = bookmarkElement.querySelector('img');
            imgElement.src = '/images/detail/star.svg';
        }
    })
    .catch(error => {
        console.error('에러:', error);
    });
}
//좋아요 상태를 변경하는 함수 (클릭 시 호출됨)
function toggleBookmark(bookmarkElement) {
    const store_idx = bookmarkElement.getAttribute('data-store-idx');
    const content = { store_idx: store_idx };

    // 서버에서 좋아요 상태를 가져옴
    fetch(`/Popup/Mobile/Bookmark/Config`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(content),
    })
    .then(response => {
        if (response.status === 401) {
            window.location.href = '/Mobile/Users/LoginForm';
        } else {
            // 응답 본문이 비어있지 않은지 확인
            return response.json().catch(err => {
                // JSON 변환 실패 시 처리
                return null; // null 반환
            });
        }
    })
    .then(data => {
        if (data == null) {
            // 좋아요가 안 눌린 상태이면 좋아요 추가
            BookmarkUp(bookmarkElement);
        } else {
            // 이미 좋아요가 눌린 상태이면 좋아요 취소
            BookmarkDown(data, bookmarkElement);
        }
    })
    .catch(error => {
        console.error('좋아요 상태 확인 실패:', error);
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

</script>
<script>
function clipboard(text) {
    navigator.clipboard.writeText(text)
        .then(() => {
            console.log('클립보드에 복사되었습니다:', text);
            alert('클립보드에 복사되었습니다: ' + text);
        })
        .catch(err => {
            console.error('클립보드 복사 실패:', err);
            alert('클립보드 복사에 실패했습니다. 다시 시도해주세요');
        });
}
</script>
<!-- <script>
    // Kakao SDK 초기화
    Kakao.init('4c54ad5ba758bf789727f818ba5af518'); // Replace with your actual JavaScript Key
    console.log(Kakao.isInitialized()); // 초기화 확인

    function onShare(title, description, imagePath, storeIdx) {
        if (!Kakao.isInitialized()) {
            alert('Kakao SDK가 초기화되지 않았습니다.');
            return;
        }

        const imageUrl = `http://localhost:9090/image/read?path=\${encodeURIComponent(imagePath)}`;
        const linkUrl = `http://localhost:9090/Popup/StoreDetails?store_idx=\${storeIdx}`;

        Kakao.Link.sendDefault({
            objectType: 'feed',
            content: {
                title: title,
                description: description,
                imageUrl: imageUrl,
                link: {
                    mobileWebUrl: linkUrl,
                    webUrl: linkUrl,
                },
            },
            buttons: [
                {
                    title: '상세보기',
                    link: {
                        mobileWebUrl: linkUrl,
                        webUrl: linkUrl,
                    },
                },
            ],
        })
        .then(() => {
            console.log('공유 성공');
        })
        .catch((err) => {
            console.error('공유 실패', err);
        });
    }
</script> -->

</html>