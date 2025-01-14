<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*-----------------------------------------*/
/*메뉴바*/
.slidebar {
    background: #353535;
    width: 280px;
    height: 420px; /* 필요에 따라 조정 */
    font-family: 'Pretendard';
    font-weight: 800;
    font-size: 18px;
    border-radius: 15px;
    color: white;
    padding : 30px 50px 50px 50px;   

   
}

.admin-slide {
    
    width : 180px;
    height: 40px;
    text-align: left;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
}

.admin-slide:hover {
    background: #EAFFDC;
}

.admin {
    background: #00522B;
    padding: 20px;
      border-radius: 70px 20px 70px 20px;
    width:180px;
    height:120px;
    text-align: center;
    font-family: 'Pretendard';
    font-size: 24px;
    
}

.admin-slidesite {
    width:100px;
    height:30px;
    margin-left: 80px;
}

.admin-slidesite img {
    margin-right: 10px; /* 이미지와 텍스트 사이의 여백 */
}
.admin-slide a{
    text-decoration: none; /* 링크 장식 제거 */
    color: white; /* 글자 색상 */
    font-size: 12px;
    
}
.admin-slide-href{
text-decoration: none; /* 링크 장식 제거 */
color: inherit;
}
.admin-slide-href:hover{
text-decoration: none; /* 링크 장식 제거 */
color: inherit;
}

</style>

<footer>
<aside class="slidebar">
    <div class="admin">
      <p>${user.name}</p>
      <p>${user.nickname}</p>
    </div>
    <div class="admin-slide"><a href="/Admin/Dashboard"><img src="/images/admin/user/admin-slidebar1.png">&nbsp;&nbsp;&nbsp;대시보드</a></div>
    <div class="admin-slide"><a href="/Admin/Store/List"><img src="/images/admin/user/admin-slidebar2.png">&nbsp;&nbsp;&nbsp;스토어 관리</a></div>
    <div class="admin-slide"><a href="/Admin/User"><img src="/images/admin/user/admin-slidebar3.png">&nbsp;&nbsp;&nbsp;유저 관리</a></div>
    <div class="admin-slide"><a href="/Admin/Advertise"><img src="/images/admin/user/admin-slidebar4.png">&nbsp;&nbsp;&nbsp;광고 관리</a></div>
    <div class="admin-slidesite">
        <a href="/"  class="admin-slide-href">
            <img src="/images/admin/user/admin-slidebar5.png">
            사이트 바로가기
        </a>
    </div>
  </aside>
</footer>
