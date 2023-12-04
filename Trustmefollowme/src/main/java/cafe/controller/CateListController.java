package cafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CateListController {

	private final String command = "/cafeList.cf";
	private final String viewPage = "cafeListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String cafeList() {
		
		return viewPage;
	}
	
}
