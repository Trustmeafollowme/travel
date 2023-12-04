package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardListController {

	private final String command = "/boardList.bd";
	private final String viewPage = "boardListForm";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardList() {
		
		return viewPage;
	}
}
