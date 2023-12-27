<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">
#id {
	border-radius: 30px;
	border-color: silver;
}

.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}

#btn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 13px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

#btn:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

#btn:active {
	position: relative;
	top: 1px;
}

#title, textarea {
	border-color: #EAEAEA;
	box-shadow: 1px 1px 1px gray inset;
}

textarea:focus, #title:focus {
	outline: 1px solid #F8FFFF;
}

#logo {
	width: 60px;
	height: 40px;
}

#date {
	font-size: 20px;
}

textarea {
	white-space: normal;
}
</style>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/main.css" />


<nav style="background: #A6A6A6" class="navbar navbar-expand-xl nav_area sticky">
	<div class="container">
		<a href="mainScreen.m" class="logo-light"> <img id="logo"
			alt="이미지"
			src="<%=request.getContextPath()%>/resources/images/logo.png">
			<h5 style="display: inline-block;">나만 믿고 따라와!</h5></a>
		<div class="collapse navbar-collapse " id="navbarNav">
			<ul class="navbar-nav ml-auto navbar-center main_menu onepage_nav">
				<li class="nav-item"><a class="nav-link" href="mainScreen.m">메인</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="boardList.bd">목록보기</a></li>
				<c:if test="${sessionScope.myname eq '어드민'}">
					<li class="nav-item"><a class="nav-link" href="#contact">관리자</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
<br>
<br>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<center>

	<form:form action="boardInsert.bd" method="post"
		commandName="boardBean" enctype="multipart/form-data">
		<input type="hidden" name="jnum" value="${jnum}">
		<input type="hidden" name="writer" value="${sessionScope.myname}">
		<input type="hidden" name="mEmail" value="${myemail}">
		<input type="hidden" name="minDate" value="${minDate}">
		<input type="hidden" name="maxDate" value="${maxDate}">
		<input type="file" name="imgUpload" value="${boardBean.image}">
		<br>
		<form:errors cssClass="err" path="image" />
		<br>
		<br>
		<input id="title" type="text" name="title" placeholder="제목을 작성해주세요"
			maxlength="100" value="${boardBean.title}">
		<form:errors cssClass="err" path="title" />
		<br>
		<br>
		<textarea rows="20" cols="70" name="content"
			placeholder="내용을 작성해주세요. (500자 이내)" maxlength="500"
			style="resize: none;">${boardBean.content}</textarea>
		<br>
		<form:errors cssClass="err" path="content" />
		<br>
		<br>
		<input id="btn" type="submit" value="여정 공유하기">
	</form:form>



	<nav id="nav" style="width: 100%">
		<ul>
			<%-- 				<c:forEach var="date" items="${fn:split(date,',')}">
      			 <input type="hidden" name="date" value="${date}">
							<li><a id="${date}" href="boardInsert2.bd?jnum=${jnum}&minDate=${date}" class="active">${date}일</a></li>
				</c:forEach> --%>
			<li>1일차 공유 이미지↓</li>
		</ul>
	</nav>

	<div style="margin-top: 130px; margin-bottom: 30px;">
		<div id="date">${minDate}일~ ${maxDate}일</div>
	</div>
	<br>
	

  <link href="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.css" rel="stylesheet">

	<section id="services" class="services"
		style="background: white; height: 100%; width: 80%; margin: auto; margin-top: 40px;">
		<div class="container" data-aos="fade-up">
			<div class="row">
				<c:forEach var="myj" items="${list}">
					<div class="col-lg-4 col-md-6 align-items-stretch"
						data-aos="zoom-in" data-aos-delay="100"
						style="border-bottom: 1px solid #EAEAEA;">
						<i class="bi"></i> <img alt=""
							src="<%=request.getContextPath()%>/resources/images/${myj.image}"
							width="150px">
						<h4>
							<a href="">${myj.name}</a>
						</h4>
						<br>
						<h5>${myj.address}</h5>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>


</center>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	
	