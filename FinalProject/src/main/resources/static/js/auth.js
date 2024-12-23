// 공통 인증 함수
function authFetch(url, options = {}) {
    const token = localStorage.getItem('token');
    if (!token) {
        alert('로그인이 필요합니다.');
        window.location.href = '/Users/LoginForm';
        return Promise.reject('No token found');
    }

    // Authorization 헤더 추가
    const headers = options.headers || {};
    headers['Authorization'] = 'Bearer ' + token;

    return fetch(url, { ...options, headers });
}

// 인증 상태 확인
function checkAuth() {
    const token = localStorage.getItem('token');
    if (!token) {
        alert('로그인이 필요합니다.');
        window.location.href = '/Users/LoginForm';
        return false;
    }
    return true;
}

// 페이지 로드 시 인증 확인
document.addEventListener('DOMContentLoaded', function () {
    if (!checkAuth()) return;

    // 인증 성공 시 이후 로직
    console.log('인증 확인 완료');
});

window.addEventListener('unhandledrejection', function(event) {
    console.error('Unhandled promise rejection:', event.reason);
    alert('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.');
});