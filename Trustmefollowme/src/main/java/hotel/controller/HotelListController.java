package hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HotelListController {

	private final String command = "/hotelList.ht";
	private final String viewPage = "hotelListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String hotelList() {
		
		return viewPage;
	}
}
