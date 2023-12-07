package spot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spot.model.SpotBean;
import spot.model.SpotDao;

@Controller
public class SpotDetailController {

	private final String command = "/spotDetail.sp";
	private final String viewPage = "spDetailForm";
	
	@Autowired
	private SpotDao spotDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restDetail(@RequestParam("snum") String snum,HttpServletRequest request) {
		
		SpotBean sb = spotDao.spotDetail(snum);
		request.setAttribute("sb", sb);
		return viewPage;
		
	}
}