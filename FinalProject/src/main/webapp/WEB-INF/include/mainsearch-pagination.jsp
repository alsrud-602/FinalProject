<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
 <div class="mainsearch-pagination">
   <c:if test="${OpendtotalPages > 0}">
    <c:if test="${OpendPage > 1}">
        <a href="?page=${OpendPage - 1}&search=${search}">이전</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${OpendtotalPages}">
        <c:choose>
            <c:when test="${i == OpendPage}">
                <a href="?page=${i}&search=${search}" class="active">${i}</a> 
            </c:when>
            <c:otherwise>
                <a href="?page=${i}&search=${search}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${OpendPage < OpendtotalPages}">
        <a href="?page=${OpendPage + 1}&search=${search}">다음</a>
    </c:if>  
</c:if>
</div> 
