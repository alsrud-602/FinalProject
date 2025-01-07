<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<style>
	.header, .header * {
		box-sizing: border-box;
	}
	
	.header {
	    background: #121212;
	    border-bottom: 1px solid #ebecf1;
	    height: 94px;
	    position: fixed; /* 고정 위치 */
	    top: 0; /* 상단에 고정 */
	    left: 0;
	    right: 0;
	    z-index: 1000; /* 다른 요소들 위에 표시 */
	}

	
	.header-inner {
		position: absolute;
		inset: 0;
	}
	
	.header-nav {
		display: flex;
		gap: 32px;
		align-items: center;
		justify-content: center;
		width: 514px;
		position: absolute;
		left: calc(50% - 257px);
		top: 34px;
	}
	
	.frame-2066, .frame-2067, .frame-2068 {
		display: flex;
		align-items: center;
		gap: 12px;
		
	}
	
	.div1, .div2 {
		color: #ffffff;
		text-align: center;
		font-family: "Pretendard-Black", sans-serif;
		font-size: 18px;
		line-height: 140%;
		font-weight: 900;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.personal-collection, .popcornfactory, .map-2 {
		width: 24px;
		height: 24px;
	}
	
	.popcornfactory {
		width: 24px;
		height: 37.89px;
	}
	
	.header-util {
		display: flex;
		gap: 12px;
		align-items: center;
		justify-content: flex-end;
		position: absolute;
		right: 120px;
		top: 33px;
	}
	
	.div3 {
		color: #ffffff;
		text-align: right;
		font-size: 18px;
		line-height: 140%;
		font-weight: 900;
		display: flex;
		align-items: center;
		cursor: pointer;
	}
	.div3:hover{
		color: #00FF84;
	}
	
	.logo {
		width: 250px;
		height: auto;
		position: absolute;
		left: 10px;
		top: 10px;
	}
	
	.div1:hover, .div2:hover {
		color: #00FF84; /* 초록색 */
	}
	/* 햄버거 아이콘 */
	#hamburger-menu {
		cursor: pointer;
		display: flex;
		justify-content: flex-end;
		position: absolute;
		right: 20px;
		top: -10px;
		width: 50px; /* 클릭 가능한 영역 너비 조정 */
    height: 50px; /* 클릭 가능한 영역 높이 조정 */
	}
	
#hamburger-menu span {
    width: 36px;
    height: 2px;
    background-color: #00FF84; /* 색상 변경 */
    position: absolute;
    margin-right: 4 30px;
    transition: .4s ease-in-out;
    
}

	
	/* 햄버거 닫혔을 때 */
	#hamburger-menu span:nth-child(1) {
		top: 35px;
	}
	
	#hamburger-menu span:nth-child(2) {
		top: 50px;
	}
	
	#hamburger-menu span:nth-child(3) {
		top: 65px;
	}
	
	/* 햄버거 열렸을 때 */
	#hamburger-menu.open span:nth-child(1) {
		top: 50px;
		transform: rotate(135deg);
	}
	
	#hamburger-menu.open span:nth-child(2) {
		opacity: 0;
	}
	
	#hamburger-menu.open span:nth-child(3) {
		top: 50px;
		transform: rotate(-135deg);
	}
	/* 메뉴팝업 */
