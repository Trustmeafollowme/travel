package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MainJourneyController {
	@Autowired
	MyJourneyDao memberDao;
	
	@RequestMapping("mainJourney.m")
	public String mainJourney(HttpServletRequest request,HttpSession session) {
		
		String id=(String)session.getAttribute("myemail");
		//int myjNum=(Integer)session.getAttribute("myjNum");
		MemberBean mb= new MemberBean();
		//mb.setMyjNum(myjNum);
		mb.setEmail(id);
		List<MyJourneyBean> myjList=memberDao.myjSelect(mb);
		request.setAttribute("myemail", id);
		request.setAttribute("list", myjList);
	return "mainJourney";	
	}
}
