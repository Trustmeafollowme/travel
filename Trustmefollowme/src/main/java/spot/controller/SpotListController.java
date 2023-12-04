package spot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SpotListController {

	private final String command = "/spotList.sp";
	private final String viewPage = "spotListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String spotList() {
		
		return viewPage;
	}

}