.menu-popup {
    display: none; /* 기본적으로 숨김 */
    position: fixed; /* 오버레이로 고정 */
    left: 40%; /* 왼쪽에서 50% 위치 */
    transform: translateX(-50%); /* 가로 중앙 정렬 */
    width: 300px; /* 원하는 너비 설정 */
    z-index: 1000; /* 다른 요소들 위에 표시 */
    opacity: 0; /* 초기 투명도 */
    transition: opacity 0.4s ease; /* 서서히 나타나도록 설정 */
    top: 10px;
}
.menu-popup.show {
    display: block; /* 보이게 설정 */
    opacity: 1; /* 완전 불투명 */
}
.group-1000000857,
.group-1000000857 * {
  box-sizing: border-box;
}
.group-1000000857 {
  position: relative;
}
.popover-i-pad-only {
  width: 900px;
  height: 370px;
  position: absolute;
  left: 0px;
  top: 0px;
  backdrop-filter: blur(65px);
}
.background {
  border-width: 2px;
  border-style: solid;
  border-image: linear-gradient(
    180deg,
    rgba(0, 255, 132, 1) 0%,
    rgba(199, 255, 199, 1) 20.499999821186066%,
    rgba(118, 255, 87, 1) 38.499999046325684%,
    rgba(170, 255, 0, 1) 50.49999952316284%,
    rgba(224, 255, 131, 1) 68.00000071525574%,
    rgba(0, 255, 178, 1) 82.99999833106995%,
    rgba(0, 153, 28, 1) 100%
  );
  border-image-slice: 1;
  position: absolute;
  right: 0px;
  left: 0px;
  bottom: 0px;
  top: 0px;
  overflow: hidden;
}
.material {
  position: absolute;
  right: 0px;
  left: 0px;
  bottom: 0px;
  top: 0px;
  overflow: hidden;
}
.thick {
  background: linear-gradient(to left, #202020, #202020),
    linear-gradient(to left, rgba(32, 32, 32, 0.97), rgba(32, 32, 32, 0.97));
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
  backdrop-filter: var(--material-blur-backdrop-filter, blur(25px));
}
.arrow {
  border-radius: 0px;
  width: 47px;
  height: 13px;
  position: absolute;
  right: -47px;
  top: 56px;
  overflow: visible;
}
.material2 {
  position: absolute;
  inset: 0;
}
.material3 {
  width: 13px;
  height: 47px;
  position: absolute;
  left: 939px;
  top: 9px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, 1);
  overflow: hidden;
}
.thick2 {
  background: linear-gradient(to left, #5c5c5c, #5c5c5c),
    linear-gradient(to left, rgba(0, 255, 132, 0.97), rgba(0, 255, 132, 0.97));
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
  backdrop-filter: var(--material-blur-backdrop-filter, blur(25px));
}
.frame-1000000846 {
  padding: 35px 41px 35px 41px;
  display: flex;
  flex-direction: column;
  gap: 21px;
  align-items: flex-start;
  justify-content: flex-start;
  width: 939px;
  height: 379px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.menu-2066 {
  display: flex;
  flex-direction: row;
  gap: var(--var-sds-size-space-300, 12px);
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  position: relative;
}
.personal-collection0 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: relative;
  overflow: visible;
}
.menu-list {
  color: #ffffff;
  text-align: center;
  font-family: "Pretendard-Black", sans-serif;
  font-size: 24px;
  line-height: 140%;
  letter-spacing: -0.025em;
  font-weight: 900;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}
.menu-2067 {
  display: flex;
  flex-direction: row;
  gap: 12px;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  height: 45px;
  position: relative;
}
._6-10 {
  flex-shrink: 0;
  width: 38px;
  height: 60px;
  position: relative;
  object-fit: cover;
}
.menu-2068 {
  display: flex;
  flex-direction: row;
  gap: 12px;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  position: relative;
}
.map-20 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: relative;
  overflow: visible;
}
.menu-2069 {
  display: flex;
  flex-direction: row;
  gap: 12px;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  position: relative;
}
.headset-mic0 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: relative;
  overflow: visible;
}
.menu-2070 {
  display: flex;
  flex-direction: row;
  gap: 12px;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  position: relative;
}
.shopping-mall0 {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  position: relative;
  overflow: visible;
}
	</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/common.css" />

    <header>
        <div class="header">
            <a href="/Users/Main"><img class="logo" src="/images/header/logo.png" alt="로고" /></a>
            <div class="header-nav">
                <a href="/Users/Profile/Home">
                    <div class="frame-2066">
                        <div class="div1">프로필</div>
                        <img class="personal-collection" src="/images/header/personal-collection.svg" alt="프로필 아이콘" />
                    </div>
                </a>
                <a href="/Wallet/Wallet">
                    <div class="frame-2067">
                        <div class="div2">팝콘 팩토리</div>
                        <img class="popcornfactory" src="/images/header/popcornfactory.png" alt="팝콘 팩토리 아이콘" />
                    </div>
                </a>
                <a href="/Users/Map">
                    <div class="frame-2068">
                        <div class="div2">지도</div>
                        <img class="map-2" src="/images/header/map-2.svg" alt="지도 아이콘" />
                    </div>
                </a>
            </div>
<div class="header-util">

</div>

			<div id="hamburger-menu">
				<span></span> 
				<span></span> 
				<span></span>
			</div>
<!-- 메뉴팝업 -->
<div class="menu-popup">
    <div class="frame-1000000846">
        <div class="popover-i-pad-only">
            <div class="background">
                <div class="material">
                    <div class="thick"></div>
                </div>
            </div>
            <img class="arrow0" src="/images/header/arrow0.png" />
        </div>
        <a href="/Users/Profile">
        <div class="menu-2066">
            <img class="personal-collection0" src="/images/header/personal-collection0.svg" />
            <div class="menu-list">프로필</div>
        </div>
        </a>
        <a href="#">
        <div class="menu-2067">
            <img class="_6-10" src="/images/header/popcornfactory.png" />
            <div class="menu-list">팝콘 팩토리</div>
        </div>
        </a>
        <a href="/Users/Map">
        <div class="menu-2068">
            <img class="map-20" src="/images/header/map-2.svg" />
            <div class="menu-list">지도</div>
        </div>
        </a>
        <a href="#">
        <div class="menu-2069">
            <img class="headset-mic0" src="/images/header/headset-mic0.svg" />
            <div class="menu-list">고객센터</div>
        </div>
        </a>
        <a href="#">
        <div class="menu-2070">
            <img class="shopping-mall0" src="/images/header/shopping-mall0.svg" />
            <a href="/Business"><div class="menu-list">비즈니스</div></a>
        </div>
        </a>
    </div>
