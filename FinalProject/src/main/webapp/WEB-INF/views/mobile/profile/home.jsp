<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap" rel="stylesheet">
<style>

main {
  background-color:#121212;
  padding-bottom:400px;
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
  color:#00FF84;
  font-size:96px;
  margin-top:80px;
  text-align: center;
}

.myinfo {
  margin-top:40px;
  padding-left:40px;
}

.infotitle {
  color:#767676;
  font-size:64px;
  font-weight:900;
}

.infocontent {
  color:white;
  font-size:96px;
  font-weight:800;
  margin-top:10px;
}

.liner {
  align-self: stretch;
  height: 0px;
  border: 1px #a2a2a2 solid;
  width:1000px;
  margin-top:15px;
}

.category {
  display:flex;
  gap:18px;
  margin-top:80px;
  flex-wrap:wrap;
  max-width:1000px;
}


.categories {
  display: flex;
  color: #9f9f9f;
  border: 1px solid rgba(159, 159, 159, 0.5);
  width: fit-content;
  font-size: 69px;
  border-radius: 7px;
  height: 170px;
  align-items: center;
  justify-content: center;
  font-weight: 800;
  padding: 40px;
  cursor: pointer; /* 클릭 가능한 요소임을 나타내기 위해 추가 */
  transition: all 0.3s ease; /* 부드러운 전환 효과 */
}

.categories.active {
  background-color: #00ff84;
  color: black;
}

.categories:hover {
  background-color: rgba(0, 255, 132, 0.2); /* 호버 시 약간의 배경색 변경 */
}

.btn {
  display:flex;
  justify-content:center;
  gap:20px;
  margin-top:300px;
}

.btn-update {
  width:332px;
  height: 203px;
  border:1px solid white;
  border-radius:40px;
  font-size:64px;
  background-color:#00FF84;
  color:black;
  font-weight:800;
  
}

.btn-quit {
  width:332px;
  height:203px;
  border:1px solid #ff5656;
  border-radius:40px;
  font-size:64px;
  background-color:#ff5656;
  color:black;
  font-weight:800;
  
}

.btn-block {
  width:100%;
  height:100%;
  display:flex;
  justify-content:center;
  align-items:center;
}

@import url(https://fonts.googleapis.com/css?family=Roboto:400,300);


button:focus { outline: none; }

button:hover { opacity: .8; }

.fa { 
    font-size: 50px;
    color: black;
    transition: 1s all ease 1s;
    font-weight: bolder;
}


#pool {
  background: none;
}

.button-wrapper {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-transform-origin: 50% 50%;
  -ms-transform-origin: 50% 50%;
  transform-origin: 50% 50%;
  transition: 1.25s all ease .9s;
}

#pool button {
  width: 200px;
  height: 200px;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  z-index: 4;
  position: relative;
  transition: 1.25s all ease .1s;

}

.main-button {
  background: #00FF84;
  -webkit-align-self: flex-end;
  -ms-flex-item-align: end;
  align-self: flex-end;
}

.layer {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  width: 54px;
  height: 54px;
  background: #121212;
  border-radius: 50%;
  z-index: -99;
  pointer-events: none;
  transition: 1.25s all ease .5s;
}

    /*déplacement btn i*/
.button-wrapper.clicked {
  -webkit-transform: rotate(90deg) translateY(-96px);
  -ms-transform: rotate(90deg) translateY(-96px);
  transform: rotate(180deg) translateY(-20px) translateX(20px);
  right: 0;
  bottom: 0;
  -webkit-transition: .3s all ease .6s;
  transition: .3s all ease .6s;
}

.button-wrapper.clicked .main-button {
  opacity: 0;
  -webkit-transition: .3s all ease .3s;
  transition: .3s all ease .3s;
}

/*déclencheur layer*/
.button-wrapper.clicked .layer {
  -webkit-transform: scale(100);
  -ms-transform: scale(100);
  transform: scale(100);
  -webkit-transition: 2.25s all ease .9s;
  transition: 1.25s all ease .9s;
}
    
