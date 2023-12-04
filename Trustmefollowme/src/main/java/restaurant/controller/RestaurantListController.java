package restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestaurantListController {

	private final String command = "/restaurantList.re";
	private final String viewPage = "restaurantListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restaurantList() {
		
		return viewPage;
	}
}
