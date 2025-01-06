<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />


<style>
   body{
   background-color: #121212 !important;
    color: white !important;
   }
   .container {
    display: grid;
    grid-template-columns: repeat(3, 400px); /* 3개씩 나열 */
    gap: 15px; /* 간격을 줄임 */
    padding: 15px; /* 패딩 조정 */
    justify-items: center; /* 카드 가운데 정렬 */
    justify-content: center; /* 컨테이너 내에서 카드들을 가운데 정렬 */
}

  .card {
    background-color: #121212; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 15px; /* 패딩 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: white;
    width: 100%; /* 카드 폭을 컨테이너에 맞춤 */
    max-width: 400px; /* 최대 너비 설정 */
  }

  .card img {
    width: 100%; /* 카드 크기에 맞춤 */
    max-width: 300px; /* 최대 너비를 400px로 설정 */
    height: auto; /* 비율 유지 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
    object-fit: contain; /* 비율 유지하며 크기 조정 */
}

  .title {
    font-size: 36px; /* 제목 크기 */
    margin: 10px 0; /* 여백 */
    color: white;
    font-family:'Pretendard';
  }

  .info {
    font-size: 16px; /* 정보 크기 */
    color: white; /* 정보 색상 */
    
    }

    
    #calendarInput{
    background: #121212;
    color: white;
    border: none;
    border-radius: 10px;
    font-family:'Pretendard';
    font-size:20px;
    text-align: center;
    border: 2px solid #00ff84;
    display: inline-block;
    padding-top : 11px;
    padding-bottom : 11px;
    }
    
    .h2text{
    max-width: 300px;
    position: relative;
    width: 100%;
    margin: 0 auto;
    font-family:'Pretendard';
    font-size:40px;
    padding-left: 100px;
    
    }
    
    .ongoingfilter {
    position: relative; /* 요소를 고정 */
    top: 70px; /* 원하는 위치에 맞게 조정 */
    left: calc(50% - 825px); /* 왼쪽으로 100px 이동 (1000px의 절반 만큼) */
    transform: translateX(0); /* 중앙 정렬 보정 제거 */
    width: 1000px;
    height: 100px;
}
    .resetbutton{
      background: #121212;
      color:white;
      padding: 10px;
      border: none;
      border: 2px solid #00ff84;
      border-radius: 10px;
      margin-left: 10px;
    }
    .nodata{
      font-size: 40px;
      padding : 30px;
      width: 600px;
      margin-left: 500px;
    }
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<main>
	<div>
	<h2 class="h2text">랭킹</h2>
	</div>
	
	<div class="container">
	    <c:forEach var="rank" items="${ranklist}">
	      <a href="/Users/Info?store_idx=${rank.store_idx}">
		    <div class="card">
		      <img src="/image/read?path=${rank.image_path}" alt="Store Image" >
		      <div class="title">${rank.title}</div>
		      <div class="info">주소:${rank.address}<br>기간: ${rank.start_date} ~ ${rank.end_date}</div>
		    </div>
		   </a>
		 </c:forEach>
	  </div>
  </main>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
<script>
//지역,연령대,날짜 필터링
$(function() {
    $('.regionfilter, .agefilter, .mainfilter').on('change', function() {
        let region = $('.regionfilter').val();
        let age = $('.agefilter').val();
        let date = $('.mainfilter').val();

        $.ajax({
            url: '/Users/Regionfilter',
            type: 'GET',
            data: { region: region, age: age, date: date }
        })
        .done(function(data) {
            console.log(data); // 응답 확인
            $('.container').html(""); // 기존 내용 비우기
            let html = "";

            // filterlist가 존재하고 배열인지 확인
            if (data.filterlist && Array.isArray(data.filterlist)) {
                if (data.filterlist.length > 0) { // filterlist가 비어있지 않으면
                    data.filterlist.forEach(function(a) {
                        html += "<a href='/Users/Info?store_idx=" + a.store_idx + "'>" +
                        "<div class='card'>" +
                        "<img src='/images/main/popup1.png' alt='/images/main/popup1.png'>" +
                        "<div class='title'>" + a.title + "</div>" +
                        "<div class='info'>주소: " + a.address + "<br>기간: " + a.start_date + " ~ " + popup.end_date + "</div>" +
                    "</div>" +
                "</a>";
                    });
                } else {
                    html = "<div class='nodata'>데이터가 없습니다.</div>"; // filterlist가 비어있을 때 메시지
                }
            }

            $('.container').append(html); // 생성된 HTML 추가
        })
        .fail(function(err) {
            console.log(err);
            alert('오류 : ' + err.responseText);
        });
    });
});

</script>
</html>