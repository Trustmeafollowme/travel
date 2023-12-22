<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header {
	background-color: #fff;
	z-index: 999999;
	box-shadow: 1px -5px 24px #776b6bcc;
	padding: 17px 0px;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .main_menu li a {
	color: #000;
	transition: .6s;
	opacity: .7;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .main_menu li:hover a
	{
	color: #F24259;
}

.navbar.navbar-expand-xl.nav_area.sticky .logo-light {
	display: inline-block;
}

.navbar.navbar-expand-xl.nav_area.sticky .logo-dark {
	display: none;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .logo-light {
	display: none;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .logo-dark {
	display: inline-block;
}

.nav_area {
	position: fixed;
	left: 0;
	right: 0;
	z-index: 9999;
	padding: 22px 0px;
	transition: .6s;
}

.logo {
	height: 41px;
	padding: 7px 0px;
}

.logo-light {
	font-size: 22px;
	font-weight: 700;
}

.logo-light:hover {
	text-decoration: none;
	color: #111;
}

.logo-dark {
	font-size: 22px;
	font-weight: 700;
	color: #111;
}

.logo-dark:hover {
	text-decoration: none;
	color: #111;
}

.main_menu li a:hover {
	color: #F24259;
}

.main_menu li a {
	color: #111;
	font-size: 14px;
}

.main_menu .blk_btn {
	background-color: #F24259;
	color: #fff;
	margin-left: 13px;
	border-radius: 50px;
	padding: 10px 17px;
	transition: all .6s;
}

.main_menu a {
	text-decoration: none;
}

.navbar-nav.ml-auto.navbar-center.main_menu.onepage_nav li.active a {
	color: #F24259;
}

#chat {
	border: none;
	border-bottom: 1px solid;
}

#sub, #sub2 {
	border: none;
	height: 25px;
}

.cut {
	height: 500px;
	overflow: auto;
	white-space: normal;
}

.cut::-webkit-scrollbar {
	width: 10px;
}

.cut::-webkit-scrollbar-thumb {
	background-color: black;
}

.cut::-webkit-scrollbar-track {
	background-color: #D5D5D5;
}

.content {
	white-space: normal;
	width: 600px;
}

#content {
	text-align: center;
	height: 100px;
	width: 100%;
	overflow: auto;
	margin: auto;
}

#content::-webkit-scrollbar {
	width: 10px;
}

#content::-webkit-scrollbar-thumb {
	background-color: black;
}

#content::-webkit-scrollbar-track {
	background-color: #D5D5D5;
}

table {
	white-space: nowrap;
	border-collapse: separate;
}

.img {
	width: 200px;
	height: 200px;
	border-radius: 20%;
	box-shadow: 1px 1px 1px 1px gray;
}

.updel {
	text-align: right;
	padding-right: 30px;
}

.total {
	display: inline-block;
	border-bottom: 1px solid #BDBDBD;
	padding-bottom: 10px;
}


.heart {
	text-align: right;
	margin-right: 20%;
}

.top {
	background-image:  url("<%=request.getContextPath()%>/resources/images/1.jpg");
	background-size: cover;
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
#choose{
    position: sticky;
    top:0;
}
.share{
	text-align: center;
}
.share2{
	margin: 100px;
	width: 300px;
	height: 150px;
}
textarea {
	text-align: center;
	height: 100px;
	width: 100%;
	overflow: auto;
	margin: auto;
}

textarea::-webkit-scrollbar {
	width: 10px;
}

textarea::-webkit-scrollbar-thumb {
	background-color: black;
}

textarea::-webkit-scrollbar-track {
	background-color: #D5D5D5;
}
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<nav class="navbar navbar-expand-xl nav_area sticky">
	<div class="container">
		<div class="logo">
			<a href="" class="logo-light">
			나만 믿고 따라와!</a>
		</div>
		<div class="collapse navbar-collapse " id="navbarNav">
			<ul class="navbar-nav ml-auto navbar-center main_menu onepage_nav">
				<li class="nav-item"><a class="nav-link" href="#home">메인</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="boardList.bd"><font color="black">목록보기</font></a>
				</li>
				<c:if test="${sessionScope.myname eq '어드민'}">
				<li class="nav-item"><a class="nav-link" href="#contact">관리자</a>
				</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
<form:form action="mainJourney.m" method="post" enctype="multipart/form-data" commandName="boardBean">
	<input type="hidden" name="writer" value="${sessionScope.myname}">
	<input type="hidden" name="memail" value="${sessionScope.myemail}">
		<form:errors cssClass="err" path="writer"/><br><br>
<div class="top" style="display: inline-block; width: 100%; margin-top: 20px;" align="center">
		<img class="img" style="height: 150px; width: 150px;">
		<input type="file" name="imgUpload">
		<form:errors path="image"/>
	<div
		style="display: inline-block; vertical-align: top;">
		<h4 style="color: black; padding-top: 15px;">
			${sessionScope.myname}님의 여행일지<br> ${bb.title}<br> 3일 |
			<fmt:parseDate var="startDate" value="${bb.reg_date}"
				pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
			~
			<fmt:parseDate var="endDate" value="${bb.reg_date}"
				pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
		</h4>
		<hr>
		<textarea rows="30" cols="40" maxlength="500" name="content" placeholder="내용을 입력해주세요."></textarea>
		<form:errors path="content"/>
	</div>
</div>

<nav id="nav" style="width: 100%">
						<ul>
							<br>
					<c:forEach var="bd" begin="0" end="${jnum-1}">
							<input type="hidden" name="jnum" value="${jnum}">
							<li><a href="#${bd}" class="active">${bd+1}번째 여정</a></li>
				</c:forEach>
						</ul>
					</nav>
					
<div class="share">
	<c:forEach var="bd" begin="0" end="${jnum-1}">
	<div class="share2" id="${bd}" style=" border: 1px solid; display: inline-block; margin-top: 120px;">
	${bd+1}번째 여정
	<br><br>
	<div><img src="<%=request.getContextPath()%>/resources/images/bjeju.jpg" width="100px" height="100px"></div>
		<div><a href="boardInsert2.bd?jnum=${bd}">이동</a></div>
	</div>
	</c:forEach>
</div>
			
			
	<input type="submit" value="추가">
</form:form>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrollex.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrolly.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/browser.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/breakpoints.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/main.js"></script>