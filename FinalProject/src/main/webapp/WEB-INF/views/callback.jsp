<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Login Callback</title>
    <script>
        window.onload = function() {
            // URL에서 code를 추출
            const urlParams = new URLSearchParams(window.location.search);
            const code = urlParams.get('code');

            if (code) {
                console.log('Kakao authorization code:', code);

                // 서버로 code를 전송하여 JWT를 요청
                fetch(`/oauth2/callback/kakao?code=${code}`)
                    .then(response => response.json())
                    .then(data => {
                        const token = data.token; // 서버에서 반환한 JWT
                        console.log('JWT token:', token);

                        if (token) {
                            localStorage.setItem('access_token', token); // JWT를 localStorage에 저장
                            window.location.href = '/'; // 홈 화면으로 리다이렉트
                        }
                    })
                    .catch(error => {
                        console.error('Error during Kakao login:', error);
                        window.location.href = '/Users/LoginForm?error=true'; // 오류 시 로그인 화면으로 리다이렉트
                    });
            } else {
                console.error('Authorization code is missing.');
                window.location.href = '/Users/LoginForm?error=true'; // code가 없을 경우 로그인 화면으로 리다이렉트
            }
        };
    </script>
</head>
<body>
    <p>Logging in...</p>
</body>
</html>