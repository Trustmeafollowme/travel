<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String hotel = request.getContextPath()+"/hotelList.ht";
	String member = request.getContextPath()+"/memberList.mb";
	String cafe = request.getContextPath()+"/cafeList.cf";
	String board = request.getContextPath()+"/boardList.bd";
	String myhotel = request.getContextPath()+"/myhotelList.mh";
	String myjourney = request.getContextPath()+"/myjourneyList.mj";
	String restaurant = request.getContextPath()+"/restaurantList.re";
	String spot = request.getContextPath()+"/spotList.sp";
%>

<a href="hotelList.ht">호텔</a><br><br>
<a href="memberList.mb">사용자</a><br><br>
<a href="cafeList.cf">카페</a><br><br>
<a href="boardList.bd">게시판</a><br><br>
<a href="myhotelList.mh">나의호텔</a><br><br>
<a href="myjourneyList.mj">여행플랜</a><br><br>
<a href="restaurantList.re">음식점</a><br><br>
<a href="spotList.sp">관광명소</a><br><br>