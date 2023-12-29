package restaurant.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import restaurant.model.RestaurantDao;

@Controller
public class RestaurantDeleteController {

	private final String command = "/restDelete.re";
	private final String viewPage = "redirect:/restList.re";
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restDelete(@RequestParam("rnum") int rnum) {
		
		restaurantDao.restDelete(rnum);
		
		return viewPage;
	}
}
