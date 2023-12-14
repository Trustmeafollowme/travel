<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table>
<tr>
<td>여정번호</td>
<td>날짜</td>
<td>순서</td>
<td>아이디</td>
<td>카테고리</td>
<td>카테고리 번호</td>
<td>이름</td>
<td>주소</td>
<td>위경도</td>
<td>이미지</td>
<td>이미지2</td>
<td>이미지3</td>
<td>이미지4</td>
<td>이미지5</td>
</tr>
<c:forEach var="myj" items="${list}">
<tr>
<td>${myj.jnum}</td>
<td>${myj.jdate}</td>
<td>${myj.turn}</td>
<td>${myj.id}</td>
<td>${myj.cate}</td>
<td>${myj.ref}</td>
<td>${myj.name}</td>
<td>${myj.address}</td>
<td>${myj.xpos}/${myj.ypos}</td>
<td>${myj.image}</td>
<td>${myj.image2}</td>
<td>${myj.image3}</td>
<td>${myj.image4}</td>
<td>${myj.image5}</td>
</tr>
</c:forEach>
</table>