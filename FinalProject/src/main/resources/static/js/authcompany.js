document.addEventListener('DOMContentLoaded', function() {
    const companyJwt = localStorage.getItem('companyJwt');
    
    if (!companyJwt) {
        // 리다이렉트
		alert('로그인이 필요합니다.');
        window.location.href = '/CompanyAuth/LoginForm';
    }
});