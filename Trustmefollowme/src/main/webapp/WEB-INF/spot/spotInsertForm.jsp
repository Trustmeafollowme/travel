<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
spotInsertForm.jsp<br>

<h1>관광지 추가</h1>

<form action="spotInsert.sp" method="post" enctype="multipart/form-data">
	<p>
		이름 : <input type="text" name="name" value="${sb.name }">
	</p>

	<p>
		좌표 : <input type="text" name="xpos" value="${sb.xpos }" placeholder="위도를 입력하세요">,
		<input type="text" name="ypos" value="${sb.ypos }" placeholder="경도를 입력하세요">
	</p>

	<p>
		주소 : <input type="text" name="address" value="${sb.address }" size="50px">
	</p>
	<p>
		내용 : <input type="text" name="content" value="${sb.content }" size="50px">
	</p>

	<p>
		사진(메인 사진) : <input type="file" name="upload" value="${sb.image }"> 
	</p>

	<p>
		사진2 : <input type="file" name="upload2" value="${sb.image2 }">
	</p>

	<p>
		사진3 : <input type="file" name="upload3" value="${sb.image3 }">
	</p>

	

	<input type="submit" value="추가하기">
</form>