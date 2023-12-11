package main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import hotel.model.HotelBean;
import hotel.model.HotelDao;
import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;
import spot.model.SpotBean;
import spot.model.SpotDao;
import utility.Paging;

@Controller
public class MainController {
	@Autowired
	CafeDao cafeDao;
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	SpotDao spotDao;
	
	String command = "/mainTravel.m";
	@RequestMapping(value = "mainTravel.m")
	public String hotelList(HttpServletRequest request, HttpSession session,
			@RequestParam(value ="whatColumn", required = false)String whatColumn,
			@RequestParam(value ="keyword", required = false)String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber
			) {
		request.setAttribute("date", request.getParameter("date"));
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String pageSize = "6";
		
		String url = request.getContextPath()+command;
		
		//카페		
		int cafeTotal= cafeDao.getTotalCount(map);
		
		Paging cafePage = new Paging(pageNumber, pageSize, cafeTotal, url, whatColumn, keyword);
		
		List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);
		
		//음식
		int restaurantTotal = restaurantDao.totalCount(map);
		
		Paging restaurantPage = new Paging(pageNumber, null, restaurantTotal, url, whatColumn, keyword);
		List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);
		
		//호텔
	      int hoteltotal = hotelDao.totalCount(map);
	      
	      Paging hotelPage = new Paging(pageNumber, pageSize, hoteltotal, url, whatColumn, keyword);
	      
	      List<HotelBean> hotelList = hotelDao.getAllHotel(map, hotelPage);
		
		//관광지
	  	int sptTotal= spotDao.totalCount(map);
		
		Paging spotPaging = new Paging(pageNumber, pageSize, sptTotal, url, whatColumn, keyword);
		List<SpotBean> spotList = spotDao.spotList(map, spotPaging);
		
		request.setAttribute("spotPage", spotPaging);
		request.setAttribute("restaurantPage", restaurantPage);
		request.setAttribute("cafePage", cafePage);
		request.setAttribute("hotelPage", hotelPage);
		
		request.setAttribute("spotList", spotList);
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("restaurantList", restaurantList);
		request.setAttribute("cafeList", cafeList);
		return "mainTravel";
	}
	@RequestMapping(value = "mainScreen.m")
	public String mainScreen() {
		
		return "mainScreen";
	}
	@RequestMapping(value = "mainCalender.m")
	public String mainCalender() {
		
		return "mainCalender";
	}
}
