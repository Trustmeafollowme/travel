package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberListController {

	private final String command = "/memberList.mb";
	private final String viewPage = "memberListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String memberList() {
		
		return viewPage;
	}
}
