package spot.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import spot.model.SpotBean;
import spot.model.SpotDao;

@Controller
public class SpotDeleteController {
	private final String command = "spotDelete.sp";
	private final String gotoPage = "redirect:mainSpotList.sp";
	
	@Autowired
	private SpotDao  spotdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String spotDelete(@RequestParam("snum") int snum) {

		
		spotdao.deleteSpot(snum);
		
		return gotoPage;
	}
}
