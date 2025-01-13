document.addEventListener("DOMContentLoaded", () => {
    const token = localStorage.getItem("token");
    const kakaoAccessToken = localStorage.getItem("kakaoAccessToken");

    if (!token && !kakaoAccessToken) {
        alert("로그인이 필요합니다.");
        window.location.href = "/Users/LoginForm"; // 로그인 페이지로 이동
        return;
    }

    // 중복 요청 방지: token과 kakaoAccessToken 중 하나만 처리
    const isUserToken = !!token;
    const authToken = isUserToken ? token : kakaoAccessToken;
    const tokenType = isUserToken ? "UserToken" : "KakaoToken";

    // 사용자 정보 요청
    fetch("/Users/user-info", {
        method: "GET",
        headers: {
            "Authorization": "Bearer " + authToken,
            "Token-Type": tokenType
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("사용자 정보를 가져오지 못했습니다.");
            }
            return response.text();
        })
		.then(html => {
		    const bodyElement = document.querySelector("body");
		    const header = document.querySelector("header");
		    const footer = document.querySelector("footer");
		    
		    // 기존 내용을 삭제하지 않고 main만 업데이트
		    const mainElement = document.querySelector("main");
		    mainElement.innerHTML = html; // main 부분만 갱신
		    
		    bodyElement.appendChild(header); 
			// body에서 기존 footer 제거
			if (bodyElement.contains(footer)) { 
			    bodyElement.removeChild(footer);  
			}
		})
        .catch(error => {
            console.error("Error:", error);
            alert("사용자 정보를 불러오지 못했습니다.");
        });
});
