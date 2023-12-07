<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<style type="text/css">
	.err{
		color: red;
		font-size: 9pt;
		font-weight: bold;
	}
</style>
cafeInsertForm.jsp<br>

<h1>카페 추가</h1>

<form:form action="cafeInsert.cf" commandName="cafeBean" method="post" enctype="multipart/form-data">
	<p>
		이름 : <input type="text" name="name" value="${cafeBean.name }">
		<form:errors cssClass="err" path="name" />
	</p>

	<p>
		좌표 : <input type="text" name="xpos" value="${cafeBean.xpos }" placeholder="위도를 입력하세요">,
		<input type="text" name="ypos" value="${cafeBean.ypos }" placeholder="경도를 입력하세요">
		<form:errors cssClass="err" path="xpos" />
		<form:errors cssClass="err" path="ypos" />
	</p>

	<p>
		주소 : <input type="text" name="address" value="${cafeBean.address }" size="50px">
		<form:errors cssClass="err" path="address" />
	</p>

	<p>
		전화번호 : <input type="text" name="ctel1" value="${cafeBean.ctel1 }" maxlength="4">-
		<input type="text" name="ctel2" value="${cafeBean.ctel2 }" maxlength="4">- 
		<input type="text" name="ctel3" value="${cafeBean.ctel3 }" maxlength="4">
		<form:errors cssClass="err" path="ctel1" /> 
		<form:errors cssClass="err" path="ctel2" /> 
		<form:errors cssClass="err" path="ctel3" /> 
	</p>

	<p>
		개업 일자 : <input type="date" name="c_date" value="${cafeBean.c_date }">
		<form:errors cssClass="err" path="c_date" />
	</p>

	<p>
		영업 시간 : <input type="time" name="ctime1" value="${cafeBean.ctime1 }">~
		<input type="time" name="ctime2" value="${cafeBean.ctime2 }">
		<form:errors cssClass="err" path="ctime1" />
		<form:errors cssClass="err" path="ctime2" />
	</p>

	<p>
		사진(메인 사진) : <input type="file" name="upload" value="${cafeBean.image }"> 
		<form:errors cssClass="err" path="image" />
	</p>

	<p>
		사진2 : <input type="file" name="upload2" value="${cafeBean.image2 }"> 
		<form:errors cssClass="err" path="image2" />
	</p>
 
	<p>
		사진3 : <input type="file" name="upload3" value="${cafeBean.image3 }"> 
		<form:errors cssClass="err" path="image3" />
	</p>

	<p>
		사진4 : <input type="file" name="upload4" value="${cafeBean.image4 }"> 
		<form:errors cssClass="err" path="image4" />
	</p>

	<p>
		사진5 : <input type="file" name="upload5" value="${cafeBean.image5 }"> 
		<form:errors cssClass="err" path="image5" />
	</p>

	<input type="submit" value="추가하기">
</form:form>

