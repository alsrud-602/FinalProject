<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*-----------------------------------------*/
/*메뉴바*/

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Pretendard", sans-serif;
}

.sidebar {
  width:280px;
  height:490px;
  background-color:#353535;
  display:flex;
  justify-content:center;
  margin-right:100px;
  border-radius:15px;
  position:fixed;
}

.sidebar table {
  text-align:center;
  margin-top:10px;
}

.sidebar table tr {
  margin-top:10px;
  margin-bottom:10px;
}

.sidebar table th {
  border-radius: 70px 20px 70px 20px;
  background-color:#00522B;
  color:white;
  font-size:26px;
  width:220px;
  height:100px;
}

.sidebar table td {
  width:230px;
  height:55px;
  border-radius:8px;
}

.sidebar table tr:nth-child(5) td {
  width:230px;
  height:20px;
}

.sidebar table a {
  text-decoration:none;
  color:white;
  font-size:18px;
  font-weight:800;
  display:flex;
  align-items:center;
  width:100%;
  height:55px;
  border-radius:8px;
  padding-left:5px;
}

.sidebar table a:hover {
  background-color:#EAFFDC;
  color:#333;
}

#site-link {
  font-size:10px;
  height:100%;
  justify-content:flex-end;
}

#site-link:hover {
  background-color:#353535;
  color:white;
}

aside {
  margin-top:20px;
}

</style>
<aside>
    <div class="sidebar">
	 <table>
	  <thead>
	   <tr><th>관리자<br>못난이감자빵</th></tr>
	  </thead>
	  <tbody>
	   <tr><td><a href=""><img src="/images/admin/user/admin-slidebar1.png">&nbsp;&nbsp;&nbsp;대시보드</a></td></tr>
	   <tr><td><a href=""><img src="/images/admin/user/admin-slidebar2.png">&nbsp;&nbsp;&nbsp;스토어 관리</a></td></tr>
	   <tr><td><a href=""><img src="/images/admin/user/admin-slidebar3.png">&nbsp;&nbsp;&nbsp;유저관리</a></td></tr>
	   <tr><td><a href=""><img src="/images/admin/user/admin-slidebar4.png">&nbsp;&nbsp;&nbsp;광고관리</a></td></tr>
	   <tr><td><a id="site-link" href="">사이트 바로가기<img src="/images/admin/user/admin-slidebar5.png"></a></td></tr>
	  </tbody>
	 </table> 
    </div>
</aside>
