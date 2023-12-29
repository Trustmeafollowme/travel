<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>

<h1>관광지 수정</h1> 
	<%-- <p>
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
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="detailBoot.jsp"%>

		<form:form action="spotUpdate.sp" commandName="spotBean" method="post" enctype="multipart/form-data">
		<input type="hidden" name="snum" value="${spotBean.snum }">
		<input type="hidden" name="pageNumber" value="${pageNumber }">
		<div class="container">
	        <div class="heading-section">
	            <h2>${cate }</h2>
	        </div>
	        <div class="row">
	        	<div class="col-md-6">
	        		<div id="slider" class="owl-carousel product-slider">
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image2}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image3}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image4}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image5}" width="200px" height="300px">
						</div>
					</div>
					<div>　</div>
					<div id="thumb" class="owl-carousel product-thumb">
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image2}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image3}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image4}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image5}" width="200px" height="300px">
						</div>
					</div>
	        	</div>
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				<div class="product-info">
		        			<div class="product-name">이름: <input type="text" name="name" value="${spotBean.name }"></div>
		        			<div class="reviews-counter">
		        			<p class="product-price-discount">주소 : <input type="text" name="address" value="${spotBean.address }" size="50px">
		        			<br>
		        			좌표 : <input type="text" name="xpos" value="${spotBean.xpos }" placeholder="위도를 입력하세요">,
		<input type="text" name="ypos" value="${spotBean.ypos }" placeholder="경도를 입력하세요">
		        			<br>
		        			영업시간: <input type="text" name="address" value="${spotBean.stime }" size="50px"></p>
		        		</div>
	        			<p>
	        			내용 : 
						<textarea name="content" rows="10" cols="40">${spotBean.content }</textarea>
	        			</p>
	        		</div>
	        	</div>
	        </div>
		</div>
	</form:form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>