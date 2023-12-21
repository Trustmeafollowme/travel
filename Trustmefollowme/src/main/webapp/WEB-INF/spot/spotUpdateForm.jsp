<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>

<h1>관광지 수정</h1> 

<form:form action="spotUpdate.sp" commandName="spotBean" method="post" enctype="multipart/form-data">
	<input type="hidden" name="snum" value="${spotBean.snum }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<p>
		이름 : <input type="text" name="name" value="${spotBean.name }">
	</p>

	<p>
		좌표 : <input type="text" name="xpos" value="${spotBean.xpos }" placeholder="위도를 입력하세요">,
		<input type="text" name="ypos" value="${spotBean.ypos }" placeholder="경도를 입력하세요">
	</p>

	<p>
		주소 : <input type="text" name="address" value="${spotBean.address }" size="50px">
	</p>
	<p>
		내용 : 
		<textarea name="content" rows="10" cols="40">${spotBean.content }</textarea>
	</p>

	<p>
		<c:set var="path" value="<%=request.getContextPath() %>"/>
		사진(메인 사진) : <img src="${path }/resources/images/${spotBean.image}" width="100" height="100"><br>
		<input type="file" name="upload" value="${spotBean.image }"> 
		<input type="hidden" name="Oimage" value="${spotBean.image }"> 
		<form:errors cssClass="err" path="image" />
	</p>

	<p>
		사진2 : <img src="${path }/resources/images/${spotBean.image2}" width="100" height="100"><br>
		<input type="file" name="upload2" value="${spotBean.image2 }"> 
		<input type="hidden" name="Oimage2" value="${spotBean.image2 }"> 
		<form:errors cssClass="err" path="image2" />
	</p>
 
	<p>
		사진3 : <img src="${path }/resources/images/${spotBean.image3}" width="100" height="100"><br>
		<input type="file" name="upload3" value="${spotBean.image3 }"> 
		<input type="hidden" name="Oimage3" value="${spotBean.image3 }"> 
		<form:errors cssClass="err" path="image3" />
	</p>

	<p>
		사진4 : <img src="${path }/resources/images/${spotBean.image4}" width="100" height="100"><br>
		<input type="file" name="upload4" value="${spotBean.image4 }"> 
		<input type="hidden" name="Oimage4" value="${spotBean.image4 }"> 
		<form:errors cssClass="err" path="image4" />
	</p>

	<p>
		사진5 : <img src="${path }/resources/images/${spotBean.image5}" width="100" height="100"><br>
		<input type="file" name="upload5" value="${spotBean.image5 }"> 
		<input type="hidden" name="Oimage5" value="${spotBean.image5 }"> 
		<form:errors cssClass="err" path="image5" />
	</p>

	<input type="submit" value="추가하기">
</form:form>
