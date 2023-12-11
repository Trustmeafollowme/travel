package hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelDao;

@Controller
public class HotelDeleteController {
	private final String command = "hotelDelete.ht"; 
	private final String gotoPage ="redirect:/hotelList.ht";
@Autowired
@Qualifier("hotelDao")
private HotelDao hotelDao;

@RequestMapping(value=command)
public String delete(@RequestParam("hnum")int hnum,
					@RequestParam("pageNumber")String pageNumber,HttpServletResponse response){
	
	hotelDao.deleteHotel(hnum);
	
	return gotoPage+"?pageNumber="+pageNumber;
	}

}
