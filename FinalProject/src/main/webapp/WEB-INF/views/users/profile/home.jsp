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
  color:white;
  font-size:58px;
  margin-top:40px;
}

.myinfo {
  margin-top:40px;
  padding-left:40px;
}

.infotitle {
  color:#a2a2a2;
  font-size:32px;
  font-weight:900;
}

.infocontent {
  color:white;
  font-size:40px;
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
  gap:15px;
  margin-top:40px;
  flex-wrap:wrap;
  max-width:1000px;
}

/*
.categories {
  display:flex;
  color:#9f9f9f;
  border:1px solid rgba(159, 159, 159, 0.5);
  width:fit-content;
  font-size:30px;
  border-radius:7px;
  height:44px;
  align-items:center;
  justify-content:center;
  font-weight:800;
  padding:0 15px;
}
*/
.categories {
  display: flex;
  color: #9f9f9f;
  border: 1px solid rgba(159, 159, 159, 0.5);
  width: fit-content;
  font-size: 30px;
  border-radius: 7px;
  height: 44px;
  align-items: center;
  justify-content: center;
  font-weight: 800;
  padding: 0 15px;
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
  gap:10px;
  margin-top:300px;
}

.btn-update {
  width:110px;
  height:55px;
  border:1px solid white;
  border-radius:8px;
  font-size:20px;
  background-color:white;
  color:black;
  font-weight:800;
  
}

.btn-quit {
  width:110px;
  height:55px;
  border:1px solid #ff5656;
  border-radius:8px;
  font-size:20px;
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


</style>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>
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
    <div class="btn-update"><a href="/Users/Profile/UpdateProfileForm" class="btn-block">수정</a></div>
    <div class="btn-quit"><a href="" class="btn-block">회원탈퇴</a></div>
   </div>
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
 <script src="/js/authuser.js" defer></script>
 
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
        if (confirm('레알?')) {
            $.ajax({
                url: "/Users/Profile/DeleteUser",
                type: "POST",
                success: function(response) {
                    alert('회원탈퇴가 완료되었습니다.');
                    window.location.href = '/'; // 홈페이지로 리다이렉트
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
</body>
</html>
