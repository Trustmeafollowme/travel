<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<center>
<h1>spotListForm.jsp</h1>
</center>
<hr>
<table align="center" border="1">
	<tr>
		<td align="right" colspan="3">
			<a href="spotInsert.sp">추가</a>
		</td>
	</tr>
	<tr align="center">
	<c:set var="count" value="0"/>
	<c:set var="path" value="<%=request.getContextPath() %>"/>
	<c:forEach var="sb" items="${list }">
		<c:set var="count" value="${count+1 }"/>
		<td>
			<a href="spotDetail.sp?snum=${sb.snum }&pageNumber=${paging.pageNumber }">
				<img src="${path }/resources/images/${sb.image }" width="80" height="80" align="top">
			</a><br>
			<h3>${sb.name }</h3><br>
			${sb.address }<br>
			
		
			<input type="checkbox" name="rowcheck" value="${sb.snum }">
		</td>

	</c:forEach>
	</tr>
</table>

<center>
	${paging.pagingHtml }
</center>