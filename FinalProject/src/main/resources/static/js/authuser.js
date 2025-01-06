document.addEventListener('DOMContentLoaded', function() {
    const userJwt = localStorage.getItem('userJwt');
    const kakaoAccessToken = localStorage.getItem('kakaoAccessToken');
    
    if (!(userJwt || kakaoAccessToken)) {
        // 리다이렉트
		alert('로그인이 필요합니다.');
        window.location.href = '/Users/LoginForm';
    }
});