<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="../common/common.jsp"%>
<%@include file="adminHeader.jsp"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAT roomDetailPage</title>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/global-header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/global-footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/rooms-and-suites.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.webp"
	type="image/x-icon">
<!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
</head>
<body>
	${fn:length(lists)}

	<c:if test="${cate == 'hotel'}">
		<c:forEach var="hotel" items="${lists}">

			<div class="col col-4">
				<a
					href="hotelDetail.ht?hnum=${hotel.hnum}&pageNumber=${pageInfo.pageNumber}">
					<img
					src="<%=request.getContextPath()%>/resources/images/${hotel.image}"
					alt="" class="rooms-img" width="400" height="350">
				</a>
				<h3 class="room-title">${hotel.name }</h3>

				<div>
					<div class="details-container">
						<p class="list-text">${hotel.address }</p>
					</div>
					<br> <br>
					<div class="details-container">
						<img
							src="<%=request.getContextPath()%>/resources/images/check-square.svg"
							alt="tick" class="list-icon">
						<p class="list-text">${hotel.facility}</p>
					</div>
				</div>

				<p class="amount-text">￦${hotel.hprice} ~</p>

				<div class="buttons-container">
					<a
						href="hotelUpdate.ht?hnum=${hotel.hnum}&pageNumber=${pageInfo.pageNumber}"
						class="btn btn-ghost">수정</a> <a
						href="hotelDelete.ht?hnum=${hotel.hnum}&pageNumber=${pageInfo.pageNumber}"
						class="btn btn-fill">삭제</a>
				</div>

				<br>
				<br>
			</div>
			<br>
		</c:forEach>

	</c:if>

	<c:if test="${cate == 'spot'}">
		<table align="center" border="1">
	<tr>
		<td align="right" colspan="3">
			<button id="btn_open_modal" onclick="spotInsert.sp">추가</button>
		</td>
	</tr>
	<tr align="center">
	<c:set var="count" value="0"/>
	<c:set var="path" value="<%=request.getContextPath() %>"/>
	<c:forEach var="spot" items="${lists }">
		<c:set var="count" value="${count+1 }"/>
		<td>
			<a id="btn_open_modal" href="spotDetail.sp?snum=${spot.snum }&pageNumber=${paging.pageNumber }">
				<img src="${path }/resources/images/${spot.image }" width="80" height="80" align="top">
			</a><br>
			<h3>${spot.name }</h3><br>
			${spot.address }<br>
			<input type="button" onclick="spotDelete.sp?snum=${spot.snum }" value="수정">
			<input type="button" onclick="spotUpdate.sp?snum=${spot.snum }" value="삭제">
			<input type="checkbox" name="rowcheck" value="${spot.snum }">
			
		</td>

	</c:forEach>
	</tr>
</table>
</c:if>

<c:if test="${cate == 'restaurant'}">
<c:forEach var="rest" items="${lists}">
								<div class="col-sm-6 col-lg-4">
									<div class="box">
										<div>
											<div class="img-box">
												<a href="restDetail.re?rnum=${rest.rnum}"> 
												<img src="<%=request.getContextPath()%>/resources/images/${rest.image}" alt="이미지" width="30" height="30">
												</a>
											</div>
											<div class="detail-box">
												<h5>이름: ${rest.name}</h5>
												<div class="options">
													<h6>주소: ${rest.address}</h6>
												</div>
												<div class="options">
													<h6>연락처: ${rest.rtel1} - ${rest.rtel2} - ${rest.rtel3}</h6>
												</div>
												<div class="options">
													<h6>${rest.rtime1}시~${rest.rtime2}시</h6>
												</div>
												<div align="right">
													<a href="restUpdate.re?rnum=${rest.rnum}"><font
														color="white">수정</font></a>&nbsp;&nbsp; 
														<a href="restDelete.re?rnum=${rest.rnum}">
														<font color="white">삭제</font>
														</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

</c:if>
	
	<c:if test="${cate == 'cafe'}">
		<c:forEach var="cafe" items="${lists}">

			<div class="col col-4">
				<a
					href="hotelDetail.ht?hnum=${cafe.cnum}&pageNumber=${pageInfo.pageNumber}">
					<img
					src="<%=request.getContextPath()%>/resources/images/${cafe.image}"
					alt="" class="rooms-img" width="400" height="350">
				</a>
				<h3 class="room-title">${cafe.name }</h3>

				<div>
					<div class="details-container">
						<p class="list-text">${cafe.address }</p>
					</div>
					<br> <br>
					<div class="details-container">
						<img
							src="<%=request.getContextPath()%>/resources/images/check-square.svg"
							alt="tick" class="list-icon">
						<p class="list-text">${cafe.ctel1}</p>
						<p class="list-text">${cafe.ctel2}</p>
						<p class="list-text">${cafe.ctel3}</p>
					</div>
				</div>

				<p class="amount-text">${cafe.ctime1} ~ ${cafe.ctime2}</p>

				<div class="buttons-container">
					<a
						href="hotelUpdate.ht?hnum=${cafe.cnum}&pageNumber=${pageInfo.pageNumber}"
						class="btn btn-ghost">수정</a> <a
cafe						class="btn btn-fill">삭제</a>
				</div>

				<br>
				<br>
			</div>
			<br>
		</c:forEach>

	</c:if>
	
	<c:if test="${cate == 'member'}">
		<c:forEach var="member" items="${lists}">

			<div class="col col-4">
				<a
					href="hotelDetail.ht?hnum=${member.num}&pageNumber=${pageInfo.pageNumber}">
				</a>
				<p>${member.email }</p>
				<p>${member.password }</p>
				<h3 class="room-title">${member.name }</h3>

				<div>
					<div class="details-container">
						<p class="list-text">${member.birth }</p>
					</div>
					<br> <br>
					<div class="details-container">
						<img
							src="<%=request.getContextPath()%>/resources/images/check-square.svg"
							alt="tick" class="list-icon">
						<p class="list-text">${member.address1}/${member.address2}</p>
					</div>
				</div>

				<p class="amount-text">￦${member.mtel} ~</p>

				<div class="buttons-container">
					<a
						href="hotelUpdate.ht?hnum=${member.num}&pageNumber=${pageInfo.pageNumber}"
						class="btn btn-ghost">수정</a> <a
						href="hotelDelete.ht?hnum=${member.num}&pageNumber=${pageInfo.pageNumber}"
						class="btn btn-fill">삭제</a>
				</div>

				<br>
				<br>
			</div>
			<br>
		</c:forEach>

	</c:if>
	
	<script src="<%=request.getContextPath()%>/resources/js/switchRooms.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/toggleHamburger.js"></script>
</body>


</html>

