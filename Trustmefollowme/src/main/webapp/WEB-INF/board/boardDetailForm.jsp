<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">
html {
	font-family: 'Ubuntu', sans-serif;
}

.filtering {
	margin-bottom: 54px;
}

a:focus {
	outline: 0 solid
}

a {
	display: inline-block
}

a:hover {
	display: inline-block;
	text-decoration: none;
	color: inherit;
}

.flex {
	display: flex;
}

.no-padding {
	padding: 0;
}

.section-padding {
	padding: 60px 0;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0 0 15px;
	font-weight: 700;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none
}

p {
	font-size: 15px;
	color: #a3a3a3;
	line-height: 1.6;
	word-spacing: 1px;
	margin: 0;
}

body {
	font-family: 'Noto Sans', sans-serif;
	font-size: 14px;
	line-height: 1.4;
}

a {
	text-decoration: none;
	color: #111;
}

/*  Start Nav CSs */
.navbar.navbar-expand-lg.nav_area.sticky {
	transition: all .6s;
}

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

#sub {
	border: none;
	background:;
}

.cut {
	height: 500px;
	overflow: auto;
	width: 800px;
	padding-bottom: 30px;
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
	box-shadow: 1px 1px 1px rgba(231, 231, 231, 0.7);
	display: inline-block;
}

.dv {
	display: inline-block;
}

.heart {
	text-align: right;
	margin-right: 20%;
}

