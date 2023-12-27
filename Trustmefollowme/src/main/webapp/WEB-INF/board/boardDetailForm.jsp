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
</style>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<script>
$(function(){
	var likes = '${likeInfo.likes}'; /* 좋아요 기능 시작 */
	var bnum = '${likeInfo.b_num}';
	var mnum = '${likeInfo.m_num}';
	
	
	
	if (likes > 0) {
	    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart2.png");
	} else {
	    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart.png");
	}

    $("#heart").click(function(){   /* 하트 클릭했을 때 */
    	if(mnum == 'customer'){
    			alert("로그인이 필요합니다");
    			return false;
    	}
        $.ajax({				/* ajax로 값(회원,게시판 번호) 전송 */
            url: "likeCheck.bd",
            data: {
                m_num: mnum,
                b_num: bnum
            },
            success: function(data){
                if (data == "YES") {
                    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart2.png");
                    location.reload();
                } else {
                    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart.png");
                    location.reload();
											}
										}
									});
						}); /* 좋아요 기능 종료 */
						
						$(".reply").click(function() {		/* 댓글 클릭했을 때 시작 */
							if(mnum == 'customer'){
				    			alert("로그인이 필요합니다");
				    			return false;
				    	}
						    var ref = $(this).data("ref");
						    var reStep = $(this).data("re_step");
						    var reLevel = $(this).data("re_level");
						    var bNum = $(this).data("b_num");

						    $(".reply2").each(function() {
						        if (
						            $(this).data("ref") == ref &&
						            $(this).data("re_step") == reStep &&
						            $(this).data("re_level") == reLevel &&
						            $(this).data("b_num") == bNum
						        ) {
						            if ($(this).is(":visible")) {
						                $(this).hide();
						            } else {
						                $(this).show();
						            }
						        } else {
						            $(this).hide();
						        }
						    });
						});		/* 댓글 클릭했을 때 종료 */
						
	
	var mEmail = "${param.mEmail}";
	var jnum = "${param.jnum}";
	var minDate = "${param.minDate}";
		
    $(".replyDelete").click(function () {		/* 댓글 삭제 시작 */
        var ref = $(this).data("ref");
        var reStep = $(this).data("re_step");
        var reLevel = $(this).data("re_level");
        var bNum = $(this).data("b_num");
        $.ajax({
            url: "replyDelete.bd",
            data: {
                ref2: ref,
                reStep2: reStep,
                reLevel2: reLevel,
                bNum2: bNum
            },
            success: function (data) {
                if (data == "YES") {
                    alert("글이 삭제되었습니다.");
                    location.href = "boardDetail.bd?num=" + bNum + "&mEmail=" + mEmail + "&jnum=" + jnum + 
                    		"&minDate=" + minDate;
                } else {
                    alert("삭제 실패했습니다.");
                    location.href = "boardDetail.bd?num=" + bNum + "&mEmail=" + mEmail + "&jnum=" + jnum + 
            		"&minDate=" + minDate;
                }
            }
        });
    });											/* 댓글 삭제 종료 */
    
    $(".replyUpdate").click(function() {               /* 댓글 클릭했을 때 시작 */ 
        var ref = $(this).data("ref");
        var reStep = $(this).data("re_step");
        var reLevel = $(this).data("re_level");
        var bNum = $(this).data("b_num");

        $(".replyUpdate2").each(function() {
            if (
                $(this).data("ref") == ref &&
                $(this).data("re_step") == reStep &&
                $(this).data("re_level") == reLevel &&
                $(this).data("b_num") == bNum
            )  {
	            if ($(this).is(":visible")) {
	                $(this).hide();
	            } else {
	                $(this).show();
	            }
	        } else {
	            $(this).hide();
	        }
        });
		
    });			
        var content = document.getElementsByName("content");
        $("#sub").click(function(){
            if($(content).val() == ""){
				alert("댓글을 입력해주세요.");            	
            return false;
            }
        });


    $(".reply").click(function(){
    	$(".replyUpdate2").css("display", "none");
    });
    $(".replyUpdate").click(function(){
    	$(".reply2").css("display", "none");
    });
    $("#chat").click(function(){
    	$(".reply2").css("display", "none"),
    	$(".replyUpdate2").css("display", "none");
    });
    
   $("#sub2").click(function(){
	   alert("로그인 후 작성가능합니다.");
	   location.href="login.mb";
   })
   
   $(document.getElementsByName("noContent")).click(function(){
	   alert("로그인 후 작성가능합니다.");
	   location.href="login.mb";
   })
});
</script>


