<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>POP CORN.biz - 로그인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/common-company.css" />
    <style type="text/css">
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            height: 75vh;
        }

        .user-login {
            border-radius: 10px;
            padding: 40px;
            width: 400px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            border: 2px solid #121212;
        }

        h2 {
        	width: 300px;
        	height: auto;
        	margin: 0 auto; /* 가운데 정렬 */
            margin-bottom: 20px;
            font-size: 40px;
            color: #00FF84;
        }

        input[name="id"] {
            width: 100%;
            padding: 17px;
            border: 1px solid #121212;
            border-radius: 5px 5px 0 0;
            background-color: #ffffff;
        }
        
        input[name="password"] {
            width: 100%;
            padding: 17px;
            border: 1px solid #121212;
            border-radius: 0px 0px 5px 5px;
            background-color: #ffffff;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #00FF84; /* 초록색 */
            border: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight:bold;
            cursor: pointer;
            margin: 20px 0;
        }

        .link {
            font-size: 14px;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }
        .sub-login{
        	
        }
    </style>
</head>

<body>
    <%@include file="/WEB-INF/include/header_company.jsp" %>
    <main>
        <div class="user-login">
            <a href="/Business"><h2>POPCORN.Biz</h2></a>
<form id="loginForm">
    <input type="text" id="id" name="id" placeholder="아이디" />
    <input type="password" id="password" name="password" placeholder="비밀번호" />
    <button type="submit">로그인</button>
    <c:if test="${param.error != null}">
        <p style="color: red;">아이디 또는 비밀번호가 잘못되었습니다.</p>
    </c:if>
    <c:if test="${param.error == 'expired'}">
    	<p style="color: aqua;">세션이 만료되었습니다. 다시 로그인해주세요.</p>
	</c:if>
    <div id="errorMessages" style="color: red;"></div>
    <c:if test="${not empty message}">
    <div class="alert alert-warning" style="color: aqua;">${message}</div>
	</c:if>
</form>
            <div class="sub-login">
            <a href="#" class="link">아이디 찾기</a> |
            <a href="#" class="link">비밀번호 찾기</a> |
            <a href="#" class="link">회원가입</a>
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

    fetch('/CompanyAuth/Login', {
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
            alert('로그인 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.');
            return;
        }

        return response.json(); // JSON 응답 파싱
    })
    .then(function(data) {
        if (data && data.companyJwt) {
            // JWT 토큰 저장
            // 로그인 성공 후, JWT를 Authorization 헤더에 추가
            const expirationTime = Date.now() + 10 * 60 * 60 * 1000; // 10시간 후
			localStorage.setItem('companyJwt', data.companyJwt);
			localStorage.setItem('companyJwtExpiration', expirationTime);
            console.log('JWT 토큰 저장 완료:', data.companyJwt);

            // 홈 화면으로 리다이렉션
            window.location.href = '/Business/Operation/View';
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
        alert('로그인 중 문제가 발생했습니다.');
    });
});
</script>
    </main>
    <%@include file="/WEB-INF/include/footer_company.jsp" %>
</body>
</html>