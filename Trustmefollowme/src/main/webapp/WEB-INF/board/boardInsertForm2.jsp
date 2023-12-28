<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">
html{
   scroll-behavior: smooth;
}
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

#btn2 {
   box-shadow: inset 0px 1px 0px 0px #ffffff;
   background: linear-gradient(to bottom, #DAD9FF 5%, #f6f6f6 100%);
   background-color: #ffffff;
   border-radius: 80%;
   border: 1px solid #dcdcdc;
   display: inline-block;
   cursor: pointer;
   color: #666666;
   font-family: Arial;
   font-size: 15px;
   font-weight: bold;
   padding: 10px 13px 10px 10px;
   text-decoration: none;
   text-shadow: 0px 1px 0px #ffffff;
   width: 70px;
}

#btn2:hover {
   background: linear-gradient(to bottom, #f6f6f6 5%, #D9E5FF 100%);
}

#btn2:active {
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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
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
         maxlength="20" value="${boardBean.title}">
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



   <nav id="nav" style="width: 100%; padding-bottom: 5px; position: sticky; top: 0px;">
      <ul>
      <li>
      <c:forEach var="date" items="${fn:split(date,',')}">
                     <li><a id="date" href="#${date}" class="active">${date}일</a></li>
            </c:forEach>
      </li>
      </ul>
   </nav>
   <div align="right" style="position: sticky; top: 75px; margin-right: 150px;"><a href="#" id="btn2">위로↑</a></div>

   <div style="margin-top: 30px; margin-bottom: 30px;">
      <div id="date">${minDate}일~ ${maxDate}일</div>
   </div>
<c:set var="count" value="0"/>
            <c:forEach var="myj" items="${list}" varStatus="a">
            <c:if test="${myj.turn eq 1}">
            <c:set var="count" value="${count+1}"/>
            <h1 id="${myj.jdate }" style="padding-top: 50px; padding-bottom: 15px;">${count}Day</h1>
            </c:if>
               <div align="left" style="margin-bottom: 50px;">
               <div style="display: inline-block; margin-left: 660px;">
                  <img alt="" src="<%=request.getContextPath()%>/resources/images/${myj.image}" 
                  width="200px" height="200px">
               </div>
               <div style="display: inline-block; margin-left: 100px;">
                  <h4>
                     <a href="">${myj.name}</a>
                  </h4>
                  <br>
                  <h5>${myj.address}</h5>
                  <br><br><br>
               </div>
               </div>
            </c:forEach>
</center>
   
           <script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.min.js"></script>
         <script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrollex.min.js"></script>
         <script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrolly.min.js"></script>
         <script src="<%=request.getContextPath()%>/resources/assets/js2/browser.min.js"></script>
         <script src="<%=request.getContextPath()%>/resources/assets/js2/breakpoints.min.js"></script>
         <script src="<%=request.getContextPath()%>/resources/assets/js2/main.js"></script>
   
   
   
         