.layered-content {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
  -ms-flex-pack: center;
  justify-content: center;
  opacity: 0;
  transition: 0.7s all ease .3s;
}

.layered-content.active { opacity: 1; }

aside {
  position: fixed; /* 고정 위치 */
  top:80%; /* 페이지 상단에서의 위치 조정 */
  right: 20px; /* 페이지 오른쪽에서의 위치 조정 */
  width: 200px; /* 적절한 너비 설정 */
  height: auto; /* 높이는 자동으로 설정 */
  z-index: 1000; /* 다른 요소 위에 보이도록 설정 */
}
.main-button {
  font-family: "Bagel Fat One", serif;
    display: inline-block;
    position: relative;
    text-transform: uppercase;
    letter-spacing: 2px;
    border: 4px solid transparent;
    border-radius: 8px;
    background-clip: padding-box;
    background-image: linear-gradient(45deg, #f06, #8b5cf6);
    animation: gradientEffect 2s ease-in-out infinite alternate;
}

@keyframes gradientEffect {
    0% {
        background-position: -100% -100%;
    }
    100% {
        background-position: 100% 100%;
    }
}

</style>
</head>
<body>
  <main>
  <div class="inner">
   <div class="container">
   <h2 class="pagetitle">내 정보</h2>
   <div class="myinfo">
    <h3 class="infotitle">이름</h3>
    <p class="infocontent">${user.name}</p>
    <div class="liner"></div>
   </div>
   <div class="myinfo">
    <h3 class="infotitle">닉네임</h3>
    <p class="infocontent">${user.nickname}</p>
    <div class="liner"></div>
   </div>
   <div class="myinfo">
    <h3 class="infotitle">계정정보</h3>
    <p class="infocontent">${user.email}</p>
    <div class="liner"></div>
   </div>
   <div class="myinfo">
    <h3 class="infotitle">연락처</h3>
    <p class="infocontent">${user.phone}</p>
    <div class="liner"></div>
   </div>
   <h2 class="pagetitle"># 관심 카테고리</h2>
   <div class="category">
    <p class="categories" data-category-id="10">패션/뷰티</p>
    <p class="categories" data-category-id="20">가전/디지털</p><p class="categories" data-category-id="30">식물</p>
    <p class="categories" data-category-id="40">키친/리빙</p><p class="categories" data-category-id="50">완구</p>
    <p class="categories" data-category-id="60">레저</p><p class="categories" data-category-id="70">도서/음반</p>
    <p class="categories" data-category-id="80">반려동물</p><p class="categories" data-category-id="90">헬스/스포츠</p>
    <p class="categories" data-category-id="100">연예인</p><p class="categories" data-category-id="110">아이돌</p>
    <p class="categories" data-category-id="120">인플루언서</p><p class="categories" data-category-id="130">캐릭터</p>
    <p class="categories" data-category-id="140">소품/굿즈</p><p class="categories" data-category-id="150">전시</p>
    <p class="categories" data-category-id="160">공공</p><p class="categories" data-category-id="170">기타</p>
    <p class="categories" data-category-id="180">브랜드</p>
   </div>
   <div class="btn">
    <div class="btn-update"><a href="/Mobile/Users/Profile/UpdateProfileForm" class="btn-block">수정</a></div>
    <div class="btn-quit"><a href="/Mobile/Users/Profile/DeleteUser" class="btn-block">회원탈퇴</a></div>
   </div>
   </div>
    <aside>
 <div id="pool">
  <div class="button-wrapper">
    <div class="layer"></div>
    <button class="main-button fa">
<div class="gradient-wrap">
    <span>관심팝업</span>
</div>
    </button>
  </div>
  <div class="layered-content">
    <div class="content">
    </div>
  </div>
</div>

   </aside>
  </div>
  </main>
 <script src="/js/authmobileuser.js" defer></script>
 
 <!-- AJAX 스크립트 -->
<script>
$(document).ready(function() {
    var userIdx = ${userIdx}; // JSP에서 사용자 idx를 JavaScript 변수로 설정
    
    // 페이지 로드 시 사용자의 카테고리 가져오기
    $.ajax({
        url: "/Users/Profile/GetCategories",
        type: "GET",
        data: { userIdx: userIdx },
        success: function(data) {
            data.forEach(function(categoryId) {
                $('.categories[data-category-id="' + categoryId + '"]').addClass('active');
            });
        },
        error: function(xhr, status, error) {
            console.error("카테고리 로드 중 오류 발생:", error);
        }
    });

    // 카테고리 클릭 이벤트
    $('.categories').click(function() {
        var $this = $(this);
        var categoryId = $this.data('category-id');
        
        if ($this.hasClass('active')) {
            // 이미 활성화된 카테고리라면 비활성화하고 삭제
            $this.removeClass('active');
            deleteCategory(userIdx, categoryId);
        } else {
            // 비활성화된 카테고리라면 활성화하고 추가
            $this.addClass('active');
            addCategory(userIdx, categoryId);
        }
    });

function addCategory(userIdx, categoryId) {
    // userIdx와 categoryId가 null인지 확인
    if (userIdx == null || categoryId == null) {
        console.error("userIdx 또는 categoryId가 null입니다.");
        return; // 요청을 보내지 않음
    }

    // userIdx와 categoryId 값을 콘솔에 출력
    console.log("userIdx:", userIdx); // userIdx 값 출력
    console.log("categoryId:", categoryId); // categoryId 값 출력

    $.ajax({
        url: "/Users/Profile/addCategory",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
            userIdx: userIdx,
            categoryId: categoryId
        }),
        success: function(response) {
            if (response === "success") {
                console.log("카테고리가 성공적으로 추가되었습니다.");
            } else {
                console.error("카테고리 추가 실패");
            }
        },
        error: function(xhr, status, error) {
            console.error("카테고리 추가 중 오류 발생:", error);
        }
    });
}

    function deleteCategory(userIdx, categoryId) {
        console.log("userIdx:", userIdx);
        console.log("categoryId:", categoryId);
        $.ajax({
            url: "/Users/Profile/deleteCategory",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                userIdx: userIdx,
                categoryId: categoryId
            }),
            success: function(response) {
                if (response === "success") {
                    console.log("카테고리가 성공적으로 삭제되었습니다.");
                } else {
                    console.error("카테고리 삭제 실패:", response);
                }
            },
            error: function(xhr, status, error) {
                console.error("카테고리 삭제 중 오류 발생:", error);
            }
        });
    }
    // 회원탈퇴 버튼 클릭 이벤트
    $('.btn-quit').click(function(e) {
        e.preventDefault();
        if (confirm('정말로 탈퇴하시겠습니까?')) {
            $.ajax({
                url: "/Mobile/Users/Profile/DeleteUser",
                type: "POST",
                success: function(response) {
                    alert('회원탈퇴가 완료되었습니다.');
                    window.location.href = '/Mobile/Users/LoginForm'; // 홈페이지로 리다이렉트
                },
                error: function(xhr, status, error) {
                    alert('회원탈퇴 중 오류가 발생했습니다.');
                    console.error("Error:", error);
                }
            });
        }
    });
});
</script>
<script>
(function(){
    'use strict';

    var $mainButton = $(".main-button"),
        $buttonWrapper = $(".button-wrapper"),
        $layer = $(".layered-content");

    $mainButton.on("click", function(){
        $buttonWrapper.addClass("clicked").delay(900).queue(function(next){
            $layer.addClass("active");
            next();

            // 애니메이션 후 페이지 이동
            setTimeout(function() {
                // 흐려지는 효과 추가
                $layer.fadeOut(500, function() {
                    window.location.href = '/Mobile/Reservation/Profile/BookMark?user_idx='+${user.userIdx}; // 이동하려는 페이지 URL
                });
            }, 100); // 레이어 활성화 이후 지연 시간 (조정 가능)
        });
    });


})();

</script>
</body>
</html>
