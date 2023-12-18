package myjourney.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import myjourney.model.MyJourneyDao;
 
@Controller
public class MyjourneyDeleteController {
	private final String command = "myJourneyDelete.mj";
	private final String gotoPage = "redirect:myjourneyList.mj";
	
	@Autowired
	private MyJourneyDao myJourneyDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String mjDelete(@RequestParam("jnum") int jnum,
							@RequestParam("day") String day,
							@RequestParam("date") String date,
							@RequestParam("jdate") String jdate,
							HttpSession session){
		
		
		myJourneyDao.deleteMyjourney(jnum);
		
		String sTravel = (String) session.getAttribute("sTravel");
		System.out.println("session sTravel:"+sTravel);
		
		return gotoPage+"?day="+day+"&date="+date+"&jdate="+jdate+"&sTravel="+sTravel;
	}
	
}
