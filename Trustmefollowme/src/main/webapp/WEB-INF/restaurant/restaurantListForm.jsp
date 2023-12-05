<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<h1>restaurant.jsp</h1>

<style type="text/css">
#mainImg img {
	width: 150px;
	height: 150px;
	overflow: hidden;
	border-radius: 30%;
}

#mainImg:hover img {
	transition: all 0.15s linear;
	transform: scale(1.2);
}
</style>
	<form action="restaurantList.re" method="get">
		<select name="WhatColumn">
			<option value="all">전체 검색
			<option value="rname">이름 검색
			<option value="rlocation">장소 검색
		</select> <input type="text" name="keyword"> <input type="submit"
			value="검색">
	</form>
	<br>
<c:set var="count" value="0"/>
<table class="restTable" width="920px">
<tr>
	<c:forEach var="rb" items="${lists}">
	<c:set var="count" value="${count+1}"/>
		<c:choose>
			<c:when test="${empty lists}">
				<tr>
					<td>음식점의 정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
					<td id="mainImg" align="center">
					<br>
					<img src="<%=request.getContextPath()%>/resources/images/${rb.rimage1}">
					<br><br>
					이름 : ${rb.rname}<br>
					장소 : ${rb.rlocation}<br>
					연락처 : ${rb.rtel1}- ${rb.rtel2} - ${rb.rtel3}<br>
					영업 시간 : ${rb.rtime1} 시 ~ ${rb.rtime2} 시<br>
					개업 일자 : ${rb.rdate}</td>
				<c:if test="${count % 3 eq 0}">
					</tr><tr>
				</c:if>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	</tr>
</table>
</td>
</tr>
</table>
