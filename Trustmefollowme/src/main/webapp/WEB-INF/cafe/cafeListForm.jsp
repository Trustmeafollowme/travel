<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<center>
	<h1>cafeListForm.jsp</h1>
	<form action="mainCafeList.cf" method="get">
		<select name="whatColumn">
			<option value="all">전체 검색</option>
			<option value="cname">카페 이름</option>
			<option value="caddress">카페 주소</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어를 입력하세요.">
		<input type="submit" value="검색">
	</form>
</center>
<hr>
<table align="center" border="1">
	<tr>
		<td align="right" colspan="3">
			<a href="cafeInsert.cf">추가</a>
		</td>
	</tr>
	<c:choose>
	<c:when test="${empty list }">
	<tr>
		<td align="center">검색된 카페가 없습니다.</td>
	</tr>
	</c:when>
	<c:otherwise>
	<tr align="center">
	<c:set var="count" value="0"/>
	<c:forEach var="cb" items="${list }">
		<c:set var="count" value="${count+1 }"/>
		<td align="center">
			<c:set var="path" value="<%=request.getContextPath() %>"/>
			<a href="cafeDetail.cf?cnum=${cb.cnum }&pageNumber=${pageInfo.pageNumber }">
				<img src="${path }/resources/images/${cb.image }" width="80" height="80" align="top">
			</a><br>
			<h3>${cb.name }</h3><br>
			${cb.address }<br>
			${cb.ctel1 }
			<c:if test="${!empty cb.ctel2 }">
				-${cb.ctel2 }
			</c:if>
			-${cb.ctel3 }<br>
			<input type="checkbox" name="rowcheck" value="${cb.cnum }">
		</td>
	<c:if test="${count % 3 == 0 }">
	</tr>
	<tr>	
	</c:if>
	</c:forEach>
	</tr>
	</c:otherwise>
	</c:choose>
</table>

<center>
	${pageInfo.pagingHtml }
</center>