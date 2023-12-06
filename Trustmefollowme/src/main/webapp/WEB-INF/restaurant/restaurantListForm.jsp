<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
	<meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/favicon.png" type="">

  <title> Feane </title>

  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />

  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%=request.getContextPath()%>/resources/css/responsive.css" rel="stylesheet" />
<h1>restaurant.jsp</h1>

<style type="text/css">
#mainImg img {
	width: 150px;
	height: 150px;
	overflow: hidden;
	border-radius: 30%;
}

#mainImg:hover img {
	transition: all 0.15s linear;
	transform: scale(1.2);
}
</style>


	<form action="restaurantList.re" method="get">
		<select name="WhatColumn">
			<option value="all">전체 검색
			<option value="rname">이름 검색
			<option value="rlocation">장소 검색
		</select> <input type="text" name="keyword"> <input type="submit"
			value="검색">
	</form>
	<br>


<body>
  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          나믿따
        </h2>
      </div>

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".burger">Burger</li>
        <li data-filter=".pizza">Pizza</li>
        <li data-filter=".pasta">Pasta</li>
        <li data-filter=".fries">Fries</li>
      </ul>

      <div class="filters-content">
        <div class="row grid">
<c:set var="count" value="0"/>
<table class="restTable" width="920px">
<tr>
	<c:forEach var="rb" items="${lists}">
	<c:set var="count" value="${count+1}"/>
		<c:choose>
			<c:when test="${empty lists}">
				<tr>
					<td>음식점의 정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                 <img src="<%=request.getContextPath()%>/resources/images/${rb.rimage1}">
                </div>
                <div class="detail-box">
                  <h5>
                    ${rb.rname}
                  </h5>
                  <p>
                   ${rb.rlocation}
                  </p>
                  <p>
                  	${rb.rtel1}- ${rb.rtel2} - ${rb.rtel3}
                  </p>
                  <p>
                  	${rb.rtime1} 시 ~ ${rb.rtime2} 시
                  </p>
                  <p>
                  	${rb.rdate}
                  </p>
                  
				<c:if test="${count % 3 eq 0}">
					</tr><tr>
				</c:if>
                  <div class="options">
                    <h6>
                      $20
                    </h6>
                     <a href="">
                      <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                          <g>
                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                         c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                          </g>
                          <g>
                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                         C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                         c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                         C457.728,97.71,450.56,86.958,439.296,84.91z" />
                          </g>
                          <g>
                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                         c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                          </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
			</c:otherwise>
		</c:choose>
		</c:forEach>
	</tr>
</table>
</td>
</tr>
</table>
