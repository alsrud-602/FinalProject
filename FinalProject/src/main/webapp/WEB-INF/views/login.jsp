<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>POP CORN - 로그인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/common.css" />
    <style type="text/css">
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
            padding: 40px;
            width: 400px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            border: 4px solid #00FF84;
        }

        ._32 {
        	width: 300px;
        	height: auto;
        	margin: 0 auto; /* 가운데 정렬 */
            margin-bottom: 20px;
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
            color: #000000;
            font-size: 18px;
            font-weight:bold;
            cursor: pointer;
            margin: 20px 0;
        }

        .link {
            color: #ffffff;
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
    <%@include file="/WEB-INF/include/header.jsp" %>
    <main>
        <div class="user-login">
            <a href="/"><img class="_32" src="/images/mainlogo.png" /></a>
<form id="loginForm">
    <input type="text" id="id" name="id" placeholder="아이디" />
    <input type="password" id="password" name="password" placeholder="비밀번호" />
    <button type="submit">로그인</button>
    <c:if test="${param.error != null}">
        <p style="color: red;">아이디 또는 비밀번호가 잘못되었습니다.</p>
    </c:if>
</form>
            <div class="sub-login">
            <a href="#" class="link">아이디 찾기</a> |
            <a href="#" class="link">비밀번호 찾기</a> |
            <a href="#" class="link">회원가입</a>
            </div>
        </div>
<script type="text/javascript">
document.getElementById('loginForm').addEventListener('submit', async function(event) {
    event.preventDefault();

    const id = document.getElementById('id').value.trim();
    const password = document.getElementById('password').value.trim();

    if (!id || !password) {
        alert('아이디와 비밀번호를 입력해주세요.');
        return;
    }

    try {
        const response = await fetch('/Users/Login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ id, password }),
        });

        if (!response.ok) {
            alert('아이디 또는 비밀번호가 잘못되었습니다.');
            return;
        }

        const data = await response.json();
        if (data.token) {
            localStorage.setItem('token', data.token);
            window.location.href = '/';
        } else {
            alert('로그인에 실패했습니다.');
        }
    } catch (error) {
        console.error('로그인 요청 중 오류:', error);
        alert('로그인 중 문제가 발생했습니다.');
    }
});

</script>
    </main>
    <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>