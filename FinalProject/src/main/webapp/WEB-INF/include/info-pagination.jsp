<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
 <div class="main-pagination">
   <c:if test="${totalPages > 0}">
    <c:if test="${currentPage > 1}">
        <a href="?page=${currentPage - 1}&store_idx=${store_idx}">이전</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <a href="?page=${i}&store_idx=${store_idx}" class="active">${i}</a> 
            </c:when>
            <c:otherwise>
                <a href="?page=${i}&store_idx=${store_idx}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage + 1}&store_idx=${store_idx}">다음</a>
    </c:if>  
</c:if>
</div> 
