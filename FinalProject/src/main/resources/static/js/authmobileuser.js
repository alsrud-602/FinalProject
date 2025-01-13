// 가장 최근의 토큰 가져오기
function getLatestToken() {
    const userJwt = localStorage.getItem('userJwt');
    const adminjwt = localStorage.getItem('adminjwt');
    const userJwtTime = localStorage.getItem('userJwtExpiration');
    const kakaoAccessToken = localStorage.getItem('kakaoAccessToken');
    const kakaoAccessTokenTime = localStorage.getItem('kakaoTokenExpiration');

    const tokens = [
        { token: userJwt, time: userJwtTime },
        { token: kakaoAccessToken, time: kakaoAccessTokenTime },
        { token: adminjwt, time: userJwtTime }
    ];

    // 유효한 토큰만 필터링
    const validTokens = tokens.filter(t => t.token !== null && t.time !== null);

    if (validTokens.length === 0) return null;

    validTokens.sort((a, b) => b.time - a.time);
    return validTokens[0].token;
}

document.addEventListener('DOMContentLoaded', function() {
    const latestToken = getLatestToken();

    if (!latestToken) {
        // 리다이렉트
        alert('로그인이 필요합니다.');
        window.location.href = '/Mobile/Users/LoginForm';
    }
});