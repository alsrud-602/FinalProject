 const swiper = new Swiper('.swiper-container', {
    slidesPerView: 2, // 화면에 이미지 두 개 표시
    spaceBetween: 0,  // 이미지 간 여백 없음
    slidesPerGroup: 1, // 한 번에 한 장씩 슬라이드 이동
    loop: true, // 무한 루프
    navigation: {
      nextEl: '.swiper-button-next', // 다음 버튼
      prevEl: '.swiper-button-prev', // 이전 버튼
    },
    autoplay: {
      delay: 5000, // 3초마다 자동 슬라이드
    },
  });
 

 
  
function clipboard() {
    var currentUrl = window.location.href;

    // 클립보드에 URL 복사
    navigator.clipboard.writeText(currentUrl).then(function() {
        alert("URL이 클립보드에 복사되었습니다.");
    }).catch(function(error) {
        alert("복사 실패: " + error);
    });
} 