</div>
		</div>
    </header>

    <script>
    $(document).ready(function() {
        var menuOpen = false;

        // 햄버거 메뉴 클릭
        $("#hamburger-menu").click(function(event) {
            event.stopPropagation();
            $("#hamburger-menu").toggleClass("open");

            if (menuOpen) {
                $(".menu-popup").removeClass("show"); // 서서히 사라지게
                setTimeout(function() {
                    $(".menu-popup").hide(); // 사라진 후 숨김
                }, 400); // CSS transition 시간과 맞추기
            } else {
                $(".menu-popup").show().addClass("show"); // 서서히 나타나게
            }

            menuOpen = !menuOpen;
        });

        // 다른 곳 클릭 시 메뉴 닫기
        $(document).click(function() {
            if (menuOpen) {
                $("#hamburger-menu").removeClass("open");
                $(".menu-popup").removeClass("show"); // 서서히 사라지게
                setTimeout(function() {
                    $(".menu-popup").hide(); // 사라진 후 숨김
                }, 400); // CSS transition 시간과 맞추기
                menuOpen = false;
            }
        });
    });
    
    </script>
    

<script>


 document.addEventListener('DOMContentLoaded', function() {
    const authContent = document.querySelector('.header-util');
    const userJwt = localStorage.getItem('userJwt');
    const userJwtExpiration = localStorage.getItem('userJwtExpiration');
    const kakaoAccessToken = localStorage.getItem('kakaoAccessToken');
    const kakaoTokenExpiration = localStorage.getItem('kakaoTokenExpiration');
    const adminjwt = localStorage.getItem('adminjwt');
    const currentTime = Date.now();
    if (userJwt || kakaoAccessToken || adminjwt) {
        // 토큰이 있는 경우 (인증된 사용자)
        authContent.innerHTML = `
            <form id="logoutForm">
                <div id="logout-button" class="div3">로그아웃</div>
            </form>
        `;
        
        if (currentTime > kakaoTokenExpiration){ 
            localStorage.removeItem('kakaoAccessToken');
            localStorage.removeItem('kakaoTokenExpiration');
        }
        if(currentTime > userJwtExpiration) {
            localStorage.removeItem('userJwt');
            localStorage.removeItem('userJwtExpiration');
        }
        if(currentTime > userJwtExpiration) {
            localStorage.removeItem('adminjwt');
            localStorage.removeItem('userJwtExpiration');
        }
        // 로그아웃 버튼 이벤트 리스너
        document.getElementById('logout-button').addEventListener('click', function() {
            localStorage.removeItem('userJwt');
            localStorage.removeItem('adminjwt');
            localStorage.removeItem('userJwtExpiration');
            localStorage.removeItem('kakaoAccessToken');
            localStorage.removeItem('kakaoTokenExpiration');
            
            window.location.href = '/Users/Logout';
        });
    } else {
        // 토큰이 없는 경우 (인증되지 않은 사용자)
        authContent.innerHTML = `
            <a href="/Users/LoginForm"><div class="div3">로그인</div></a>
            <img class="line-1" src="/images/header/line-1.svg" alt="구분선" />
            <a href="/Users/SignupForm"><div class="div3">회원가입</div></a>
        `;
    }
}); 


</script>
<script>
    /* 로그아웃 */
document.addEventListener('DOMContentLoaded', function() {
    const logoutButton = document.querySelector('#logout-button'); // 수정된 선택자
    if (logoutButton) {
        logoutButton.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 폼 서브미션 방지

            /*
            fetch('/Users/Logout', { method: 'POST' })
                .then(response => {
                    if (response.ok) {
                        localStorage.removeItem('token'); // 토큰 삭제
                        window.location.href = '/'; // 리다이렉션
                    } else {
                        console.error('Failed to log out');
                        alert('로그아웃에 실패했습니다. 다시 시도해주세요.');
                    }
                })
                .catch(error => console.error('Error during logout:', error));*/
            fetch('/Users/Logout', { method: 'POST', credentials: 'include' })
            .then(() => {
                window.location.reload(); // 페이지 새로고침
            })
            .catch(error => console.error('로그아웃 중 오류:', error));
        });
    }
});


    </script>
    