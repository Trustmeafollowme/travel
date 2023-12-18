<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<link
	href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath() %>/resources/css/_variables.scss"
	rel="stylesheet">
<style>
img {
	border-radius: 30px;
	width: 70%;
	height: 30%;
}
.page{
	display: inline-block;
	width: 33%;
	text-align: center;
	margin-top: 50px;
    box-shadow: 1px 1px 1px rgba(231,231,231,0.4);
}
.deco{
	color: black;
	text-decoration: none;
}
 .content {
	text-align:center;
    height: 100px;
    width: 100%;
    overflow: auto;
    margin: auto;
}
.content::-webkit-scrollbar {
    width: 10px;
  }
  .content::-webkit-scrollbar-thumb {
    background-color: black;
  }
  .content::-webkit-scrollbar-track {
    background-color: #D5D5D5;
  }
.ptext{
	text-align: center;
	padding-top: 50px;
}
.contents{
	margin: auto;
	width: 70%;
}
</style>

	<div class="ptext">
		<span> <font color="#6D6CFF"> 여행 일지 </font>
		</span>
		<span class="mb-4 text-3xl font-bold text-dark sm:text-4xl md:text-[40px] dark:text-white">
		<h2>
			나의 여행을 소개합니다.
		</h2>
		</span>
	</div>
	<c:forEach var="list" items="${lists}">
		<div class="page">
			<h3>
					<a href="boardDetail.bd?num=${list.num}" class="deco">
					${list.title}
					</a>
				</h3>
			<a href="boardDetail.bd?num=${list.num}"> 
			<img src="<%=request.getContextPath()%>/resources/images/${list.image}"
				alt="이미지" width="400px" height="300px" />
			</a>
			<div>
			<br>
		<div class="contents">
				<span class=" px-4 py-1 text-center text-white rounded bg-primary">
					<fmt:parseDate var="date" value="${list.reg_date}" pattern="yyyy-MM-dd" /> 
						<b><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></b>
				</span>
				<br><br>
				<h6 align="right">
						<font color="#8C8C8C">${list.writer}님의 여행일지</font>
				</h6>
				<p class="content">
				${list.content}</p>
				<h6 align="right">
				<a href="boardUpdate.bd?num=${list.num}" class="deco">수정</a>&nbsp;&nbsp;
				<a href="boardDelete.bd?num=${list.num}" class="deco">삭제</a>
				</h6>
			</div>
		</div>
	</div>
	</c:forEach>
