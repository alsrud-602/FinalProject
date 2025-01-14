<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
footer {
    position: fixed; /* 고정 위치 */
    bottom: 0; /* 화면 하단 */
    left: 0; /* 왼쪽 정렬 */
    width: 100%; /* 전체 너비 */
    background-color: #121212; /* 배경색 */
    color: white; /* 글자색 */
    text-align: center; /* 가운데 정렬 */
    z-index: 1000; /* 다른 요소들 위에 표시 */
}

aside {
    background: white;
    color: black;
}

.mobile_share, .mobile_bookmark, .mobile_atag_div {
    display: flex; /* 플렉스 박스를 사용하여 정렬 */
    align-items: center; /* 수직 정렬 */
    border-radius: 20px;
    padding-left: 50px;
    margin-top: 40px;
    margin-bottom: 40px;
}

.mobile_bookmark {
    background: #F9FF40; /* 북마크 배경색 */
    width: 250px;
    height: 80px;
    margin-right: 40px;
}

.mobile_share {
    background: #514D4D; /* 공유하기 배경색 */
    width: 250px;
    height: 80px;
}

.mobile_atag_div {
    background: #00FF84; /* 리뷰 작성하기 배경색 */
    width: 400px;
    height: 80px;
    padding-left: 80px;
    margin-left: 40px;
}

.mobile_share img, .mobile_bookmark img, .mobile_atag_div img {
    width: 30px;
    height: 30px;
    margin-right: 8px; /* 이미지와 텍스트 사이의 간격 */
}

.mobile_share p, .mobile_bookmark p, .mobile_atag_div a {
    font-size: 30px;
    font-weight: 700;
}

.mobiletitle_click {
    display: flex; /* 플렉스 박스를 사용하여 정렬 */
    justify-content: space-between; /* 요소 간의 간격을 균등하게 분배 */
    align-items: center; /* 수직 정렬 */
}
</style>
<footer>
<aside>
  <div class="mobileside-layout">
  <div class="mobileside_box">
 <div class="mobiletitle_click">
       <div class="mobile_atag_div"><img src="/images/icon/reviews-write.png"><a class="btn2" href="/Mobile/Users/Writeform?store_idx=${storedetail.store_idx}">리뷰 작성하기</a></div>
       <div class="mobile_share" onclick="clipboard()"><img src="/images/icon/share1.png"><p>공유하기</p></div>
       <div class="mobile_bookmark"><img src="/images/icon/star.png"><p>찜하기</p></div>
      </div>
  </div>
  </div>
  </aside>
</footer>
