<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><h1>CafeDetail.jsp</h1></center>

<table align="center" border="1">
	<tr align="center"> 
		<td rowspan="8">
		<c:set var="path" value="<%=request.getContextPath() %>"/>
		<img src="${path }/resources/images/${cb.image }" width="100" height="100" align="top">
		</td>
	</tr>
	<tr align="center">
		<th>번호</th>
		<td>${cb.cnum }</td>
	</tr>
	<tr align="center">
		<th>이름</th>
		<td>${cb.name }</td>
	</tr>
	<tr align="center">
		<th>좌표</th>
		<td>${cb.xpos },${cb.ypos }</td>
	</tr>
	<tr align="center">
		<th>주소</th>
		<td>${cb.address }</td>
	</tr>
	<tr align="center">
		<th>전화번호</th>
		<td>${cb.ctel1 }-${cb.ctel2 }
		<c:if test="${!empty cb.ctel3 }">
			-${cb.ctel3 }
		</c:if>
		</td>
	</tr>
	<tr align="center">
		<th>개업 일자</th>
		<td>${cb.c_date }</td>
	</tr>
	<tr align="center">
		<th>영업 시간</th>
		<td>${cb.ctime1 }~${cb.ctime2 }</td>
	</tr>
	<tr align="center">
		<td colspan="3">
			<a href="mainCafeList.cf?pageNumber=${param.pageNumber }">카페 리스트</a> | 
			<a href="cafeUpdate.cf?cnum=${cb.cnum }&pageNumber=${param.pageNumber }">수정</a> | 
			<a href="cafeDelete.cf?cnum=${cb.cnum }&pageNumber=${param.pageNumber }">삭제</a> 
		</td>
	</tr>
</table>