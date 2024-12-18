<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>POP CORN - 로그인</title>
    <link rel="stylesheet" href="/css/common.css" />
<script src="/commonjs/common.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: "Pretendard", sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
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
        	height:150px;
        }

        input[name="user_id"] {
            width: 100%;
            padding: 17px;
            border: 1px solid #121212;
            border-radius: 5px 5px 0 0;
            background-color: #ffffff;
        }
        
        input[name="user_password"] {
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
            <a href="/"><img class="_32" src="/images/_32.png" /></a>
            <input type="text" name="user_id" placeholder="아이디" />
            <input type="password" name="user_password" placeholder="비밀번호" />
            <button onclick="window.location.href='#';">로그인</button>
            <div class="sub-login">
            <a href="#" class="link">아이디 찾기</a> |
            <a href="#" class="link">비밀번호 찾기</a> |
            <a href="#" class="link">회원가입</a>
            </div>
        </div>
    </main>
    <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
