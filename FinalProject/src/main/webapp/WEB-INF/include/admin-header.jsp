<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<style>
	.header, .header * {
		box-sizing: border-box;
	}
	
	.header {
	    background: #F3F9F3;
	    height: 94px;
	    position: fixed; /* 고정 위치 */
	    top: 0; /* 상단에 고정 */
	    left: 0;
	    right: 0;
	    z-index: 1000; /* 다른 요소들 위에 표시 */
	}
	
	
	.logo {
		width: 250px;
		height: auto;
		position: absolute;
		left: 10px;
		top: 10px;
	}
	
	.search-container{
	    height: 80px;
	    position: fixed; /* 고정 위치 */
	    top: 5px; /* 상단에 고정 */
	    margin : 0 auto;
	    right: 0;
	    z-index: 1000; /* 다른 요소들 위에 표시 */
	    max-width:800px;
	    position: relative;
	}
	
    .search-input {
        width: 1000px; /* 원하는 너비로 설정 */
        height: 75px; /* 원하는 높이로 설정 */
        font-size: 16px; /* 글자 크기 조정 */
        border: 2px solid #111111; /* 테두리 색상 */
        border-radius:55px;
    }
    
	.search-input::placeholder {
    color: #B3B3B3; /* 플레이스홀더 색상 */
    padding-left : 20px;
    }
	

    .search-button img {
    width: 35px; /* 아이콘 크기 */
    height: 35px; /* 아이콘 크기 */
}	
    .search-button {
    position: absolute;
    right: -180px; /* 오른쪽 여백 조정 */
    top: 50%;
    transform: translateY(-50%);
    background: transparent; /* 투명 배경 */
    border: none; /* 테두리 없음 */
    cursor: pointer; /* 포인터 커서 */
}

	</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <header>
        <div class="header">
            <a href="/Users/Main"><img class="logo" src="/images/header/logo.png" alt="로고" /></a>
		</div>
		<div class="search-container">
           <input type="text" class="search-input" placeholder="찾고싶은 기능을 검색하세요!">
            <button class="search-button" type="submit">
              <img class="imgsearch" src="/images/main/search.png" alt="검색">
        </button>
    </div>
    </header>

