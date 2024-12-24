<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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
    margin-top: 100px;
    
    
}

.admin-slide {
    
    width : 180px;
    height: 40px;
    text-align: left;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
    border: none;
    background: #353535;
    font-family: 'Pretendard';
    font-weight: 800;
    font-size: 18px;
    color:white;
}


.admin-slide:hover {
    background: #EAFFDC;
    color:#121212;
}

.admin {
    background: #00522B;
    padding: 20px;
    border-radius: 90px 20px 90px 20px;
    width:230px;
    height:120px;
    text-align: center;
    font-family: 'Pretendard';
    font-size: 24px;
    border-bottom: 2px solid white;
    /*box-shadow: 10px 10px 15px rgba(255, 255, 255, 0.5 ); /* 오른쪽 아래로 그림자 */
     margin-left: -20px; 
}
.admin p{
    font-family:'Pretendard';
    margin-left: -20px;
}

.admin-slidesite {
    width:100px;
    height:30px;
    margin-left: 80px;
}

.admin-slidesite img {
    margin-right: 10px; /* 이미지와 텍스트 사이의 여백 */
}
.admin-slide-href{
    text-decoration: none; /* 링크 장식 제거 */
    color: white; /* 글자 색상 */
    font-size: 12px;
}
/*드롭다운*/
.dropdown-menu{
    padding:0px;
    }
.dropdown-menu a{
    width : 210px;
    height: 40px;
    border: none;
    background: #353535;

}
.dropdown-item{
    font-family: 'Pretendard';
    font-weight: 800;
    font-size: 18px;
    color:#EAFFDC;
}
</style>

<footer>
<aside class="slidebar">
    <div class="admin">
      <p style="font-size: 26px; margin-bottom: 0px;">관리자</p>
      <p style="font-size: 32px;">못난이 감자빵</p>
    </div>
    
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar1.png">&nbsp;&nbsp;&nbsp;대시보드</div>
    <div class="dropdown">
		  <!-- 버튼 -->
		  <button class="admin-slide" type="button" data-toggle="dropdown" id="dropdownBtn">
		    <img src="/images/admin/user/admin-slidebar1.png">&nbsp;&nbsp;&nbsp;스토어 관리
		  </button>
		  <!-- 드롭다운 -->
		  <div class="dropdown-menu">
		    <a class="dropdown-item" href="/">-&nbsp;&nbsp;스토어 승인 관리</a>
		    <a class="dropdown-item" href="/">-&nbsp;&nbsp;스토어 통계</a>
		    <a class="dropdown-item" href="/">-&nbsp;&nbsp;스토어 담당자 관리</a>
		  </div>
    </div>
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar3.png">&nbsp;&nbsp;&nbsp;유저 관리</div>
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar4.png">&nbsp;&nbsp;&nbsp;광고 관리</div>
    <div class="admin-slidesite">
        <a href="/"  class="admin-slide-href">
            <img src="/images/admin/user/admin-slidebar5.png">
            사이트 바로가기
        </a>
    </div>
  </aside>
</footer>
