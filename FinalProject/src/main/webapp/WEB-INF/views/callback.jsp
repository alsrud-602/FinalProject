<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Login Callback</title>
    <style>
    * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    display: flex;
    width: 100vw;
    height: 100vh;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background: #252525;
}

.loader {
    position: absolute;
    width: 100px;
    height: 100px;
    transform: rotate(45deg);
    -o-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
    animation: scale-loader 1s cubic-bezier(0.12, 0.01, 1, 1)infinite;
    -o-animation: scale-loader 1s cubic-bezier(0.12, 0.01, 1, 1)infinite;
    -moz-animation: scale-loader 1s cubic-bezier(0.12, 0.01, 1, 1)infinite;
    -webkit-animation: scale-loader 1s cubic-bezier(0.12, 0.01, 1, 1)infinite;
}

.loader span {
    position: absolute;
    width: 50px;
    height: 50px;
    animation: rotate-loader-span 1s cubic-bezier(0.12, 0.01, 1, 1) infinite;
    -o-animation: rotate-loader-span 1s cubic-bezier(0.12, 0.01, 1, 1) infinite;
    -moz-animation: rotate-loader-span 1s cubic-bezier(0.12, 0.01, 1, 1) infinite;
    -webkit-animation: rotate-loader-span 1s cubic-bezier(0.12, 0.01, 1, 1) infinite;
}

.loader span:nth-child(1) {
    background: #F79F1F;
    top: 0;
    left: 0;
}

.loader span:nth-child(2) {
    background: #12CBC4;
    top: 0;
    right: 0;
}

.loader span:nth-child(3) {
    background: #ED4C67;
    bottom: 0;
    left: 0;
}

.loader span:nth-child(4) {
    background: #A3CB38;
    bottom: 0;
    right: 0;
}

.loader-title {
    position: absolute;
    top: calc(50% + 118px);
    color: #DDD;
    font-size: 20px;
    font-weight: 600;
    letter-spacing: 5px;
    text-transform: uppercase;
    font-family: 'Courier New', Courier, monospace;
    margin-left: 10px;
}

.loader-title::after {
    content: '|';
    display: inline-block;
    margin-left: 5px;
    animation: blink .7s infinite;
    -o-animation: blink .7s infinite;
    -moz-animation: blink .7s infinite;
    -webkit-animation: blink .7s infinite;
}

@keyframes blink {

    0%,
    100% {
        opacity: 1;
    }

    50% {
        opacity: 0;
    }
}

@keyframes scale-loader {

    0%,
    100% {
        width: 100px;
        height: 100px;
    }

    50% {
        width: 150px;
        height: 150px;
    }
}

@-o-keyframes scale-loader {

    0%,
    100% {
        width: 100px;
        height: 100px;
    }

    50% {
        width: 150px;
        height: 150px;
    }
}

@-moz-keyframes scale-loader {

    0%,
    100% {
        width: 100px;
        height: 100px;
    }

    50% {
        width: 150px;
        height: 150px;
    }
}

@-webkit-keyframes scale-loader {

    0%,
    100% {
        width: 100px;
        height: 100px;
    }

    50% {
        width: 150px;
        height: 150px;
    }
}

@keyframes rotate-loader-span {
    0% {
        transform: rotate(0deg);
    }

    50%,
    100% {
        transform: rotate(90deg);
    }
}

@-o-keyframes rotate-loader-span {
    0% {
        transform: rotate(0deg);
    }

    50%,
    100% {
        transform: rotate(90deg);
    }
}

@-moz-keyframes rotate-loader-span {
    0% {
        transform: rotate(0deg);
    }

    50%,
    100% {
        transform: rotate(90deg);
    }
}

@-webkit-keyframes rotate-loader-span {
    0% {
        transform: rotate(0deg);
    }

    50%,
    100% {
        transform: rotate(90deg);
    }
}
    </style>
</head>
<body>
    <div class="loader">
   <span></span>
   <span></span>
   <span></span>
   <span></span>
</div>

<div class="loader-title">잠시만 기다려 주세요 ...</div>
</body>
<script>
function typeLoading(el) {
	   const text = el.innerHTML.split("");
	   el.innerHTML = "";
	   text.forEach(
	      (letter, i) => {
	         setTimeout(() => el.innerHTML += letter, 200 * i);
	      }
	   );
	}

	const title = document.querySelector(".loader-title");
	typeLoading(title);
</script>
    <script>
    const token = "${token}";
    const expirationTime = Date.now() + 24 * 60 * 60 * 1000; // 24시간 후

    if (token) {
        localStorage.setItem('kakaoAccessToken', token);
        localStorage.setItem('kakaoTokenExpiration', expirationTime); // localStorage에 저장
        console.log('JWT가 localStorage에 저장되었습니다:', token);
    }

 // 사용자 에이전트를 확인하여 리다이렉트 경로 설정
    const userAgent = navigator.userAgent;
    let redirectPath;

    if (userAgent.includes('wv')|| userAgent.includes('Dart')) {
        redirectPath = '/Mobile/Users/Main'; // 모바일 사용자 경로
    } else {
        redirectPath = '/'; // 데스크톱 사용자 경로
    }

    // 리다이렉트
    window.location.href = redirectPath;
    </script>
</html>