package myjourney.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import myjourney.model.MyJourneyDao;

@Controller
public class MyJourneySaveController {
	private final String command = "saveMyjourney.mj";
	private final String gotoPage = "redirect:mainScreen.m";
	
	@Autowired
	private MyJourneyDao myJourneyDao;
	
	@RequestMapping(command)
	public String saveMJ(HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		String id = (String) session.getAttribute("myemail");
		System.out.println("saveMJ id:"+id);
 		
		int tCheck = myJourneyDao.searchTurnMore(id);
		System.out.println("saveMJ tCheck:"+tCheck);
		if(tCheck > 0) {
			myJourneyDao.updateMJList(id);
		}
		int cnt = myJourneyDao.saveMyJourney(id);
		if (cnt > 0) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write("<script>alert('여정을 저장했습니다.');</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return gotoPage;
	}
}
