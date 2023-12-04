package myjourney.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyjourneyListController {

	private final String command = "/myjourneyList.mj";
	private final String viewPage = "myjourneyListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String myjourneyList() {
		
		return viewPage;
	}
}