<nav class="navbar navbar-expand-xl nav_area sticky">
	<div class="container">
		<div class="logo">
			<a href="mainScreen.m" class="logo-light">
			나만 믿고 따라와!</a>
		</div>
		<div class="collapse navbar-collapse " id="navbarNav">
			<ul class="navbar-nav ml-auto navbar-center main_menu onepage_nav">
				<li class="nav-item"><a class="nav-link" href="mainScreen.m">메인</a>
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
<div class="top" style="display: inline-block; width: 100%; padding-bottom: 20px; padding-top: 20px;" align="center">
		<img class="img"
			src="<%=request.getContextPath()%>/resources/images/${bb.image}" style="height: 270px; width: 270px;">
	<div
		style="display: inline-block; vertical-align: top; margin-left: 20px;">
		<h4 style="color: black; padding-top: 15px;">
			${bb.writer}님의 여행일지<br> ${bb.title}<br> 
			${dateCount}일 | ${minDate}일 ~ ${maxDate}일
		</h4>
		<hr>
		<div id="content"
			style="width: 600px; height: 80px;">
			${bb.content}</div>
			<c:if test="${bb.writer eq sessionScope.myname || sessionScope.myname eq '어드민'}">
			<div align="right" style="padding-top: 20px; padding-bottom: 20px;">
			<a href="boardUpdate.bd?num=${bb.num}&jnum=${bb.jnum}">수정</a>&nbsp;&nbsp;
			<a href="boardDelete.bd?num=${bb.num}&jnum=${bb.jnum}">삭제</a>
			</div>
			</c:if>
	</div>
</div>
<br><br><br>
<div class="heart">
	조회수 ${bb.readcount}&nbsp;&nbsp; 좋아요 ${likecount} 
	<img id="heart" width="20px" height="20px">
</div>
<br><br>
	<center>
	<c:set var="count" value="1"/>
					<nav id="nav" style="width: 100%">
						<ul>
				<c:forEach var="date" items="${fn:split(date,',')}">
				<input type="hidden" name="date" value="${date}">
							<li><a href="boardDetail.bd?num=${param.num}&jnum=${param.jnum}&mEmail=${param.mEmail}&minDate=${date}" class="active">${count}Day</a></li>
				<c:set var="count" value="${count+1}"/>
				</c:forEach>
						</ul>
					</nav>
					
					<div style="padding-top: 110px;">
					<c:forEach var="bd"  items="${list}" varStatus="a">
					<div align="left">
					<div style="display: inline-block; margin-left: 700px;">
                    <img class="img" src="<%=request.getContextPath()%>/resources/images/${bd.image}" width="300px" height="300px">
					</div>
               		<h4 style="display: inline-block; margin-left: 100px;">${bd.name}
               		<br><br>${bd.address}
               		<br><br><br><br>
               		</h4>
					</div>
					<c:if test="${not a.last}">
					<div style="padding-top: 50px; padding-bottom: 50px; margin-left: 780px" align="left">
					<img src="<%=request.getContextPath()%>/resources/images/a.png" width="40px" height="50px">
					<span style="padding-left: 200px;">거리 : dd km / 00 분</span></div>
					</c:if>
               		</c:forEach> 
					</div>
	
			<br>
	<hr color="#D5D5D5">
	<div style="padding-top: 30px;">
	<c:if test="${likeInfo.m_num eq 'customer'}">
			<textarea id="chat" rows="1" cols="38" name="noContent"
				placeholder="글 남기기" style="resize: none;"></textarea>
			<input id="sub2" type="button" value="확인">
	</c:if>
	<c:if test="${likeInfo.m_num != 'customer'}">
		<form action="chatInsert.bd">
			<input type="hidden" name="b_num" value="${bb.num}">
			<input type="hidden" name="mEmail" value="${param.mEmail}">
			<input type="hidden" name="jnum" value="${param.jnum}">
			<input type="hidden" name="minDate" value="${param.minDate}">
			<input type="hidden" name="writer" value="${sessionScope.myname}">
			<textarea id="chat" rows="1" cols="38" name="content"
				placeholder="글 남기기" style="resize: none;"></textarea>
			<input id="sub" type="submit" value="확인">
		</form>
	</c:if>
	</div>
	<br><br>
