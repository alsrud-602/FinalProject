<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.board.users.jwt.JwtUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/common.css" />

<style>
main{
color: white;}   
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
  <main>

	<a href="/Users/Wallet">wallet</a>
	<a href="/Users/RouteRecommend">Route Recommend</a>


        사용자 이름: ${username}
        사용자 이름: ${user.id}


  </main>	
 <%@include file="/WEB-INF/include/footer.jsp" %>
<!-- <script src="/js/auth.js" defer></script> -->
</body>
</html>
