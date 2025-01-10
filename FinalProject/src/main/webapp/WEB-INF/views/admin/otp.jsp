<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 인증</title>
<link rel="stylesheet" href="/css/admin-common.css" />
<style type="text/css">
main { 
text-align: center;} 
</style>
</head>
<body>
<main>
    <h1>Authentication</h1>
    
        <!-- QR 코드 이미지 -->
    <img src="/Users/Admin/otp/qrcode" alt="Scan this QR code with Google Authenticator">
    
    <p>발급 받으신 OTP를 입력해주세요</p>

    <form action="/Users/Admin/otp" method="POST">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" name="code" required>
        <button type="submit">Verify</button>
    </form>

    <!-- Error message -->
    <c:if test="${param.error}">
        <div style="color: red;">유효하지 않은 OTP입니다. 다시 시도하세요.</div>
    </c:if>
    </main>
</body>
</html>