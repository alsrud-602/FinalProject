<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    margin: 0; /* 기본 여백 제거 */
}

.container {
    display: flex; /* 사이드바와 콘텐츠를 나란히 배치 */
}

.sidebar {
    background: #353535;
    width: 200px;
    height: 400px; /* 필요에 따라 조정 */
    font-family: 'Pretendard';
    font-weight: 800;
    font-size: 16px;
    border-radius: 15px;
    color: white;
    padding-top: 60px; /* 테이블을 아래로 내리기 위한 패딩 */
}

.admin-slide {
    padding: 10px;
    margin: 10px;
}

.admin-slide:hover {
    background: #EAFFDC;
}

.sidebar table {
    background: #00522B;
    padding: 20px;
    margin: 0 30px 10px 30px; /* 상단 여백을 0으로 설정 */
    border-radius: 15px;
}

.admin-slidesite {
    display: flex; /* 플렉스 박스 사용 */
    align-items: center; /* 수직 중앙 정렬 */
    margin: 10px; /* 여백 추가 */
    text-decoration: none; /* 링크 장식 제거 */
    color: white; /* 글자 색상 */
    padding-top: 35px;
    padding-left: 55px;
    font-size: 12px;
}

.admin-slidesite img {
    margin-right: 10px; /* 이미지와 텍스트 사이의 여백 */
}

.content {
    flex: 1; /* 남은 공간을 차지하도록 설정 */
    padding: 20px; /* 콘텐츠에 패딩 추가 */
    background: #E8EEE7;
    width: 1700px;
    height:900px;
}
.content table{
    width : 1600px;
    height : 100px;
    font-size: 20px;
    font-family: 'Pretendard';
    border: 1px solid black;
    padding : 10px;
}
.content table td {
    padding : 10px;
    
}
</style>
</head>

<body>
<%@include file="/WEB-INF/include/admin-header.jsp" %>
<div class="container"> <!-- 컨테이너 추가 -->
  <aside class="sidebar">
    <table>
      <tr>
        <td>관리자</td>
      </tr>
      <tr>
        <td>못난이 감자빵</td>
      </tr>
    </table>
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar1.png">&nbsp;&nbsp;&nbsp;대시보드</div>
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar2.png">&nbsp;&nbsp;&nbsp;스토어 관리</div>
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar3.png">&nbsp;&nbsp;&nbsp;유저 관리</div>
    <div class="admin-slide"><img src="/images/admin/user/admin-slidebar4.png">&nbsp;&nbsp;&nbsp;광고 관리</div>
    <div style="margin-left: 27px;">
        <a href="/" class="admin-slidesite">
            <img src="/images/admin/user/admin-slidebar5.png">
            사이트 바로가기
        </a>
    </div>
  </aside>
  <div>
    <div class="content">
      <h2>유저관리</h2>
      <hr style="width: 80%; margin: 0 auto; border: 1px solid black;">
      
      <button>선택한 회원 팝콘 지급하기</button>
      <button>선택한 회원 팝콘 차감하기</button>
      
      <table>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>닉네임</td>
          <td>아이디</td>
          <td>가입일</td>
          <td>상태</td>
          <td colspan="2">설정</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>우수회원▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>우수회원▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>우수회원▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>우수회원▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>우수회원▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>Blocked▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td></td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td></td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>Blocked▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="usertable" name="usertable" class="usertable"></td>
          <td>대원스토어</td>
          <td>DaeWon Store</td>
          <td>2024.12.13</td>
          <td>Blocked▽</td>
          <td>지급하기</td>
          <td>차감하기</td>
        </tr>
        
      </table>
      
    </div>
  </div>
</div>
<%@include file="/WEB-INF/include/admin-footer.jsp" %>
</body>
</html>
