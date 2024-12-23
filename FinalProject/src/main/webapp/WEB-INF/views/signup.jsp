<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>POP CORN - 회원가입</title>
    <link rel="stylesheet" href="/css/common.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <style type="text/css">

        main{
                    color: #00ff84;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        
        }
        .container {
            width: 600px;
            padding: 30px;
            border: 2px solid #00ff84;
            border-radius: 20px;
            background-color: #121212;
            margin-bottom:100px;
        }
        h1 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #00ff84;
            border-radius: 5px;
            background-color: #1c1c1c;
            color: #fff;
            font-size: 16px;
        }
        input[name="birthdate"]{
        	z-index: 1000;
	        background: url('/images/calendar.svg') no-repeat right 10px center; 
	        color: #fff; 
        }
        input[name="birthdate"]::-webkit-calendar-picker-indicator, input[name="birthdate"]::-webkit-inner-spin-button { 
        	opacity: 0; 
        	appearance: none; 
        	cursor: pointer;
        }
        
        .note {
            font-size: 12px;
            color: #767676;
        }
        .checkbox-group {
            display: flex; /* 플렉스 박스 사용 */
            flex-direction: column; /* 수직 정렬 */
            margin: 20px 0;
        }
        .checkbox-group label {
            display: flex; /* 플렉스 박스 사용 */
            align-items: center; /* 수직 중앙 정렬 */
            width: calc(100% - 500px); /* 레이블 너비 조정 (체크박스 너비 고려) */
            margin-bottom: 10px; /* 간격 추가 */
            padding-left: 10px; /* 왼쪽 패딩 추가 */
            white-space: nowrap; /* 줄 바꿈 방지 */
            cursor: pointer;
        }
        .checkbox-group input {
            margin-right: 10px; /* 체크박스와 텍스트 사이 간격 */
        }
        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #00ff84;
            color: #000;
            font-size: 18px;
            cursor: pointer;
        }
        button:hover {
            background-color: #00e676;
        }
        .mainlogo {
            width: 400px; /* 원하는 너비로 조정 */
            height: auto; /* 비율에 맞춰 자동 크기 조정 */
            display: block; /* 이미지가 블록 요소로 표시되도록 설정 */
            margin: 0 auto; /* 가운데 정렬 */
            margin-bottom: 20px;
        }
    </style>
</head>

