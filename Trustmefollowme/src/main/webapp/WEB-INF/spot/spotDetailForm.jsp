<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="detailBoot.jsp"%>

		
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
		        			<div class="product-name">${sb.name}</div>
		        			<div class="reviews-counter">
								<div class="rate">
								    <input type="radio" id="star5" name="rate" value="5"/>
								    <label for="star5" title="text">5 stars</label>
								    <input type="radio" id="star4" name="rate" value="4"/>
								    <label for="star4" title="text">4 stars</label>
								    <input type="radio" id="star3" name="rate" value="3"/>
								    <label for="star3" title="text">3 stars</label>
								    <input type="radio" id="star2" name="rate" value="2"/>
								    <label for="star2" title="text">2 stars</label>
								    <input type="radio" id="star1" name="rate" value="1"/>
								    <label for="star1" title="text">1 star</label>
								  </div>
								<span>3 Reviews</span>
							</div>
		        			<div class="product-price-discount">${sb.address}</div>
		        		</div>
	        			<p>
	        			${sb.content}
	        			</p>
	        		
	        		</div>
	        	</div>
	        </div>
	        <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">소개</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">Reviews (0)</a>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
				  		${sb.address}
				  		
				  	</div>
				  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				  		<div class="review-heading">REVIEWS</div>
				  		<p class="mb-20">There are no reviews yet.</p>
				  		<form class="review-form">
		        			<div class="form-group">
			        			<label>Your rating</label>
			        			<div class="reviews-counter">
									<div class="rate">
									    <input type="radio" id="star5" name="rate" value="5" />
									    <label for="star5" title="text">5 stars</label>
									    <input type="radio" id="star4" name="rate" value="4" />
									    <label for="star4" title="text">4 stars</label>
									    <input type="radio" id="star3" name="rate" value="3" />
									    <label for="star3" title="text">3 stars</label>
									    <input type="radio" id="star2" name="rate" value="2" />
									    <label for="star2" title="text">2 stars</label>
									    <input type="radio" id="star1" name="rate" value="1" />
									    <label for="star1" title="text">1 star</label>
									</div>
								</div>
							</div>
		        			<div class="form-group">
			        			<label>Your message</label>
			        			<textarea class="form-control" rows="10"></textarea>
			        		</div>
			        		<div class="row">
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Name*">
					        		</div>
					        	</div>
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Email Id*">
					        		</div>
					        	</div>
					        </div>
					        <button class="round-black-btn">Submit Review</button>
			        	</form>
				  	</div>
				</div>
			</div>
		</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>