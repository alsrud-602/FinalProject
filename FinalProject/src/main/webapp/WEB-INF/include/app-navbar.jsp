<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
   .bottom-nav {
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        background-color: #333;
        padding: 10px 20px;
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        z-index:  10000;
        box-sizing: border-box; 
        overflow-y: auto; 
    }
    
    
      .content {
        padding-bottom: 70px; /* 하단 네비게이션 바 높이만큼 여백 추가 */
        
    }
    
 .bottom-nav-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    flex: 1;
    text-align: center;
}

.bottom-nav-item .nav-link {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 10px;
}

.bottom-nav-item img {
    display: block;
    margin-bottom: 5px; /* 이미지와 텍스트 간 간격을 조정 */
    width: 24px; /* 이미지 크기 조정 */
    height: auto;
}

.bottom-nav-item span {
     font-size: 12px; /* 텍스트 크기 */
    color: white; /* 텍스트 색상 */
    margin-top: 4px; /* 텍스트와 이미지 간의 간격 */
    display: block;
    white-space: nowrap; /* 텍스트를 한 줄로 처리 */
    text-align: center; /
} 
._6-11 {
    filter: invert(1) brightness(100%) contrast(100%);
}

.nav-link.active {
    border-radius: 50%;
    background-color: #f0f0f0; /* 동그란 배경색 */
    padding: 5px;
}
</style>
<footer>
<!-- 하단 네비게이션 바 -->
<div class="bottom-nav">
    <div class="bottom-nav-item">
        <a href="/Mobile/Users/test" class="nav-link">
            <img class="_6-12" src="/images/admin/store/admin-search.png" />
            <span>검색</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="/Mobile/Users/Wallet" class="nav-link">
            <img class="_6-10" src="/images/header/popcornfactory.png" style="width:18px;"/>
            <span>팝콘팩토리</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="/home-page" class="nav-link">
            <img class="_6-11" src="/images/icon/homepage.png" />
            <span>홈</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="/reservation-page" class="nav-link">
            <img class="_6-11" src="/images/icon/insert.png" />
            <span>예약 내역</span>
        </a>
    </div>
    <div class="bottom-nav-item">
        <a href="/profile-page" class="nav-link">
            <i class="fas fa-user"></i>
             <img class="personal-collection0" src="/images/header/personal-collection0.svg" />
            <span>프로필</span>
        </a>
    </div>
</div>

   </footer>