<%@include file="/WEB-INF/include/header.jsp" %>
<body>
    <main>
        <div class="container">
            <form method="POST" action="/Users/Signup" id="signupForm">
                <a href="/"><img class="mainlogo" src="/images/mainlogo.png" /></a>
                <div class="input-group">
                    <label for="nickname">닉네임</label>
                    <input type="text" id="nickname" name="nickname" placeholder="*2자 이상 입력해 주세요" required>
                    <div class="note">*2자 이상 입력해 주세요</div>
                </div>
                <div class="input-group">
                    <label for="username">아이디</label>
                    <input type="text" id="username" name="id" placeholder="*5~20자 영문 소문자, 숫자 사용" required>
                    <div class="note">*5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</div>
                </div>
                <div class="input-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="*8~16자 영문 대/소문자, 숫자 사용" required>
                    <div class="note">*8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</div>
                </div>
                <div class="input-group">
                    <label for="confirm-password">비밀번호 확인</label>
                    <input type="password" id="confirm-password" placeholder="*비밀번호 확인" required>
                    <div class="note">*비밀번호와 동일하게 입력해주세요</div>
                </div>
	            <div class="input-group">
	             	<label for="email">이메일</label>
		            <input type="email" id="email" name="email" placeholder="이메일 입력" />
	                <select id="email_domain" onchange="updateEmail()">
	                	<option value="" selected>직접입력</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="naver.com">naver.com</option>
	                    <option value="kakao.com">kakao.com</option>
	                    <option value="yahoo.com">yahoo.com</option>
	                    <option value="outlook.com">outlook.com</option>
	                </select>
	             </div>
                <div class="input-group">
                    <label for="phone">전화번호</label>
                    <input type="text" id="phone" name="phone" placeholder="01011111111" required>
                    <div class="note">*숫자만 입력해주세요</div>
                </div>
                <div class="input-group">
				    <label for="birthdate">생일</label>
				    <input type="date" id="birthdate" name="birthdate" required>
				    <div class="note">*오른쪽 달력 이모티콘을 클릭해주세요</div>
				</div>
				<div class="checkbox-group">
				    <label for="compulsoryAgreement">
				        <input type="checkbox" id="compulsoryAgreement" name="compulsoryAgreement" required>
				        <span style="color: #00FF84;">(필수)</span>&nbsp;POPCORN 이용약관 동의&nbsp;&nbsp; <span style="color: #767676; border-bottom: 1px solid #767676">자세히</span>
				    </label>
				    <label for="infoAgreement">
				        <input type="checkbox" id="infoAgreement" name="infoAgreement" required>
				        <span style="color: #00FF84;">(필수)</span>&nbsp;개인정보 수집 및 이용 동의&nbsp;&nbsp;<span style="color: #767676; border-bottom: 1px solid #767676">자세히</span>
				    </label>
				    <label for="messageAgreement">
				        <input type="checkbox" id="messageAgreement" name="messageAgreement" required>
				        <span style="color: #00FF84;">(필수)</span>&nbsp;SMS/E-MAIL 수신 동의&nbsp;&nbsp;<span style="color: #767676; border-bottom: 1px solid #767676">자세히</span>
				    </label>
				    <label for="marketingAgreement">
				        <input type="checkbox" id="marketingAgreement" name="marketingAgreement">
				        <span style="color: #767676;">(선택)</span>&nbsp;마케팅 목적의 개인정보 수집 및 이용 동의&nbsp;&nbsp;<span style="color: #767676; border-bottom: 1px solid #767676">자세히</span>
				    </label>
				    <label for="alertAgreement">
				        <input type="checkbox" id="alertAgreement" name="alertAgreement">
				        <span style="color: #767676;">(선택)</span>&nbsp;광고성 정보 수신 동의&nbsp;&nbsp;<span style="color: #767676; border-bottom: 1px solid #767676">자세히</span>
				    </label>
				</div>

                <button type="submit">가입하기</button>
            </form>
        </div>
<script>
document.getElementById('signupForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 기본 제출 동작 방지
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const errorMessages = [];

    // 아이디 유효성 검사
    const usernameRegex = /^[a-z0-9_-]{5,20}$/;
    if (!usernameRegex.test(username)) {
        errorMessages.push("아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
    }

    // 비밀번호 유효성 검사
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>])[A-Za-z\d!@#$%^&*()\-_=+{};:,<.>]{8,16}$/;
    if (!passwordRegex.test(password)) {
        errorMessages.push("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해야 합니다.");
    }

    // 에러 메시지 출력
    const errorMessagesDiv = document.getElementById('errorMessages');
    errorMessagesDiv.innerHTML = ''; // 이전 메시지 제거
    if (errorMessages.length > 0) {
        errorMessages.forEach(function(message) {
            const p = document.createElement('p');
            p.textContent = message;
            errorMessagesDiv.appendChild(p);
        });
    }
});
function updateEmail() {
    var emailInput = document.getElementById('email');
    var domainSelect = document.getElementById('email_domain');

    var selectedDomain = domainSelect.value;

    if (selectedDomain) {
        emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
    } else {
        emailInput.value = emailInput.value.split('@')[0]; // 도메인 제거
    }
}
const birthdate = document.getElementById('birthdate');

birthdate.addEventListener('change', function() {
    const selectedDate = new Date(birthdate.value);
    

    console.log(typeof(selectedDate.value), selectedDate.value)
});
</script>
    </main>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
