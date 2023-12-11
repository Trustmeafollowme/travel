<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../common/common.jsp"%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FAT roomDetailPage</title>
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global-header.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global-footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/rooms-and-suites.css">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.webp" type="image/x-icon">
</head>
<body>
    <header>
        <div class="header-container">
            <nav class="header-nav-bar">
                <div class="header-nav-logo">
					<a href="javascript:history.go(-1)">
						FAT LOGO
					</a>
				</div>
               <ul class="header-nav-lists">
                    <li class="header-nav-list">
                        <a class="header-nav-link" href="hotelInsert.ht">Insert</a>
                    </li>
                  </ul>
               <!--      <li class="header-nav-list"><a class="header-nav-link header-active"
                            href="hotelInsert.ht">Insert Hotel</a></li>
                    <li class="header-nav-list"><a class="header-nav-link" href="facilities.html">Update Hotel</a></li>
                    <li class="header-nav-list"><a class="header-nav-link" href="contact-page.html">Delete Hotel</a></li>
                    <li class="header-nav-list"><a class="header-btn header-btn-custom" href="">cart my travel</a></li>
                </ul> -->

                <div class="header-hamburger-icon">
                    <div class="header-hamburger-line-1"></div>
                    <div class="header-hamburger-line-2"></div>
                    <div class="header-hamburger-line-3"></div>
                </div>
            </nav>

    </header>
    	
    <main>
        <div class="container">

            <!-- Top Text -->
            <div class="page-header-container">
                <h2 class="page-header">여정의 시작은 호텔!</h2>
                <hr />
                <p class="page-sub-header" style="font-size: 15px;">
                    나.믿.따에서 여러 호텔을 한눈에 담아보세요!
                </p>
            <br>
		<%-- <form action="hotelList.ht" method="get">
			<select name="WhatColumn">
				<option value="all">전체 검색
				<option value="name">이름 검색
				<option value="facility">부대시설 검색
			</select><br> 
			<input type="text" name="keyword">
			<br>
			 <input type="submit" value="검색">
			 <input type="button" value="추가하기" onClick="location.href='hotelInsert.ht'">
			 <br><br><br><br>
			 <c:if test="${fn:length(list)==0 }">
			검색한 레코드가 없습니다.
			</c:if>
		</form> --%>
		
            <!-- Special offers section -->
            <%-- <section class="special-offers">
                <div class="row center-lg">
                    <div class="col image-col right-marg">
                        <img src="<%=request.getContextPath()%>/resources/img/hotel-1.webp" alt="room-image" class="small-image">
                        <img src="<%=request.getContextPath()%>/resources/img/hotel-2.webp" alt="room-image" class="small-image">
                        <img src="<%=request.getContextPath()%>/resources/img/hotel-3.webp" alt="room-image" class="small-image">
                        <div class="side-by-side-container">
                            <div class="large-image-container">
                                <img src="<%=request.getContextPath()%>/resources/img/hotel-4-large.webp" alt="room-image-large" class="large-image">
                            </div>
                            <section class="stacked-image-container">
                              <div><img src="<%=request.getContextPath()%>/resources/img/hotel-5.webp" alt="room-image" class="small-image"></div>
                              <div><img src="<%=request.getContextPath()%>/resources/img/hotel-6.webp" alt="room-image" class="small-image"></div>
                            </section>
                        </div>
                    </div>
                    <div class="col">
                        <h3 class="offers-title">Special Offers</h3>
                        <p class="offers-sub-title">
                            Get 10% discount off this city view- standard room. <br> Offers valid till june 31st 2020
                        </p>
                        <ul class="offers-list">
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">Free Wi-Fi Service</p>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">Best Rate Guarantee</p>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">Free DSTV Access</p>
                                </div>
                            </li>
                        </ul>
                        <a href="#" class="btn btn-fill btn-large">View More</a>
                    </div>
                </div>
            </section> --%>

            <!-- Rooms -->
            <section class="rooms-section">
            <c:forEach var="hb" items="${list}">
               <!--  <div class="row room-section-header-container">
                    <div class="col col-3">
                        <h4 class="room-section-header active-header" id="standard-room">Standard Rooms</h4>
                    </div>
                    <div class="col col-3">
                        <h4 class="room-section-header" id="executive-room">Executive Rooms</h4>
                    </div>
                    <div class="col col-3">
                        <h4 class="room-section-header" id="king-room">King Suites</h4>
                    </div>
                </div> -->
                <div class="row center-lg">
                    <div class="rooms col col-6">
                    	<a href="hotelDetail.ht?hnum=${hb.hnum}&pageNumber=${pageInfo.pageNumber}">
                        <img src="<%=request.getContextPath()%>/resources/images/${hb.image}"
                            alt="" class="rooms-img" width="400" height="350">
                            </a>
                        <h3 class="room-title">${hb.name }</h3>
                       <%--  <p class="room-text">${hb.content}</p> --%>
                        <div>
                            <div class="details-container">
                               <%--  <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon"> --%>
                                <p class="list-text">${hb.address }</p>
                            </div>
                            <br>
                            <br>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">${hb.facility}</p>
                            </div>
                        </div>
                        <p class="amount-text">￦${hb.hprice} ~</p>
                        <div class="buttons-container">
                            <a href="hotelUpdate.ht?hnum=${hb.hnum}&pageNumber=${pageInfo.pageNumber}" class="btn btn-ghost">수정</a>
                            <a href="hotelDelete.ht?hnum=${hb.hnum}&pageNumber=${pageInfo.pageNumber}" class="btn btn-fill">삭제</a>
                        </div>
                    </div>
                    </c:forEach>
              <%--       <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hb.image}"
                            alt="" class="rooms-img">
                        <h3 class="room-title">${hb.rname2}</h3>
                        <p class="room-text">Designed specifically for Practicality and <br> comfort</p>
                        <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/bed.png" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div>
                        <p class="amount-text">￦${hb.rprice2 }</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="https://res.cloudinary.com/start-ng/image/upload/v1591638448/Rectangle_44_anerdv.png"
                            alt="" class="rooms-img">
                        <h3 class="room-title">${hb.rname3 }</h3>
                        <p class="room-text">Designed specifically for Practicality and <br> comfort</p>
                        <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/bed.png" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div>
                        <p class="amount-text">￦${hb.rprice3}</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="https://res.cloudinary.com/start-ng/image/upload/v1591638449/Rectangle_45_mtl458.png"
                            alt="" class="rooms-img">
                        <h3 class="room-title">${hb.rname4 }</h3>
                        <p class="room-text">Designed specifically for Practicality and <br> comfort</p>
                        <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/bed.png" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div>
                        <p class="amount-text">￦${hb.rprice4}</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                </div> --%>
       
            </section>

        </div>
    </main>

    <footer class="footer">
		<div class="footer-container">
			<nav class="footer-nav">
				<div class="footer-description">
					<h3 class="footer-description-title">Star Hotels</h3>
					<p>Hospitality and Comfort are our watchwords</p>
				</div>
				<div class="footer-contact-us">
					<h3 class="footer-description-title">Contact Us</h3>
					<p class="footer-description-detail"> 
						<img src="<%=request.getContextPath()%>/resources/img/map-pin.svg" class="footer-description-icon" alt="star hotel location">

						<span>23, Fola Osibo, Lekki Phase 1</span></p>
					<p class="footer-description-detail">
						<img src="<%=request.getContextPath()%>/resources/img/phone.svg" class="footer-description-icon" alt="star hotels phone number"> 
						<span>
					 08185956620</span></p>
					<p class="footer-description-detail">
						<img src="<%=request.getContextPath()%>/resources/img/mail.svg" class="footer-description-icon" alt="star hotels email">
						<span>support@starhotels.com</span> </p>
				</div>
				<div class="footer-follow-us">
					<h3 class="footer-description-title">Follow Us</h3>
					<ul class="footer-follow-us-lists">
						<li class="follow-us-list">
							<a href="">
								<img src="<%=request.getContextPath()%>/resources/img/facebook.svg" alt="star hotels facebook page">
							</a>
						</li>
						<li class="follow-us-list">
							<a href="">
								<img src="<%=request.getContextPath()%>/resources/img/twitter.svg" alt="star hotels twitter page">
							</a>
						</li>
						<li class="follow-us-list">
							<a href="">
								<img src="<%=request.getContextPath()%>/resources/img/instagram.svg" alt="star hotels instagram page">
							</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</footer>
    <script src="<%=request.getContextPath()%>/resources/js/switchRooms.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/toggleHamburger.js"></script>
<div class="page">
${pageInfo.pagingHtml}
</div>
</body>
</html>