.top {
	
}
#btn{
	background: white;
	border: 1px solid #EAEAEA;
	border-radius: 15%;
	padding: 5px;
	text-decoration: none;
}
#choose{
    position: sticky;
    top:0;
}
#btn:active{
box-shadow: inset -.3rem -.1rem 1.4rem #FBFBFB,
			inset .3rem .4rem .8rem #BEC5D0;
			cursor: pointer;
}
</style>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="<%=request.getContextPath()%>/resources/assets/css/main.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
$(function(){
	var likes = ${likeInfo.likes} /* 좋아요 기능 시작 */
	var bnum = ${likeInfo.b_num}
	var mnum = ${likeInfo.m_num}
	
	if (likes > 0) {
	    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart2.png");
	} else {
	    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart.png");
	}

    $("#heart").click(function(){   /* 하트 클릭했을 때 */

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

    $(".reply").click(function() {               /* 댓글 클릭했을 때 시작 */ 
        var ref = $(this).data("ref");
        var reStep = $(this).data("re_step");
        var reLevel = $(this).data("re_level");
        var bNum = $(this).data("b_num");

        $(".reply2").hide();
        $(".reply2").each(function() {
            if (
                $(this).data("ref") == ref &&
                $(this).data("re_step") == reStep &&
                $(this).data("re_level") == reLevel &&
                $(this).data("b_num") == bNum
            ) {
                $(this).show();
            }
        });
    });											/* 댓글 클릭했을 때 종료 */
						
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
                    location.href = "boardDetail.bd?num=" + bNum;
                } else {
                    alert("삭제 실패했습니다.");
                    location.href = "boardDetail.bd?num=" + bNum;
                }
            }
        });
    });											/* 댓글 삭제 종료 */
    
    $(".replyUpdate").click(function() {               /* 댓글 클릭했을 때 시작 */ 
        var ref = $(this).data("ref");
        var reStep = $(this).data("re_step");
        var reLevel = $(this).data("re_level");
        var bNum = $(this).data("b_num");

        $(".replyUpdate2").hide();
        $(".replyUpdate2").each(function() {
            if (
                $(this).data("ref") == ref &&
                $(this).data("re_step") == reStep &&
                $(this).data("re_level") == reLevel &&
                $(this).data("b_num") == bNum
            ) {
                $(this).toggle();
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
	});
</script>


<nav class="navbar navbar-expand-xl nav_area sticky">
	<div class="container">
		<div class="logo">
			<a href="" class="logo-light">나만 믿고 따라와!</a>
		</div>
		<div class="collapse navbar-collapse " id="navbarNav">
			<ul class="navbar-nav ml-auto navbar-center main_menu onepage_nav">
				<li class="nav-item active"><a class="nav-link" href="#home">메인</a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="boardList.bd">목록보기</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#contact">관리자</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<div class="top" style="display: inline-block; width: 100%; margin-top: 20px; background: #EAEAEA;" align="center">
	<div style="width: 200px; display: inline-block;">
		<img class="img"
			src="<%=request.getContextPath()%>/resources/images/${bb.image}">
	</div>
	<div
		style="display: inline-block; vertical-align: top; margin-left: 20px;">
		<h5>
			${bb.writer}님의 여행일지<br> ${bb.title}<br> 3일 |
			<fmt:parseDate var="startDate" value="${bb.reg_date}"
				pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
			~
			<fmt:parseDate var="endDate" value="${bb.reg_date}"
				pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
		</h5>
		<hr>
		<div id="content"
			style="width: 600px; height: 100px; margin-top: 10px;">
			${bb.content}</div>
	</div>
</div>

<br>
<br>
<div class="heart">
	조회수 ${bb.readcount}&nbsp;&nbsp; 좋아요 ${likecount} <img id="heart"
		width="20px" height="20px">
</div>
<center>
	<div>
		<br>

		<div id="choose">
		<c:set var="count" value="0"/>
		<c:forEach var="chat2" items="${lists}">
		<c:set var="count" value="${count+1}"/>
			<a href="#${chat2.chatnum}" id="btn">
			<font color="#BDBDBD">
			<h5>${chat2.chatnum}Day</h5>
			</font></a>&nbsp;&nbsp;
		<c:if test="${count % 20 == 0}"><br><br></c:if>
							</c:forEach>
		</div>
		<c:forEach var="ch" items="${lists}">
		<br><br>
		<div  id="${ch.chatnum}">
		<section>
			<h2>${ch.chatnum}Day</h2>
		</section>
			<div>
				<div style="display: inline-block;">
					<img
						src="<%=request.getContextPath()%>/resources/images/${bb.image}"
						width="100px" height="100px" style="border-radius: 30%">
				</div>
				<div style="display: inline-block;">
					${ch.writer}<br> ${ch.content}
				</div>
			</div>
		</div>
		</c:forEach>
	<br>
	<hr color="#D5D5D5">
	<div style="padding-top: 30px;">
		<form action="chatInsert.bd">
			<input type="hidden" name="b_num" value="${bb.num}"> <input
				type="hidden" name="writer" value="홍씨">
			<textarea id="chat" rows="1" cols="38" name="content"
				placeholder="글 남기기" style="resize: none;"></textarea>
			<input id="sub" type="submit" value="확인">
		</form>
	</div>
	<br> <br>
	<div class="cut" style="width: 60%;">
		<table>
			<c:forEach var="chat" items="${lists}">
				<tr>
					<td>
						<div class="total">
							<c:if test="${chat.re_level > 0}">
								<img
									src="<%=request.getContextPath()%>/resources/images/blank.png"
									width="${chat.re_level * 20}" height="30px;">
								<img src="<%=request.getContextPath()%>/resources/images/re.png"
									width="30px">
							</c:if>
							<div class="dv">
								${chat.writer}
								<fmt:parseDate var="date" value="${chat.reg_date}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
								<div class="content">${chat.content}
									<br>
									<br>
								</div>
								<a class="reply" data-ref="${chat.ref}"
									data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
									data-b_num=${chat.b_num }> 답글 </a>
							</div>
							<div class="updel">
								<span class="replyDelete" data-ref="${chat.ref}"
									data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
									data-b_num=${chat.b_num }> 삭제 </span> &nbsp;&nbsp; <span
									class="replyUpdate" data-ref="${chat.ref}"
									data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
									data-b_num=${chat.b_num }> 수정 </span>
							</div>
						</div> <span class="reply2" style="display: none;"
						data-ref="${chat.ref}" data-re_step="${chat.re_step}"
						data-re_level="${chat.re_level}" data-b_num=${chat.b_num }>
							<form action="replyInsert.bd">
								<input type="hidden" name="b_num" value="${bb.num}"> <input
									type="hidden" name="writer" value="홍씨"> <input
									type="hidden" name="ref" value="${chat.ref}"> <input
									type="hidden" name="re_level" value="${chat.re_level}">
								<input type="hidden" name="re_step" value="${chat.re_step}">
								<br>
								<textarea id="chat" rows="1" cols="38" name="content"
									placeholder="답글쓰기" style="resize: none;" maxlength="500"></textarea>
								<input id="sub" type="submit" value="확인">
							</form>
					</span> <span class="replyUpdate2" style="display: none;"
						data-ref="${chat.ref}" data-re_step="${chat.re_step}"
						data-re_level="${chat.re_level}" data-b_num=${chat.b_num }>
							<form action="replyUpdate.bd">
								<input type="hidden" name="b_num" value="${bb.num}"> <input
									type="hidden" name="writer" value="홍씨"> <input
									type="hidden" name="ref" value="${chat.ref}"> <input
									type="hidden" name="re_level" value="${chat.re_level}">
								<input type="hidden" name="re_step" value="${chat.re_step}">
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
</center>
<div style="height: 50px"></div>
