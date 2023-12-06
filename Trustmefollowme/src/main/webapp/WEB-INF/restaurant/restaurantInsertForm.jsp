<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	background-color: #D4F4FA;
}

.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>



</head>
<body>
	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-md-4">

				<h1 class="text-center text-success">음식점 추가</h1>
				<br>
				<div class="col-sm-12">
					<br>

					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">

							<form:form action="restInsert.re" method="post"
								commandName="restaurantBean" enctype="multipart/form-data">

								<div class="form-group">
									<input type="text" class="form-control" name="name"
										placeholder="이름" value="${restaurantBean.name}">
									<form:errors cssClass="err" path="name" />
								</div>

								<div class="form-group">
									<input type="text" class="form-control" name="r_xpos"
										placeholder="위도" value="${restaurantBean.r_xpos}">
									<form:errors cssClass="err" path="r_xpos" />
								</div>

								<div class="form-group">
									<input type="" text"" class="form-control" name="r_ypos"
										placeholder="경도" value="${restaurantBean.r_ypos}">
									<form:errors cssClass="err" path="r_ypos" />
								</div>

								<div class="form-group">
									<input type="text" class="form-control" name="address"
										placeholder="장소" value="${restaurantBean.address}">
									<form:errors cssClass="err" path="address" />
								</div>

								<div class="form-group">
									<b>이미지</b> <input type="file" name="imgUpload">
									<form:errors cssClass="err" path="image" />
								</div>

								<div class="form-group">
									<select name="rtel1">
										<c:set var="rtel">02,031,064</c:set>
										<c:forEach var="rtel" items="${rtel}">
											<option value="${rtel}"
												<c:if test="${rtel eq restaurantBean.rtel1}">selected</c:if>>${rtel}
										</c:forEach>
									</select> -
									<form:errors cssClass="err" path="rtel1" />

									<input type="text" " name="rtel2" size="20" placeholder="1234"
										maxlength="4" value="${restaurantBean.rtel2}"> -
									<form:errors cssClass="err" path="rtel2" />
									<input type="tel" name="rtel3" size="20" placeholder="5678"
										maxlength="4" value="${restaurantBean.rtel3}">
									<form:errors cssClass="err" path="rtel3" />
								</div>

								<div class="form-group">
									<b>영업 시작 시간</b> <input type="time" class="form-control"
										name="rtime1">
									<form:errors cssClass="err" path="rtime1" />
								</div>

								<div class="form-group">
									<b>영업 종료 시간</b> <input type="time" class="form-control"
										name="rtime2">
									<form:errors cssClass="err" path="rtime2" />
								</div>

								<div class="form-group">
									<b>개업일자</b> <input type="date" class="form-control"
										name="rdate">
									<form:errors cssClass="err" path="rdate" />
								</div>


								<button type="submit" class="btn btn-default btn-lg">등록</button>
								<button class=" pull-right btn-link">
									<a href="https://www.google.com">비밀번호 찾기</a>
								</button>
								<button class=" pull-right btn-link">
									<a href="https://www.naver.com">아이디 찾기</a>
								</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
