<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>POP CORN - 로그인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/mobile-common.css" />
<style>
    main {
        background-color: #121212;
        color: #ffffff;
        font-family: "Pretendard", sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 75vh;
    }

    .user-login {
        background-color: #121212;
        border-radius: 10px;
        padding: 60px; /* 패딩을 늘림 */
        width: 800px; /* 너비를 늘림 */
        height: auto; /* 높이를 늘림 */
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        text-align: center;
        border: 4px solid #00FF84;
    }

    ._32 {
        width: 550px; /* 너비를 늘림 */
        height: auto;
        margin: 0 auto; /* 가운데 정렬 */
        margin-bottom: 30px; /* 마진을 늘림 */
    }

    input[name="id"], input[name="password"] {
        width: 100%;
        padding: 40px; /* 패딩을 늘림 */
        border: 1px solid #121212;
        border-radius: 5px;
        background-color: #ffffff;
        font-size:40px;
    }

    button {
        width: 100%;
        padding: 40px; /* 패딩을 늘림 */
        background-color: #00FF84; /* 초록색 */
        border: none;
        border-radius: 12px;
        color: #000000;
        font-size: 40px; /* 폰트 크기를 늘림 */
        font-weight: bold;
        cursor: pointer;
        margin: 12px 0; /* 마진을 늘림 */
    }

    .link {
        color: black;
        font-size: 40px; /* 폰트 크기를 늘림 */
        text-decoration: none;
    }

    .link:hover {
        text-decoration: underline;
    }
    
    .sub-login {
        margin-top: 25px; /* 마진을 늘림 */
        width: 100%;
        padding: 40px; /* 패딩을 늘림 */
        background-color: white; /* 초록색 */
        border: none;
        border-radius: 12px;
        font-weight: bold;
        cursor: pointer;
        margin: 40px 0 0 0; /* 마진을 늘림 */
    }
    
    .kakaoLogin {
        width: 100%; /* 너비를 늘림 */
        height: 130px; /* 높이를 늘림 */
    }

    /* 모바일 화면 (768px 이하) */
    @media (max-width: 768px) {

    }
    #noneLogin{
    
    margin-top: 10px;}
    </style>
</head>

<body>
    <main>
        <div class="user-login">
            <a href="/Mobile/Users/Main"><img class="_32" src="/images/mainlogo.png" /></a>
<form id="loginForm">
    <input type="text" id="id" name="id" placeholder="아이디" />
    <input type="password" id="password" name="password" placeholder="비밀번호" />
    <div id="noneLogin">
    <div id="errorMessages" style="color: red; font-size: 40px;"></div>
    <c:if test="${param.error == 'expired'}">
    	<p style="color: aqua;">세션이 만료되었습니다. 다시 로그인해주세요.</p>
	</c:if>
    <c:if test="${not empty message}">
    <div class="alert alert-warning" style="color: aqua;">${message}</div>
	</c:if>
	</div>
    <button type="submit">로그인</button>
</form>
<a href="/oauth2/authorization/kakao" id="kakaoLogin"><img src="/images/header/kakao_login_large_wide.png" class="kakaoLogin"></a>
            <div class="sub-login">
            <a href="/Mobile/Users/SignupForm" class="link">회원가입</a>
            </div>

        </div>

<script type="text/javascript">
document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const id = document.getElementById('id').value.trim();
    const password = document.getElementById('password').value.trim();

    if (!id || !password) {
        alert('아이디와 비밀번호를 입력해주세요.');
        return;
    }

    fetch('/Mobile/Users/Login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: id, password: password })
    })
    .then(function(response) {
        if (response.status === 401) {
            const errorMessages = [];
            errorMessages.push("아이디 또는 비밀번호가 잘못되었습니다.");

            const errorMessagesDiv = document.getElementById('errorMessages');
            errorMessagesDiv.innerHTML = ''; // 이전 메시지 제거
            if (errorMessages.length > 0) {
                errorMessages.forEach(function(message) {
                    const p = document.createElement('p');
                    p.textContent = message;
                    errorMessagesDiv.appendChild(p);
                });
            }
            return;
        }

        if (!response.ok) {
            console.error('오류 상태 코드:', response.status);
            return;
        }

        return response.json(); // JSON 응답 파싱
    })
    .then(function(data) {
        if (data || data.userJwt) {
            // JWT 토큰 저장
            // 로그인 성공 후, JWT를 Authorization 헤더에 추가
			const expirationTime = Date.now() + 10 * 60 * 60 * 1000; // 10시간 후
			localStorage.setItem('userJwt', data.userJwt);
			localStorage.setItem('userJwtExpiration', expirationTime);
            console.log('JWT 토큰 저장 완료:', data.userJwt);

            if (data.redirect) {
    			const expirationTime = Date.now() + 24 * 60 * 60 * 1000; // 24시간 후
    			localStorage.setItem('adminjwt', data.adminjwt);
    			localStorage.setItem('userJwtExpiration', expirationTime);
                window.location.href = data.redirect;
            } else {
                // Regular user, redirect to home
                window.location.href = '/Mobile/Users/Main';
            }
        } else {
            if (data === undefined) {
                const errorMessages = [];
                errorMessages.push("아이디 또는 비밀번호가 잘못되었습니다.");

                const errorMessagesDiv = document.getElementById('errorMessages');
                errorMessagesDiv.innerHTML = ''; // 이전 메시지 제거
                if (errorMessages.length > 0) {
                    errorMessages.forEach(function(message) {
                        const p = document.createElement('p');
                        p.textContent = message;
                        errorMessagesDiv.appendChild(p);
                    });
                }
                return;
            }else {
            alert('로그인에 실패했습니다. 서버 응답을 확인하세요.');
            console.error('서버 응답 데이터:', data);
            }
        }
    })
    .catch(function(error) {
        console.error('로그인 요청 중 오류:', error);
    });
});

window.onload = function() {
    console.log('window.onload 실행됨'); // 디버깅 로그 추가
    const params = new URLSearchParams(window.location.search);
    const code = params.get('code'); // 인가 코드 가져오기

    console.log('인가 코드:', code); // 인가 코드 로그 추가

    if (code) {
        // 액세스 토큰 요청
        fetch('http://localhost:9090/Mobile/oauth2/callback/kakao?code=' + code)
            .then(response => {
                console.log('응답:', response); // 응답 로그 추가
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('Failed to fetch access token');
                }
            })
            .then(data => {
                const accessToken = data.access_token; // 백엔드에서 반환한 토큰
                const expirationTime = Date.now() + 24 * 60 * 60 * 1000; // 24시간 후
                localStorage.setItem('kakaoTokenExpiration', expirationTime); // localStorage에 저장
                localStorage.setItem('kakaoAccessToken', accessToken); // localStorage에 저장
                console.log('토큰이 localStorage에 저장되었습니다:', accessToken);
                // 홈 화면으로 리다이렉트 (필요 시)
                window.location.href = "/Mobile/Users/Main";
            })
            .catch(error => {
                console.error('토큰 요청 실패:', error);
            });
    } else {
        console.log('인가 코드가 없습니다.');
    }
};

</script>





    </main>
</body>
</html>