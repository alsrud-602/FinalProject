<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/admin_s.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>

.resetbutton {
    width: 80px;
    background: #F9FBFF;
    border-radius: 5px;
    border: none;
    font-size: 16px;
    text-align: center;
}
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/admin-header.jsp" %>
  <div class="container">  
  <%@include file="/WEB-INF/include/admin-slidebar.jsp" %>
  <main>
  <div class="content_box">
     <table id="box_table">
     <tr>
<td>  
    <div class="box_layout">
        <div class="box_circle">
            <img src="/images/icon/store3.png">
        </div>
        <div class="box_info">
            <p>총 스토어 수</p>
            <p>${totalStores}</p>
            <div class="box_updown">
                <img src="${growthStoreRate >= 0 ? '/images/icon/arrowup.png' : '/images/icon/arrowdown.png'}">
                <div>
                    <span class="${growthStoreRate >= 0 ? 'red' : 'blue'}">
                        ${growthStoreRate >= 0 ? '+' : ''}${growthStoreRate}%
                    </span> 이번 달
                </div>
            </div>
        </div>
    </div>
</td>

<td>  
    <div class="box_layout">
        <div class="box_circle">
            <img src="/images/icon/profilecheck.png">
        </div>
        <div class="box_info">
            <p>담당자 계정</p>
            <p>${totalUsers}</p>
            <div class="box_updown">
                <img src="${growthRate >= 0 ? '/images/icon/arrowup.png' : '/images/icon/arrowdown.png'}">
                <div>
                    <span class="${growthRate >= 0 ? 'red' : 'blue'}">
                        ${growthRate >= 0 ? '+' : ''}${growthRate}%
                    </span> 이번 달
                </div>
            </div>
        </div>
    </div>
</td>
       
       <td>  
       <div class="box_layout">
         <div class="box_circle"><img src="/images/icon/storemarker.png"></div>
         <div class="box_info">
          <p>현재 운영중인 스토어</p>
          <p>${popupListCount}</p>
         </div>
       </div>
       </td>
     </tr>
     </table>
  </div>
  
   <hr>
   <div class="content_box2">
    <p id="box_title">모든 스토어 입점 요청 내역</p>    
   <div class="box_filter">
   <input id="box_search"type="text" placeholder="Search">
   <select id="box_sort">
   <option value="">-선택-</option>
   <option value="미승인">미승인</option>
   <option value="승인">승인</option>
   <option value="미완">담당자 요청</option>
   </select>
   <input id="filter" class="filter" type="button" value="조회">
   <button type="reset"  class="resetbutton">※초기화</button>
   </div>
   
   <table id="box_table2">
     <tr>
       <th>기업명</th>
       <th>팝업스토어 명</th>
       <th>요청일</th>
       <th>이메일</th>
       <th>상태</th>
     </tr>

     <tbody class="storelist">
     <c:forEach var="store" items="${TotalStore}">

	<tr>
	  <td>${store.brand1}</td>
	  <td><a href="/Review/Storeview">${store.title}</a></td>
	  <td>${store.cdate}</td>
	  <td>${store.email}</td>
	  <td>
	    <div class="status_green">${store.status}</div>
		    <c:if test="${store.restatus != null}">
		      <div class="status_purple">
		        <c:choose>
		          <c:when test="${store.restatus == '미완'}">담당자요청</c:when>
		          <c:otherwise>${store.restatus}</c:otherwise>
		        </c:choose>
		      </div>
		    </c:if>
		  </td>
		</tr>
	</c:forEach>
     </tbody>
   </table>
   <div id="pagination">
    <%@include file="/WEB-INF/include/admin-pagination.jsp" %>
   </div>
   </div>
  </main>	
  </div>
</body>

<script>
$(function(){

	$('.filter').on('click', function(){
		
		let search = $('#box_search').val();
        let filter = $('#box_sort option:selected').val();
        window.location.href = "/Admin/Listpagination?search=" + encodeURIComponent(search) + "&filter=" + encodeURIComponent(filter);
	})
})

$(function(){
	$('.resetbutton').on('click',function(){
		window.location.href = "/Admin/Store/List";
	})

})


</script>

</html>
