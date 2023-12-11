<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
                        <a class="header-nav-link" href="javascript:history.go(-1)">Home</a>
                    </li>
                 </ul>
                  <!--   <li class="header-nav-list"><a class="header-nav-link header-active"
                            href="rooms-and-suites.html">Rooms and Suites</a></li>
                    <li class="header-nav-list"><a class="header-nav-link" href="facilities.html">Facilities</a></li>
                    <li class="header-nav-list"><a class="header-nav-link" href="contact-page.html">Contact Us</a></li>
                    <li class="header-nav-list"><a class="header-btn header-btn-custom" href="https://timbu.com/search?query=hotel">BOOK NOW</a></li>
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
                <h2 class="page-header">${hotel.name}</h2>
                <hr/>
                <p class="page-sub-header">
                   ${hotel.hcontent }
                </p>
            </div>

            <!-- Special offers section -->
            <section class="special-offers">
                <div class="row center-lg">
                    <div class="col image-col right-marg">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image2}" alt="room-image" class="small-image">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image3}" alt="room-image" class="small-image">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image4}" alt="room-image" class="small-image">
                        <div class="side-by-side-container">
                            <div class="large-image-container">
                                <img src="<%=request.getContextPath()%>/resources/images/${hotel.image}" alt="room-image-large" class="large-image">
                            </div>
                            <section class="stacked-image-container">
                              <div><img src="<%=request.getContextPath()%>/resources/images/${hotel.image5}" alt="room-image" class="small-image"></div>
                              <div><img src="<%=request.getContextPath()%>/resources/images/${hotel.image6}" alt="room-image" class="small-image"></div>
                            </section>
                        </div>
                    </div>
                    <div class="col">
                        <h3 class="offers-title">${hotel.name}</h3>
                        <p class="offers-sub-title">
                            ${hotel.address }
                        </p>
                        <ul class="offers-list">
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">tel :${hotel.htel}</p>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">${hotel.facility}</p>
                                </div>
                            </li>
                        </ul>
                        <a href="#" class="btn btn-fill btn-large">Cart</a>
                    </div>
                </div>
            </section>

            <!-- Rooms -->
            <section class="rooms-section">
               <div class="page-header-container">
                <h2 class="page-header">Rooms</h2>
                <hr/>
                </div>
                <div class="row center-lg">
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image2}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname1 }</h3>
                       <!--  <p class="room-text">Designed specifically for Practicality and <br> comfort</p> -->
                      <%--   <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div> --%>
                        <p class="amount-text">￦${hotel.rprice1 }</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image3}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname2 }</h3>
                       <!--  <p class="room-text">Designed specifically for Practicality and <br> comfort</p> -->
                     <%--    <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/bed.png" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div> --%>
                        <p class="amount-text">￦${hotel.rprice2 }</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image4}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname3 }</h3>
                       <!--  <p class="room-text">Designed specifically for Practicality and <br> comfort</p> -->
                     <%--    <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/bed.png" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div> --%>
                        <p class="amount-text">￦${hotel.rprice3 }</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image5}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname4 }</h3>
                        <!-- <p class="room-text">Designed specifically for Practicality and <br> comfort</p> -->
                <%--         <div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">2 Persons</p>
                            </div>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/img/bed.png" alt="tick" class="list-icon">
                                <p class="list-text">1 Kingsize bed</p>
                            </div>
                        </div> --%>
                        <p class="amount-text">￦${hotel.rprice4 }</p>
                        <div class="buttons-container">
                            <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a>
                        </div>
                    </div>
                </div>
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
</body>

</html>