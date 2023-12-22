<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style>
img {
	border-radius: 30px;
	width: 300px;
	height: 200px;
}
.page{
	display: inline-block;
	width: 33%;
	text-align: center;
	margin-top: 50px;
    box-shadow: 1px 1px 1px rgba(231,231,231,0.4);
    border: 1px solid;
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
    margin-bottom: 20px;
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
	padding-top: 20px;
}
.contents{
	margin: auto;
	width: 70%;
}
#btn{
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:6px 13px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
#btn:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
#btn:active {
	position:relative;
	top:1px;
}
	
#arr{
	text-decoration: none;
	color: black;
}
#allarr{
	text-align: right;
	margin-right: 150px;
}
.column {
  width: 80px;
  height: 30px;
  border-radius: 4px;
  padding-left: 10px;
}
.keyword{
	border-color: #EDEDED;
}
.login{
	text-align: right;
	margin-right: 150px;
}
</style>

	<div class="ptext">
		<span> <font color="#6D6CFF"> 여행 일지 </font>
		</span>
		<span>
		<h2>
			나의 여행을 소개합니다.
		</h2>
		</span>
	</div>
	<br><br>
		<form action="boardList.bd" method="get" align="center">
				<select name="WhatColumn" class="column">
						<option value="all">전체 
						<option value="title">제목
						<option value="content">내용
					</select>
					<input type="text" name="keyword" class="keyword" placeholder="검색">
					<input id="btn" type="submit" value="검색">
					<c:choose>
						<c:when test="${empty sessionScope.myname}">
					<div class="login">
						<a href="login.mb" id="btn">로그인</a>
					</div>
						</c:when>
						<c:otherwise>
					<div class="login">
							<a href="" style="text-decoration: none;">${sessionScope.myname}</a>님
					</div>
						</c:otherwise>
					</c:choose>
			</form>
			
	<div id="allarr">
	<button id="btn">
		<a href="boardList.bd" id="arr">등록순</a>
	</button>
	<button id="btn">
		<a href="likesList.bd" id="arr">좋아요⬆</a>
	</button>
	<button id="btn">
		<a href="readCount.bd" id="arr">조회수⬆</a>
	</button>
	<button id="btn">
		<a href="boardInsert.bd" id="arr">추가</a>
	</button>
	</div>
	<c:forEach var="list" items="${lists}">
		<div class="page">
			<h3>
					<a href="boardDetail.bd?num=${list.num}&mEmail=${list.mEmail}&jnum=${list.jnum}" class="deco">
					${list.title}
					</a>
				</h3>
			<a href="boardDetail.bd?num=${list.num}&mEmail=${list.mEmail}&jnum=${list.jnum}"> 
			<img src="<%=request.getContextPath()%>/resources/images/${list.image}"
				alt="이미지"/>
			</a>
			<div>
			<br>
		<div class="contents">
				<span>
					<fmt:parseDate var="date" value="${list.reg_date}" pattern="yyyy-MM-dd" /> 
						<b><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></b>
				</span>
				<h6 align="right">
						<font color="#8C8C8C">${list.writer}님의 여행일지</font>
				</h6>
				<p class="content">
				${list.content}</p>
				<c:if test="${list.writer eq sessionScope.myname}">
				<h6 align="right">
				<a href="boardUpdate.bd?num=${list.num}" class="deco">수정</a>&nbsp;&nbsp;
				<a href="boardDelete.bd?num=${list.num}" class="deco">삭제</a>
				</h6>
				</c:if>
			</div>
		</div>
	</div>
	</c:forEach>