<div class="cut" style="width: 50%;">
		<table>
		<c:if test="${empty lists}">
			<tr>
				<td>댓글이 없습니다.
			</tr>
		</c:if>
			<c:forEach var="chat" items="${lists}">
				<tr>
					<td>
						<div class="total"style="">						<!-- 댓글 리스트 -->
						<div style="display: inline-block;">
							<c:if test="${chat.re_level > 0}">
								<img
									src="<%=request.getContextPath()%>/resources/images/blank.png"
									width="${chat.re_level * 20}" height="30px;">
								<img src="<%=request.getContextPath()%>/resources/images/re.png"
									width="30px">
							</c:if>
						</div>
							<div style="display: inline-block;">
								${chat.writer}
								<div class="content"><br>${chat.content}
								<br><br>
									<div style="padding-bottom: 5px;">
									<fmt:parseDate var="date" value="${chat.reg_date}"
									pattern="yyyy-MM-dd" />
								<font color="gray"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></font>
									</div>
								</div>
								
								<a class="reply" data-ref="${chat.ref}"
									data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
									data-b_num=${chat.b_num }>답글 </a>
							</div>
							<c:if test="${sessionScope.myname eq chat.writer}">
							<div class="updel">
								<span class="replyDelete" data-ref="${chat.ref}"
									data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
									data-b_num=${chat.b_num }> 삭제 </span> &nbsp;&nbsp; 
									<span class="replyUpdate" data-ref="${chat.ref}"
									data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
									data-b_num=${chat.b_num }> 수정 </span>
							</div>
							</c:if>
						</div> 
						<span class="reply2" style="display: none;"
						data-ref="${chat.ref}" data-re_step="${chat.re_step}"
						data-re_level="${chat.re_level}" data-b_num=${chat.b_num }>		<!-- 답글 쓰기 -->
							<form action="replyInsert.bd">
								<input type="hidden" name="b_num" value="${bb.num}"> 
								<input type="hidden" name="writer" value="${sessionScope.myname}"> 
								<input type="hidden" name="ref" value="${chat.ref}"> 
								<input type="hidden" name="re_level" value="${chat.re_level}">
								<input type="hidden" name="re_step" value="${chat.re_step}">
								<input type="hidden" name="mEmail" value="${param.mEmail}">
								<input type="hidden" name="jnum" value="${param.jnum}">
								<input type="hidden" name="minDate" value="${param.minDate}">
								<br>
								<textarea id="chat" rows="1" cols="38" name="content"
									placeholder="답글쓰기" style="resize: none;" maxlength="500"></textarea>
								<input id="sub" type="submit" value="확인">
							</form>
					</span> 
					<span class="replyUpdate2" style="display: none;"
						data-ref="${chat.ref}" data-re_step="${chat.re_step}"
						data-re_level="${chat.re_level}" data-b_num=${chat.b_num }>		<!-- 답글 수정 -->
							<form action="replyUpdate.bd">
								<input type="hidden" name="b_num" value="${bb.num}"> 
								<input type="hidden" name="writer" value="${sessionScope.myname}"> 
								<input type="hidden" name="ref" value="${chat.ref}"> 
								<input type="hidden" name="re_level" value="${chat.re_level}">
								<input type="hidden" name="re_step" value="${chat.re_step}">
								<input type="hidden" name="mEmail" value="${param.mEmail}">
								<input type="hidden" name="jnum" value="${param.jnum}">
								<input type="hidden" name="minDate" value="${param.minDate}">
								<br>
								<textarea id="chat" rows="1" cols="38" name="content"
									placeholder="수정하기" style="resize: none;" maxlength="500"></textarea>
								<input id="sub" type="submit" value="수정">
							</form>
					</span> <br>
					<br>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div style="height: 200px;"></div>
	</center>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrollex.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrolly.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/browser.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/breakpoints.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/assets/js2/main.js"></script>