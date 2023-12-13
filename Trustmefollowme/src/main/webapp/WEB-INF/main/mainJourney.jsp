<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table>
<tr>
<td>위치</td>
<td>날짜</td>
<td>카테고리</td>
<td>카테고리 번호</td>
<td>순서</td>
</tr>
<c:forEach var="myj" items="${list}">
<tr>
<td>${myj.xpos}/${myj.ypos}</td>
<td>${myj.jdate}</td>
<td>${myj.cate}</td>
<td>${myj.number}</td>
<td>${myj.turn}</td>
</tr>
</c:forEach>
</table>