package main.controller;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import hotel.model.HotelBean;
import hotel.model.HotelDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;
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

	
	String sTravel2;
	
	private final String command = "/mainTravel.m";
	@RequestMapping(value = command)
	public String hotelList(HttpServletRequest request,HttpSession session,
			@RequestParam(value ="whatColumn", required = false)String whatColumn,
			@RequestParam(value ="keyword", required = false)String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "sTravel", required = false) String sTravel,
			@RequestParam(value = "day", required = false) String day, 
			@RequestParam(value = "date", required = false) String date, 
			@RequestParam(value = "jdate", required = false) String jdate,
			Model model, RedirectAttributes rttr
			) {

		if(sTravel.equals("auto")) {
			if(request.getParameter("date")==null) {
				String date1 = (String)session.getAttribute("date");
				request.setAttribute("date", date1);
				}
				else {
				request.setAttribute("date", request.getParameter("date"));
				}
				Map<String, String> map = new HashMap<String, String>();
				map.put("whatColumn", whatColumn);
				map.put("keyword", "%"+keyword+"%");
				
				String pageSize = "30";
				
				String url = request.getContextPath()+command;
				
				//cafe		
				int cafeTotal= cafeDao.getTotalCount(map);
				
				Paging cafePage = new Paging(pageNumber, pageSize, cafeTotal, url, whatColumn, keyword);
				
				List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);
				
				//restaurant
				int restaurantTotal = restaurantDao.totalCount(map);
				
				Paging restaurantPage = new Paging(pageNumber, null, restaurantTotal, url, whatColumn, keyword);
				List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);
				System.out.println(restaurantList.get(0).getXpos()+restaurantList.get(0).getYpos());
				//hotel
			      int hoteltotal = hotelDao.totalCount(map);
			      
			      Paging hotelPage = new Paging(pageNumber, pageSize, hoteltotal, url, whatColumn, keyword);
			      
			      List<HotelBean> hotelList = hotelDao.getAllHotel(map, hotelPage);
				
				//spot
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
		}else {
		
			  if(sTravel == null) {
			         System.out.println("sTravel is null");
			         sTravel = (String) session.getAttribute("sTravel");
			         System.out.println("session sTravel:"+sTravel);
			      }else {
			         session.setAttribute("sTravel", sTravel);
			      }
			      
			      if(request.getParameter("date")==null) {
			         date = (String)session.getAttribute("date");
			         request.setAttribute("date", date);
			      }
			      else {
			         request.setAttribute("date", request.getParameter("date"));
			      }
			      Map<String, String> map = new HashMap<String, String>();
			      map.put("whatColumn", whatColumn);
			      map.put("keyword", "%"+keyword+"%");

			      String pageSize = "6";

			      String url = request.getContextPath()+command;

			      //cafe      
			      int cafeTotal= cafeDao.getTotalCount(map);

			      Paging cafePage = new Paging(pageNumber, pageSize, cafeTotal, url, whatColumn, keyword);

			      List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);

			      //restaurant
			      int restaurantTotal = restaurantDao.totalCount(map);

			      Paging restaurantPage = new Paging(pageNumber, null, restaurantTotal, url, whatColumn, keyword);
			      List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);

			      //hotel
			      int hoteltotal = hotelDao.totalCount(map);

			      Paging hotelPage = new Paging(pageNumber, pageSize, hoteltotal, url, whatColumn, keyword);

			      List<HotelBean> hotelList = hotelDao.getAllHotel(map, hotelPage);

			      //spot
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
			      
			      
			      System.out.println("sTravel:"+sTravel);
			      
			      if(sTravel.equals("auto")) {
			         return "mainTravel";
			      }else {
			         Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			         if(flashMap != null) {
			            List<MyJourneyBean> mlists = (List<MyJourneyBean>) flashMap.get("mlists");
			            model.addAttribute("mlists", mlists);
			         }
			         
			         System.out.println("date:"+date);
			         
			         String[] days = date.split(" ");
			         model.addAttribute("days", days);
			         
			         if(jdate == null) {
			            day = "1";
			            jdate = days[0];
			         }
			         
			         model.addAttribute("day", day);
			         model.addAttribute("date", date);
			         model.addAttribute("jdate", jdate);
			         model.addAttribute("sTravel", sTravel);
			         
			         
			         return "mainTravel2";
		}
			      }
	}
	
	@RequestMapping(value = "mainScreen.m")
	public String mainScreen(HttpSession session,HttpServletRequest request) {
		String myemail =(String)session.getAttribute("myemail");
		request.setAttribute("myemail", myemail);
		return "mainScreen";
	}
	@RequestMapping(value = "mainCalender.m")
	public String mainCalender(HttpSession session) {
		if(session.getAttribute("myemail")==null) {
			return "redirect:login.mb";
		}
		return "mainCalender";
	}
	

}
